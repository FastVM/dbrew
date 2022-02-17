module brew.parse;

import std.ascii;
import std.string;
import std.conv;
import std.stdio;
import brew.ast;

class ParseError : Exception
{
    size_t line;
    size_t col;

    this(size_t line, size_t col, string msg)
    {
        super("at Line " ~ line.to!string ~ " Column " ~ col.to!string ~ ": " ~ msg);
    }
}

class ParseState
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

class Binding
{
    string name;
    bool isFunc;
    Binding[] args;

    static Binding none()
    {
        return new Binding(null);
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

class Parser
{
    enum string hasScope = `
Binding[string] oldDefs = defs.dup;
scope(exit) defs = oldDefs;
`;

    Binding[string] defs;
    ParseState state;

    this()
    {
    }

    void raise(string msg)
    {
        throw new ParseError(state.line, state.col, msg);
    }

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
                if (state.done)
                {
                    raise("unclosed comment: hashtag at end of program");
                }
                while (state.first != '#')
                {
                    state.skip;
                    if (state.done)
                    {
                        raise("unclosed comment");
                    }
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
        if (state.first != '(')
        {
            raise("toplevel: expected a function opening paren");
        }
        state.skip;
        Binding[] args;
        while (true)
        {
            skipSpace;
            if (state.done)
            {
                raise(
                    "toplevel: file ended when reading function definition arguments");
            }
            if (state.first == ')')
            {
                state.skip;
                break;
            }
            string name = readName;
            skipSpace;
            if (state.first == '(')
            {
                args ~= new Binding(name, readArgArray);
            }
            else
            {
                args ~= new Binding(name);
            }
        }
        return args;
    }

    Node readExprMatch(Binding type)
    {
        skipSpace;
        if (state.done)
        {
            raise("expected expression at end of file");
            assert(false);
        }
        if (state.first == '\"')
        {
            state.skip;
            string value;
            if (state.done)
            {
                raise("expected string literal at end of file");
                assert(false);
            }
            while (state.first != '\"')
            {
                char chr = state.read;
                if (chr == '\\')
                {
                    switch (chr)
                    {
                    case '\'':
                        value ~= '\'';
                        break;
                    case '"':
                        value ~= '"';
                        break;
                    case '\\':
                        value ~= '\\';
                        break;
                    case 't':
                        value ~= '\t';
                        break;
                    case 'n':
                        value ~= '\n';
                        break;
                    case 'r':
                        value ~= '\r';
                        break;
                    default:
                        raise("unknown escape sequence: \\" ~ chr);
                        assert(false);
                    }
                }
                else
                {
                    value ~= chr;
                }
                if (state.done)
                {
                    raise("unterminated string literal");
                    assert(false);
                }
            }
            state.skip;
            return new String(value);
        }
        if (state.first == '\'')
        {
            state.skip;
            if (state.done)
            {
                raise("expected char literal at end of file");
                assert(false);
            }
            char chr = state.read;
            if (chr == '\\')
            {
                if (state.done)
                {
                    raise("expected escape sequence");
                    assert(false);
                }
                switch (state.read)
                {
                case '\'':
                    chr = '\'';
                    break;
                case '"':
                    chr = '"';
                    break;
                case '\\':
                    chr = '\\';
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
                default:
                    raise("unknown escape sequence: \\" ~ chr);
                    assert(false);
                }
            }
            if (!state.done && state.first == '\'')
            {
                state.skip;
            }
            return new Number(chr.to!size_t);
        }
        bool startsOpenParen = false;
        while (state.first == '(')
        {
            startsOpenParen = true;
            state.skip;
            skipSpace;
            if (state.done)
            {
                raise("expected expression after paren at end of file");
                assert(false);
            }
        }
        string name = readName;
        scope (exit)
        {
            if (startsOpenParen)
            {
                if (state.done)
                {
                    raise("expected close paren at end of file");
                    assert(false);
                }
                if (state.first != ')')
                {
                    raise("expected close paren at end of expression");
                    assert(false);
                }
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
        if (name.length == 0)
        {
            raise("expression expected");
            assert(false);
        }
        switch (name)
        {
        case "addr":
            return new Form("addr", readExprMatch(Binding.none));
        case "or":
            return new Form("or", readExprMatch(type), readExprMatch(type));
        case "and":
            return new Form("and", readExprMatch(type), readExprMatch(type));
        case "do":
            return new Form("do", readExprMatch(type), readExprMatch(type));
        case "if":
            return new Form("if",
                readExprMatch(Binding.none), readExprMatch(type),
                readExprMatch(type)
            );
        case "let":
            Node value = readExprMatch(Binding.none);
            Ident id = new Ident(readName);
            mixin(hasScope);
            defs[id.repr] = new Binding(id.repr);
            Node inscope = readExprMatch(type);
            return new Form("let", id, value, inscope);
        case "for":
            Node value = readExprMatch(Binding.none);
            Ident id = new Ident(readName);
            mixin(hasScope);
            defs[id.repr] = new Binding(id.repr);
            Node inscope = readExprMatch(type);
            return new Form("for", id, value, inscope);
        default:
            if (type.isFunc)
            {
                return new Ident(name);
            }
            else
            {
                return readCall(name);
            }
        }
    }

    Node readCall(string name)
    {
        if (Binding* argTypesPtr = name in defs)
        {
            if (argTypesPtr.isFunc)
            {
                Binding[] argTypes = argTypesPtr.args;
                Node[] argValues = [new Ident(name)];
                foreach (argType; argTypes)
                {
                    argValues ~= readExprMatch(argType);
                }
                return new Form("call", argValues);
            }
            else
            {
                return new Ident(name);
            }
        }
        if (name.isNumeric)
        {
            return new Number(name.to!size_t);
        }
        else
        {
            raise("variable " ~ name ~ " not found");
            assert(false);
        }
    }

    Node readDef()
    {
        string fname = readName;
        if (fname.length == 0)
        {
            raise("toplevel: expected a function name");
        }
        Binding[] vals = readArgArray;
        defs[fname] = new Binding(fname, vals);
        mixin(hasScope);
        foreach (val; vals)
        {
            defs[val.name] = val;
        }
        Node[] argNames;
        foreach (val; vals)
        {
            argNames ~= cast(Node) new Ident(val.name);
        }
        skipSpace;
        if (state.first == '?')
        {
            state.skip;
            return new Form("extern", new Ident(fname), argNames);
        }
        else
        {
            return new Form("function", new Ident(fname), argNames, readExprMatch(Binding.none));
        }
    }

    Node readDefs()
    {
        Node[] all;
        while (true)
        {
            skipSpace;
            if (state.done)
            {
                break;
            }
            all ~= readDef;
        }
        return new Form("program", all);
    }
}
