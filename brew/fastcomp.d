module brew.fastcomp;

import std.ascii;
import std.string;
import std.conv;
import std.stdio;
import brew.vm;

private enum Opcode[string] binops = [
    "add": opadd,
    "sub": opsub,
    "mul": opmul,
    "div": opdiv,
    "mod": opmod,
    "pow": oppow,
];

private enum Opcode[string] cmpops = [
    "lt": opblt,
    "eq": opbeq,
];

struct FastParseState
{
    string src;
    size_t line;
    size_t col;

    this(string str)
    {
        src = str;
        line = 1;
        col = 1;
    }

    void skip()
    {
        if (src[0] == '\n')
        {
            line += 1;
            col = 1;
        }
        else
        {
            col += 1;
        }
        src = src[1 .. $];
    }

    bool done()
    {
        return src.length == 0;
    }

    char first()
    {
        assert(!done);
        return src[0];
    }

    char read()
    {
        char ret = first;
        skip;
        return ret;
    }
}

struct Binding
{
    string name;
    bool isFunc;
    Binding[] args;

    static Binding none()
    {
        return Binding(null);
    }

    this(string name)
    {
        this.name = name;
        this.isFunc = false;
    }

    this(string name, Binding[] args)
    {
        this.name = name;
        this.isFunc = true;
        this.args = args;
    }

    void toString(void delegate(string) sink)
    {
        sink(name);
        foreach (arg; args)
        {
            sink(" ");
            arg.toString(sink);
        }
    }
}

struct FastParser
{
    size_t nregs;
    size_t[string] funcs;
    size_t[string] locals;

    Opcode[] ops;

    Binding[string] defs;
    FastParseState state;

    void skipSpace()
    {
        while (true)
        {
            if (state.done)
            {
                break;
            }
            if (state.first.isWhite)
            {
                state.skip;
                continue;
            }
            if (state.first == '#')
            {
                state.skip;
                assert(!state.done, "unclosed comment");
                while (state.first != '#')
                {
                    state.skip;
                    assert(!state.done, "unclosed comment");
                }
                state.skip;
                continue;
            }
            break;
        }
    }

    string readName()
    {
        skipSpace;
        string ret;
        while (!state.done)
        {
            char first = state.first;
            if (!first.isAlphaNum && first != '-' && first != '_')
            {
                break;
            }
            ret ~= state.read;
        }
        return ret;
    }

    Binding[] readArgArray()
    {
        skipSpace;
        Binding[] args;
        while (true)
        {
            skipSpace;
            assert(!state.done, "toplevel: file ended when reading function definition arguments");
            if (state.first == ')')
            {
                state.skip;
                break;
            }
            if (state.first == '(')
            {
                state.skip;
                string name = readName; 
                args ~= Binding(name, readArgArray);
            }
            else
            {
                string name = readName;
                skipSpace;
                args ~= Binding(name);
            }
        }
        return args;
    }

    size_t emitIdent(string name)
    {
        if (size_t* ptr = name in locals)
        {
            return *ptr;
        }
        else
        {
            size_t outreg = nregs++;
            ops ~= [opint, outreg, funcs[name]];
            return outreg;
        }
    }

    size_t readExprMatch(Binding type)
    {
        skipSpace;
        assert(!state.done, "expected expression at end of file");
        if (state.first == '\'')
        {
            state.skip;
            assert(!state.done, "expected char literal at end of file");
            char chr = state.read;
            if (chr == '\\')
            {
                assert(!state.done, "expected escape sequence");
                chr = state.read;
                switch (chr)
                {
                default:
                    break;
                case 't':
                    chr = '\t';
                    break;
                case 'n':
                    chr = '\n';
                    break;
                case 'r':
                    chr = '\r';
                    break;
                }
            }
            if (!state.done && state.first == '\'')
            {
                state.skip;
            }
            size_t outreg = nregs++;
            ops ~= [opint, outreg, cast(size_t) chr];
            return outreg;
        }
        bool startsOpenParen = false;
        while (state.first == '(')
        {
            startsOpenParen = true;
            state.skip;
            skipSpace;
            assert(!state.done, "expected expression after paren at end of file");
        }
        string name = readName;
        scope (exit)
        {
            if (startsOpenParen)
            {
                skipSpace;
                assert(!state.done && state.first == ')', "expected close paren at end of expression");
                state.skip;
                skipSpace;
            }
        }
        if (startsOpenParen)
        {
            skipSpace;
            if (!state.done && state.first == ')')
            {
                type.isFunc = true;
            }
        }
        assert(name.length != 0, "epxression expected");
        switch (name)
        {
        case "or":
            size_t lhs = readExprMatch(Binding.none);
            size_t outreg = nregs++;
            ops ~= [opbeqi, lhs, 0];
            size_t jzero = ops.length++;
            size_t jnonzero = ops.length++;
            ops[jnonzero] = ops.length;
            ops ~= [opreg, outreg, lhs];
            ops ~= opjump;
            size_t jout = ops.length++;
            ops[jzero] = ops.length;
            size_t rhs = readExprMatch(Binding.none);
            ops ~= [opreg, outreg, rhs];
            ops[jout] = ops.length;
            return outreg;
        case "and":
            size_t lhs = readExprMatch(Binding.none);
            size_t outreg = nregs++;
            ops ~= [opbeqi, lhs, 0];
            size_t jzero = ops.length++;
            size_t jnonzero = ops.length++;
            ops[jzero] = ops.length;
            ops ~= [opint, outreg, 0];
            ops ~= opjump;
            size_t jout = ops.length++;
            ops[jnonzero] = ops.length;
            size_t rhs = readExprMatch(Binding.none);
            ops ~= [opreg, outreg, rhs];
            ops[jout] = ops.length;
            return outreg;
        case "do":
            readExprMatch(Binding.none);
            return readExprMatch(type);
        case "if":
            size_t branch = readExprMatch(Binding.none);
            ops ~= [opbb, branch];
            size_t jfalse = ops.length++;
            size_t jtrue = ops.length++;
            size_t outreg = nregs++;
            ops[jtrue] = ops.length;
            size_t vtrue = readExprMatch(Binding.none);
            ops ~= [opreg, outreg, vtrue];
            ops ~= opjump;
            size_t jend = ops.length++;
            ops[jfalse] = ops.length;
            size_t vfalse = readExprMatch(Binding.none);
            ops ~= [opreg, outreg, vfalse];
            ops[jend] = ops.length;
            return outreg;
        case "let":
            string let = readName;
            size_t where = readExprMatch(Binding.none);
            defs[let] = Binding.none;
            locals[let] = where;
            size_t ret = readExprMatch(type);
            defs.remove(let);
            locals.remove(let);
            return ret;
        default:
            if ('0' <= name[0] && name[0] <= '9')
            {
                size_t outreg = nregs++;
                ops ~= [opint, outreg, name.to!size_t];
                return outreg;
            }
            else if (type.isFunc)
            {
                return emitIdent(name);
            }
            else
            {
                return readCall(name);
            }
        }
    }

