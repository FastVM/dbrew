module brew.parse;

import brew.ast;
import brew.util;

struct ParseState {
    Array!char src;
    size_t head;
    size_t line;
    size_t col;

    this(Array!char str) {
        src = str;
        line = 1;
        col = 1;
    }

    void skip() {
        if (src[head] == '\n') {
            line += 1;
            col = 1;
        } else {
            col += 1;
        }
        head += 1;
    }

    bool done() {
        return src.length <= head;
    }

    char first() {
        assert(!done);
        return src[head];
    }

    char read() {
        char ret = first;
        skip;
        return ret;
    }
}

struct Binding {
    Array!char name;
    Array!Binding args;
    bool isFunc;

    static Binding none() {
        return Binding.init;
    }

    this(Array!char name) {
        this.name = name;
        this.isFunc = false;
    }

    this(Array!char name, Array!Binding args) {
        this.name = name;
        this.isFunc = true;
        this.args = args;
    }
}

struct Parser {
    Table!Binding defs;
    ParseState state;

    void raise(string msg) {
        printf("parse error(%zu:%zu) -> %.*s\n", state.line, state.col, cast(int) msg.length, msg.ptr);
        // printf("%.*s\n", state.src.length - state.head, state.src.ptr + state.head);
        assert(false);
    }

    void skipSpace() {
        while (true) {
            if (state.done) {
                break;
            }
            if (state.first == ' ' || state.first == '\n' || state.first == '\r' || state.first == '\t') {
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

    Array!char readName() {
        skipSpace;
        Array!char ret;
        while (!state.done) {
            char first = state.first;
            if (!('0' <= first && first <= '9') && !('a' <= first && first <= 'z') && !('A' <= first && first <= 'Z') && first != '-' && first != '_') {
                break;
            }
            ret ~= state.read;
        }
        return ret;
    }

    Array!Binding readArgArray() {
        skipSpace;
        Array!Binding args;
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
                Array!char name = readName;
                args ~= Binding(name, readArgArray);
            } else {
                Array!char name = readName;
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
            Array!char value;
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
                        raise("unknown escape sequence");
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
                    raise("unknown escape sequence");
                    assert(false);
                }
            }
            if (!state.done && state.first == '\'') {
                state.skip;
            }
            return num(cast(size_t) chr).node;
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
        Array!char name = readName;
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
        switch (name.ptr[0..name.length]) {
        case "do":
            return form(Form.Type.do_, [
                    readExprMatch(type), readExprMatch(type)
                ]).node;
        case "or":
            return form(Form.Type.do_, [
                    readExprMatch(type), readExprMatch(type)
                ]).node;
        case "and":
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
        case "for":
            Ident id = ident(readName);
            Node value = readExprMatch(Binding.none);
            defs[id.repr] = Binding(id.repr);
            Node inscope = readExprMatch(type);
            defs.remove(id.repr);
            return form(Form.Type.for_, [id.node, value, inscope]).node;
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

    Node readCall(Array!char name) {
        if (Binding* argTypesPtr = name in defs) {
            if (argTypesPtr.isFunc) {
                Array!Binding argTypes = argTypesPtr.args;
                Array!Node argValues = [ident(name).node];
                foreach (argType; argTypes) {
                    argValues ~= readExprMatch(argType);
                }
                return form(Form.Type.call, argValues).node;
            } else {
                return ident(name).node;
            }
        }
        if ('0' <= name[0] && name[0] <= '9') {
            size_t ret = 0;
            foreach (chr; name) {
                ret *= 10;
                ret += chr - '0';
            }
            return num(ret).node;
        } else {
            raise("variable not found");
            assert(false);
        }
    }

    Form readDef() {
        skipSpace;
        if (state.first != '(') {
            raise("toplevel: expected a function opening paren");
        }
        state.skip;
        Array!char fname = readName;
        if (fname.length == 0) {
            raise("toplevel: expected a function name");
        }
        Array!Binding vals = readArgArray;
        defs[fname] = Binding(fname, vals);
        foreach (val; vals) {
            defs[val.name] = val;
        }
        Array!Node argNames = [ident(fname).node];
        foreach (val; vals) {
            argNames ~= ident(val.name).node;
        }
        skipSpace;
        if (state.first == '?') {
            state.skip;
            return form(Form.Type.extern_, argNames);
        } else {
            argNames ~= form(Form.Type.ret, [readExprMatch(Binding.none)]).node;
            return form(Form.Type.func, argNames);
        }
    }

    Array!Form readDefs() {
        Array!Form all;
        while (true) {
            skipSpace;
            if (state.done) {
                break;
            }
            all ~= readDef;
        }
        return all;
    }
}
