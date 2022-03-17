module fastcomp;

import std.ascii;
import std.file;
import std.stdio;
import std.string;
import std.conv;
import std.stdio;

enum opexit = 0;
enum opreg = 1;
enum opbb = 2;
enum opint = 3;
enum opjump = 4;
enum opfunc = 5;
enum opadd = 6;
enum opsub = 7;
enum opmul = 8;
enum opdiv = 9;
enum opmod = 10;
enum oppow = 11;
enum opcall = 12;
enum opret = 13;
enum opputchar = 14;
enum opstring = 15;
enum oplength = 16;
enum opget = 17;
enum opset = 18;
enum opdump = 19;
enum opread = 20;
enum opwrite = 21;
enum oparray = 22;
enum opcat = 23;
enum opbeq = 24;
enum opblt = 25;
enum opaddi = 26;
enum opsubi = 27;
enum opmuli = 28;
enum opdivi = 29;
enum opmodi = 30;
enum opcall0 = 31;
enum opcall1 = 32;
enum opcall2 = 33;
enum opcall3 = 34;
enum opgeti = 35;
enum opseti = 36;
enum opbeqi = 37;
enum opblti = 38;
enum opbltei = 39;
enum opcalldyn = 40;

alias Opcode = int;

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

struct Parser
{
    string src;
    Opcode nregs;
    Opcode[string] funcs;
    Opcode[string] locals;

    Opcode offset;
    Opcode[] ops;

    Binding[string] defs;