    size_t readCall(string name)
    {
        Binding argTypes = defs[name];
        if (argTypes.isFunc)
        {
            size_t[] argValues;
            foreach (argType; argTypes.args)
            {
                argValues ~= readExprMatch(argType);
            }
            size_t outreg = nregs++;
            if (size_t* ptr = name in locals)
            {
                ops ~= [opcalldyn, outreg, *ptr, argValues.length];
                ops ~= argValues;
            }
            else if (size_t* ptr = name in funcs)
            {
                ops ~= [opcall, outreg, *ptr, argValues.length];
                ops ~= argValues;
            }
            else if (size_t* opptr = name in binops)
            {
                ops ~= [*opptr, outreg, argValues[1], argValues[0]];
            }
            else if (size_t* opcmp = name in cmpops)
            {
                ops ~= [*opcmp, argValues[1], argValues[0]];
                size_t jfalse = ops.length++;
                size_t jtrue = ops.length++;
                ops[jfalse] = ops.length;
                ops ~= [opint, outreg, 0];
                ops ~= opjump;
                size_t end = ops.length++;
                ops[jtrue] = ops.length;
                ops ~= [opint, outreg, 1];
                ops[end] = ops.length;
            }
            else
            {
                if (name == "putchar")
                {
                    ops ~= opputchar;
                    ops ~= argValues[0];
                    return argValues[0];
                }
                else if (name == "lt")
                {
                }
                else if (name == "eq")
                {
                    ops ~= [opbeq, argValues[1], argValues[0]];
                    size_t jfalse = ops.length++;
                    size_t jtrue = ops.length++;
                    ops[jfalse] = ops.length;
                    ops ~= [opint, outreg, 0];
                    ops ~= opjump;
                    size_t end = ops.length++;
                    ops[jtrue] = ops.length;
                    ops ~= [opint, outreg, 1];
                    ops[end] = ops.length;
                }
            }
            return outreg;
        }
        else
        {
            return emitIdent(name);
        }
    }

    void readDef()
    {
        skipSpace;
        assert (state.first == '(');
        state.skip;
        string fname = readName;
        assert(fname.length != 0);
        Binding[] vals = readArgArray;
        defs[fname] = Binding(fname, vals);
        foreach (val; vals)
        {
            defs[val.name] = val;
        }
        skipSpace;
        if (state.first == '?')
        {
            state.skip;
        }
        else
        {
            ops ~= opfunc;
            size_t jover = ops.length++;
            ops ~= vals.length;
            ops ~= fname.length;
            foreach (chr; fname)
            {
                ops ~= cast(size_t) chr;
            }
            size_t nregswhere = ops.length++;
            funcs[fname] = ops.length;
            nregs = 1;
            locals = null;
            foreach (arg; vals) 
            {
                locals[arg.name] = nregs;
                nregs += 1;
            }
            size_t rr = readExprMatch(Binding.none);
            ops ~= [opret, rr];
            ops[nregswhere] = nregs;
            ops[jover] = ops.length;
        }
    }

    void readDefs()
    {
        while (true)
        {
            skipSpace;
            if (state.done)
            {
                break;
            }
            readDef;
        }
        ops ~= [opcall, 0, funcs["main"], 0, opexit];
    }
}
