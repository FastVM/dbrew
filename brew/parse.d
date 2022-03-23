module brew.parse;

import brew.vm;
import brew.util;

struct ParseState {
    string src;
    size_t head;
    size_t line;
    size_t col;

    this(string str) {
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

struct Parser {
    Table!uint defs;
    ParseState state;

    size_t nregs;
    Table!uint funcs;
    Table!uint locals;

    Array!Opcode ops;

    void raise(string msg) {
        printf("parse error(%zu:%zu) -> %.*s\n", state.line, state.col, cast(int) msg.length, msg.ptr);
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

    string readName() {
        skipSpace;
        size_t start = state.head;
        while (!state.done) {
            char first = state.first;
            if (!('0' <= first && first <= '9') && !('a' <= first && first <= 'z') && !('A' <= first && first <= 'Z') && first != '-' && first != '_') {
                break;
            }
            state.skip;
        }
        return state.src[start .. state.head];
    }

    uint readArgArray() {
        skipSpace;
        uint count;
        uint args;
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
            args <<= 1;
            if (state.first == '(') {
                state.skip;
                string name = readName;
                locals[name] = cast(uint) nregs++;
                defs[name] = readArgArray;
            } else {
                string name = readName;
                locals[name] = cast(uint) nregs++;
                defs[name] = 1;
                args |= 1;
            }
            count += 1;
        }
        args <<= 4;
        args |= count;
        args <<= 1;
        return args;
    }

    size_t readExprMatch(bool isFunc) {
        skipSpace;
        if (state.done) {
            raise("expected expression at end of file");
            assert(false);
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
            size_t outreg = nregs++;
            ops ~= [opint, outreg, cast(size_t) chr];
            return outreg;
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
                isFunc = true;
            }
        }
        if (name.length == 0) {
            raise("expression expected");
            assert(false);
        }
        switch (name.ptr[0..name.length]) {
        case "or":
            size_t lhs = readExprMatch(isFunc);
            size_t outreg = nregs++;
            ops ~= [opbeqi, lhs, 0];
            size_t jzero = ops.length++;
            size_t jnonzero = ops.length++;
            ops[jnonzero] = ops.length;
            ops ~= [opreg, outreg, lhs];
            ops ~= opjump;
            size_t jout = ops.length++;
            ops[jzero] = ops.length;
            size_t rhs = readExprMatch(isFunc);
            ops ~= [opreg, outreg, rhs];
            ops[jout] = ops.length;
            return outreg;
        case "and":
            size_t lhs = readExprMatch(isFunc);
            size_t outreg = nregs++;
            ops ~= [opbeqi, lhs, 0];
            size_t jzero = ops.length++;
            size_t jnonzero = ops.length++;
            ops[jzero] = ops.length;
            ops ~= [opint, outreg, 0];
            ops ~= opjump;
            size_t jout = ops.length++;
            ops[jnonzero] = ops.length;
            size_t rhs = readExprMatch(isFunc);
            ops ~= [opreg, outreg, rhs];
            ops[jout] = ops.length;
            return outreg;
        case "do":
            readExprMatch(false);
            return readExprMatch(isFunc);
        case "if":
            size_t branch = readExprMatch(false);
            ops ~= [opbb, branch];
            size_t jfalse = ops.length++;
            size_t jtrue = ops.length++;
            size_t outreg = nregs++;
            ops[jtrue] = ops.length;
            size_t vtrue = readExprMatch(isFunc);
            ops ~= [opreg, outreg, vtrue];
            ops ~= opjump;
            size_t jend = ops.length++;
            ops[jfalse] = ops.length;
            size_t vfalse = readExprMatch(isFunc);
            ops ~= [opreg, outreg, vfalse];
            ops[jend] = ops.length;
            return outreg;
        case "let":
            string id = readName;
            size_t where = readExprMatch(false);
            defs[id] = 1;
            locals[id] = cast(int) where;
            size_t inscope = readExprMatch(isFunc);
            defs.remove(id);
            locals.remove(id);
            return inscope;
        default:
            if (isFunc) {
                if (uint* ptr = name in locals) {
                    return cast(size_t) *ptr;
                } else if (uint* ptr = name in funcs) {
                    size_t outreg = nregs++;
                    ops ~= [opint, outreg, cast(size_t) *ptr];
                    return outreg;
                } else {
                    assert(false);
                }
            } else {
                return readCall(name);
            }
        }
    }

    size_t readCall(string name) {
        if (uint* argTypesPtr = name in defs) {
            uint argTypes = *argTypesPtr;
            bool isFunc = (argTypes & 1) == 0;
            argTypes >>= 1;
            if (isFunc) {
                size_t nArgRegs = argTypes & 15;
                argTypes >>= 4;
                size_t[16] argRegs;
                foreach (index; 0..nArgRegs) {
                    argRegs[index] = readExprMatch((argTypes & 1) == 0);
                    argTypes >>= 1;
                }
                if (name == "add" || name == "sub" || name == "mul" || name == "div" || name == "mod") {
                    size_t op;
                    switch (name.ptr[0..name.length]) {
                    case "add":
                        op = opadd;
                        break;
                    case "sub":
                        op = opsub;
                        break;
                    case "mul":
                        op = opmul;
                        break;
                    case "div":
                        op = opdiv;
                        break;
                    case "mod":
                        op = opmod;
                        break;
                    default:
                        assert(false);
                    }
                    size_t outreg = nregs++;
                    ops ~= op;
                    ops ~= outreg;
                    ops ~= argRegs[1];
                    ops ~= argRegs[0];
                    return outreg;
                }
                if (uint* ptr = name in locals) {
                    size_t outreg = nregs++;
                    ops ~= opcalldyn;
                    ops ~= outreg;
                    ops ~= *ptr;
                    ops ~= nArgRegs;
                    ops ~= argRegs[0..nArgRegs];
                    return outreg;
                } else if (uint* ptr = name in funcs) {
                    size_t outreg = nregs++;
                    ops ~= opcall;
                    ops ~= outreg;
                    ops ~= *ptr;
                    ops ~= nArgRegs;
                    ops ~= argRegs[0..nArgRegs];
                    return outreg;
                } else if (name == "putchar") {
                    ops ~= opputchar;
                    ops ~= argRegs[0];
                    return argRegs[0];
                } else if (name == "lt") {
                    size_t outreg = nregs++;
                    ops ~= [opblt, argRegs[1], argRegs[0]];
                    size_t jfalse = ops.length++;
                    size_t jtrue = ops.length++;
                    ops[jfalse] = ops.length;
                    ops ~= [opint, outreg, 0];
                    ops ~= opjump;
                    size_t end = ops.length++;
                    ops[jtrue] = ops.length;
                    ops ~= [opint, outreg, 1];
                    ops[end] = ops.length;
                    return outreg;
                } else if (name == "eq") {
                    size_t outreg = nregs++;
                    ops ~= [opbeq, argRegs[1], argRegs[0]];
                    size_t jfalse = ops.length++;
                    size_t jtrue = ops.length++;
                    ops[jfalse] = ops.length;
                    ops ~= [opint, outreg, 0];
                    ops ~= opjump;
                    size_t end = ops.length++;
                    ops[jtrue] = ops.length;
                    ops ~= [opint, outreg, 1];
                    ops[end] = ops.length;
                    return outreg;
                } else {
                    assert(false);
                }
            } else {
                if (uint* ptr = name in locals) {
                    return cast(size_t) *ptr;
                } else if (uint* ptr = name in funcs) {
                    size_t outreg = nregs++;
                    ops ~= [opint, outreg, cast(size_t) *ptr];
                    return outreg;
                } else {
                    assert(false);
                }
            }
        }
        if ('0' <= name[0] && name[0] <= '9') {
            size_t ret = 0;
            foreach (chr; name) {
                ret *= 10;
                ret += chr - '0';
            }
            size_t outreg = nregs++;
            ops ~= [opint, outreg, ret];
            return outreg;
        } else {
            raise("variable not found");
            assert(false);
        }
    }

    void readDef() {
        skipSpace;
        if (state.first != '(') {
            raise("toplevel: expected a function opening paren");
        }
        state.skip;
        string fname = readName;
        if (fname.length == 0) {
            raise("toplevel: expected a function name");
        }
        nregs = 1;
        locals = null;
        uint key = readArgArray;
        defs[fname] = key;
        skipSpace;
        if (state.first == '?') {
            state.skip;
        } else {
            ops ~= opfunc;
            size_t jover = ops.length++;
            ops ~= (key >> 1) & 15;
            ops ~= 0;
            size_t nregswhere = ops.length++;
            funcs[fname] = cast(int) ops.length;
            size_t ret = readExprMatch(false);
            ops ~= opret;
            ops ~= ret;
            ops[nregswhere] = nregs;
            ops[jover] = ops.length;
        }
    }

    void readDefs() {
        ops ~= opjump;
        size_t jover = ops.length++;
        while (true) {
            skipSpace;
            if (state.done) {
                break;
            }
            readDef;
        }
        ops[jover] = ops.length;
        assert("main" in funcs);
        ops ~= [opcall, 0, funcs["main"], 0];
        ops ~= opexit;
    }
}