    void skip()
    {
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

    void skipSpace()
    {
        while (true)
        {
            if (done)
            {
                break;
            }
            if (first.isWhite)
            {
                skip;
                continue;
            }
            if (first == '#')
            {
                skip;
                assert(!done, "unclosed comment");
                while (first != '#')
                {
                    skip;
                    assert(!done, "unclosed comment");
                }
                skip;
                continue;
            }
            break;
        }
    }

    string readName()
    {
        skipSpace;
        string ret;
        while (!done)
        {
            char first = first;
            if (!first.isAlphaNum && first != '-' && first != '_')
            {
                break;
            }
            ret ~= read;
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
            assert(!done, "toplevel: file ended when reading function definition arguments");
            if (first == ')')
            {
                skip;
                break;
            }
            if (first == '(')
            {
                skip;
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

    Opcode emitIdent(string name)
    {
        if (Opcode* ptr = name in locals)
        {
            return *ptr;
        }
        else
        {
            Opcode outreg = nregs++;
            ops ~= [opint, outreg, funcs[name]];
            return outreg;
        }
    }


    Opcode opLength()
    {
        return offset + cast(Opcode) ops.length;
    }

    Opcode readExprMatch(Binding type)
    {
        skipSpace;
        assert(!done, "expected expression at end of file");
        if (first == '\'')
        {
            skip;
            assert(!done, "expected char literal at end of file");
            char chr = read;
            if (chr == '\\')
            {
                assert(!done, "expected escape sequence");
                chr = read;
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
            if (!done && first == '\'')
            {
                skip;
            }
            Opcode outreg = nregs++;
            ops ~= [opint, outreg, cast(Opcode) chr];
            return outreg;
        }
        bool startsOpenParen = false;
        while (first == '(')
        {
            startsOpenParen = true;
            skip;
            skipSpace;
            assert(!done, "expected expression after paren at end of file");
        }
        string name = readName;
        scope (exit)
        {
            if (startsOpenParen)
            {
                skipSpace;
                assert(!done && first == ')', "expected close paren at end of expression");
                skip;
                skipSpace;
            }
        }
        if (startsOpenParen)
        {
            skipSpace;
            if (!done && first == ')')
            {
                type.isFunc = true;
            }
        }
        assert(name.length != 0, "epxression expected");
        switch (name)
        {
        case "or":
            Opcode lhs = readExprMatch(Binding.none);
            Opcode outreg = nregs++;
            ops ~= [opbeqi, lhs, 0];
            Opcode jzero = cast(Opcode) ops.length++;
            Opcode jnonzero = cast(Opcode) ops.length++;
            ops[jnonzero] = opLength;
            ops ~= [opreg, outreg, lhs];
            ops ~= opjump;
            Opcode jout = cast(Opcode) ops.length++;
            ops[jzero] = opLength;
            Opcode rhs = readExprMatch(Binding.none);
            ops ~= [opreg, outreg, rhs];
            ops[jout] = opLength;
            return outreg;
        case "and":
            Opcode lhs = readExprMatch(Binding.none);
            Opcode outreg = nregs++;
            ops ~= [opbeqi, lhs, 0];
            Opcode jzero = cast(Opcode) ops.length++;
            Opcode jnonzero = cast(Opcode) ops.length++;
            ops[jzero] = opLength;
            ops ~= [opint, outreg, 0];
            ops ~= opjump;
            Opcode jout = cast(Opcode) ops.length++;
            ops[jnonzero] = opLength;
            Opcode rhs = readExprMatch(Binding.none);
            ops ~= [opreg, outreg, rhs];
            ops[jout] = opLength;
            return outreg;
        case "do":
            readExprMatch(Binding.none);
            return readExprMatch(type);
        case "if":
            Opcode branch = readExprMatch(Binding.none);
            ops ~= [opbb, branch];
            Opcode jfalse = cast(Opcode) ops.length++;
            Opcode jtrue = cast(Opcode) ops.length++;
            Opcode outreg = nregs++;
            ops[jtrue] = opLength;
            Opcode vtrue = readExprMatch(Binding.none);
            ops ~= [opreg, outreg, vtrue];
            ops ~= opjump;
            Opcode jend = cast(Opcode) ops.length++;
            ops[jfalse] = opLength;
            Opcode vfalse = readExprMatch(Binding.none);
            ops ~= [opreg, outreg, vfalse];
            ops[jend] = opLength;
            return outreg;
        case "let":
            string let = readName;
            Opcode where = readExprMatch(Binding.none);
            defs[let] = Binding.none;
            locals[let] = where;
            Opcode ret = readExprMatch(type);
            defs.remove(let);
            locals.remove(let);
            return ret;
        default:
            if ('0' <= name[0] && name[0] <= '9')
            {
                Opcode outreg = nregs++;
                ops ~= [opint, outreg, name.to!Opcode];
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

    Opcode readCall(string name)
    {
        Binding argTypes = defs[name];
        if (argTypes.isFunc)
        {
            Opcode[] argValues;
            foreach (argType; argTypes.args)
            {
                argValues ~= readExprMatch(argType);
            }
            Opcode outreg = nregs++;
            if (Opcode* ptr = name in locals)
            {
                ops ~= [opcalldyn, outreg, *ptr, cast(Opcode) argValues.length];
                ops ~= argValues;
            }
            else if (Opcode* ptr = name in funcs)
            {
                ops ~= [opcall, outreg, *ptr, cast(Opcode) argValues.length];
                ops ~= argValues;
            }
            else if (Opcode* opptr = name in binops)
            {
                ops ~= [*opptr, outreg, argValues[1], argValues[0]];
            }
            else if (Opcode* opcmp = name in cmpops)
            {
                ops ~= [*opcmp, argValues[1], argValues[0]];
                Opcode jfalse = cast(Opcode) ops.length++;
                Opcode jtrue = cast(Opcode) ops.length++;
                ops[jfalse] = opLength;
                ops ~= [opint, outreg, 0];
                ops ~= opjump;
                Opcode end = cast(Opcode) ops.length++;
                ops[jtrue] = opLength;
                ops ~= [opint, outreg, 1];
                ops[end] = opLength;
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
                    Opcode jfalse = cast(Opcode) ops.length++;
                    Opcode jtrue = cast(Opcode) ops.length++;
                    ops[jfalse] = opLength;
                    ops ~= [opint, outreg, 0];
                    ops ~= opjump;
                    Opcode end = cast(Opcode) ops.length++;
                    ops[jtrue] = opLength;
                    ops ~= [opint, outreg, 1];
                    ops[end] = opLength;
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
        assert (first == '(');
        skip;
        string fname = readName;
        assert(fname.length != 0);
        Binding[] vals = readArgArray;
        defs[fname] = Binding(fname, vals);
        foreach (val; vals)
        {
            defs[val.name] = val;
        }
        skipSpace;
        if (first == '?')
        {
            skip;
        }
        else
        {
            ops ~= opfunc;
            Opcode jover = cast(Opcode) ops.length++;
            ops ~= cast(Opcode) vals.length;
            ops ~= cast(Opcode) fname.length;
            foreach (chr; fname)
            {
                ops ~= cast(Opcode) chr;
            }
            Opcode nregswhere = cast(Opcode) ops.length++;
            funcs[fname] = opLength;
            nregs = 1;
            locals = null;
            foreach (arg; vals) 
            {
                locals[arg.name] = nregs;
                nregs += 1;
            }
            Opcode rr = readExprMatch(Binding.none);
            ops ~= [opret, rr];
            ops[nregswhere] = nregs;
            ops[jover] = opLength;
        }
    }

    void readDefs(File outfile)
    {
        skipSpace;
        while (!done)
        {
            readDef;
            if (ops.length > 1_000_000)
            {
                outfile.rawWrite(ops);
                offset += cast(Opcode) ops.length;
                ops = null;
            }
            skipSpace;
        }
        ops ~= [opcall, 0, funcs["main"], 0, opexit];
        outfile.rawWrite(ops);
    }
}

void main(string[] args)
{
    Parser parser = Parser(args[1].readText);
    File outfile = File("out.bc", "wb");
    parser.readDefs(outfile);
}
