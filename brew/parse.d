module brew.parse;

import std.ascii;
import std.string;
import std.conv;
import std.stdio;
import brew.ast;

class ParseError : Exception {
    size_t line;
    size_t col;

    this(size_t line, size_t col, string msg) {
        super("at Line " ~ line.to!string ~ " Column " ~ col.to!string ~ ": " ~ msg);
    }
}

struct ParseState {
    string src;
    size_t line;
    size_t col;

    this(string str) {
        src = str;
        line = 1;
        col = 1;
    }

    void skip() {
        if (src[0] == '\n') {
            line += 1;
            col = 1;
        } else {
            col += 1;
        }
        src = src[1 .. $];
    }

    bool done() {
        return src.length == 0;
    }

    char first() {
        assert(!done);
        return src[0];
    }

    char read() {
        char ret = first;
        skip;
        return ret;
    }
}

struct Binding {
    string name;
    bool isFunc;
    Binding[] args;

    static Binding none() {
        return Binding(null);
    }

    this(string name) {
        this.name = name;
        this.isFunc = false;
    }

    this(string name, Binding[] args) {
        this.name = name;
        this.isFunc = true;
        this.args = args;
    }

    void toString(void delegate(string) sink) {
        sink(name);
        foreach (arg; args) {
            sink(" ");
            arg.toString(sink);
        }
    }
}

struct Parser {
    Binding[string] defs;
    ParseState state;

    void raise(string msg) {
        throw new ParseError(state.line, state.col, msg);
    }

    void skipSpace() {
        while (true) {
            if (state.done) {
                break;
            }
            if (state.first.isWhite) {
                state.skip;
                continue;
            }
            if (state.first == '#') {
                state.skip;
                if (state.done) {
                    raise("unclosed comment: hashtag at end of program");
                }
                while (state.first != '#') {
                    state.skip;
                    if (state.done) {
                        raise("unclosed comment");
                    }
                }
                state.skip;
                continue;
            }
            break;
        }
    }

    string readName() {
        skipSpace;
        string ret;
        while (!state.done) {
            char first = state.first;
            if (!first.isAlphaNum && first != '-' && first != '_') {
                break;
            }
            ret ~= state.read;
        }
        return ret;
    }

    Binding[] readArgArray() {
        skipSpace;
        Binding[] args;
        while (true) {
            skipSpace;
            if (state.done) {
                raise(
                    "toplevel: file ended when reading function definition arguments");
            }
            if (state.first == ')') {
                state.skip;
                break;
            }
            if (state.first == '(') {
                state.skip;
                string name = readName;
                args ~= Binding(name, readArgArray);
            } else {
                string name = readName;
                skipSpace;
                args ~= Binding(name);
            }
        }
        return args;
    }

    Node readExprMatch(Binding type) {
        skipSpace;
        if (state.done) {
            raise("expected expression at end of file");
            assert(false);
        }
        if (state.first == '\"') {
            state.skip;
            string value;
            if (state.done) {
                raise("expected string literal at end of file");
                assert(false);
            }
            while (state.first != '\"') {
                char chr = state.read;
                if (chr == '\\') {
                    switch (chr) {
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
                } else {
                    value ~= chr;
                }
                if (state.done) {
                    raise("unterminated string literal");
                    assert(false);
                }
            }
            state.skip;
            return str(value).node;
        }
        if (state.first == '\'') {
            state.skip;
            if (state.done) {
                raise("expected char literal at end of file");
                assert(false);
            }
            char chr = state.read;
            if (chr == '\\') {
                if (state.done) {
                    raise("expected escape sequence");
                    assert(false);
                }
                switch (state.read) {
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
            if (!state.done && state.first == '\'') {
                state.skip;
            }
            return num(chr.to!size_t).node;
        }
        bool startsOpenParen = false;
        while (state.first == '(') {
            startsOpenParen = true;
            state.skip;
            skipSpace;
            if (state.done) {
                raise("expected expression after paren at end of file");
                assert(false);
            }
        }
        string name = readName;
        scope (exit) {
            if (startsOpenParen) {
                skipSpace;
                if (state.done) {
                    raise("expected close paren at end of file");
                    assert(false);
                }
                if (state.first != ')') {
                    raise("expected close paren at end of expression");
                    assert(false);
                }
                state.skip;
                skipSpace;
            }
        }
        if (startsOpenParen) {
            skipSpace;
            if (!state.done && state.first == ')') {
                type.isFunc = true;
            }
        }
        if (name.length == 0) {
            raise("expression expected");
            assert(false);
        }
        switch (name) {
        case "or":
            return form(Form.Type.or, [readExprMatch(type), readExprMatch(type)]).node;
        case "and":
            return form(Form.Type.and, [
                    readExprMatch(type), readExprMatch(type)
                ]).node;
        case "do":
            return form(Form.Type.do_, [
                    readExprMatch(type), readExprMatch(type)
                ]).node;
        case "if":
            return form(Form.Type.if_,
                [
                    readExprMatch(Binding.none), readExprMatch(type),
                    readExprMatch(type)
                ]
            ).node;
        case "let":
            Ident id = ident(readName);
            Node value = readExprMatch(Binding.none);
            defs[id.repr] = Binding(id.repr);
            Node inscope = readExprMatch(type);
            defs.remove(id.repr);
            return form(Form.Type.let, [id.node, value, inscope]).node;
        default:
            if (type.isFunc) {
                return ident(name).node;
            } else {
                return readCall(name);
            }
        }
    }

    Node readCall(string name) {
        if (Binding* argTypesPtr = name in defs) {
            if (argTypesPtr.isFunc) {
                Binding[] argTypes = argTypesPtr.args;
                Node[] argValues = [ident(name).node];
                foreach (argType; argTypes) {
                    argValues ~= readExprMatch(argType);
                }
                return form(Form.Type.call, argValues).node;
            } else {
                return ident(name).node;
            }
        }
        if (name.isNumeric) {
            return num(name.to!size_t).node;
        } else {
            raise("variable " ~ name ~ " not found");
            assert(false);
        }
    }

    Node readDef() {
        skipSpace;
        if (state.first != '(') {
            raise("toplevel: expected a function opening paren");
        }
        state.skip;
        string fname = readName;
        if (fname.length == 0) {
            raise("toplevel: expected a function name");
        }
        Binding[] vals = readArgArray;
        defs[fname] = Binding(fname, vals);
        foreach (val; vals) {
            defs[val.name] = val;
        }
        Node[] argNames = [ident(fname).node];
        foreach (val; vals) {
            argNames ~= ident(val.name).node;
        }
        skipSpace;
        if (state.first == '?') {
            state.skip;
            return form(Form.Type.extern_, argNames).node;
        } else {
            return form(Form.Type.func, argNames ~ readExprMatch(Binding.none)).node;
        }
    }

    Node readDefs() {
        Node[] all;
        while (true) {
            skipSpace;
            if (state.done) {
                break;
            }
            all ~= readDef;
        }
        return form(Form.Type.program, all).node;
    }
}
