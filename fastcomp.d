module fastcomp;

import std.file;
import std.conv : to;

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
enum opcall = 12;
enum opret = 13;
enum opputchar = 14;
enum opbeq = 24;
enum opblt = 25;
enum opcalldyn = 40;

private enum int[string] binops = [
        "add": opadd,
        "sub": opsub,
        "mul": opmul,
        "div": opdiv,
        "mod": opmod,
    ];

private enum int[string] cmpops = [
        "lt": opblt,
        "eq": opbeq,
    ];

struct Binding {
    string name;
    bool isFunc;
    Binding[] args;
}

string src;
int nregs;
int[string] funcs;
int[string] locals;
int[] ops;
Binding[string] defs;

void skipSpace() {
    while (src.length != 0) {
        if (src[0] == ' ' || src[0] == '\t' || src[0] == '\n' || src[0] == '\r') {
            src = src[1 .. $];
            continue;
        }
        if (src[0] == '#') {
            src = src[1 .. $];
            while (src[0] != '#') {
                src = src[1 .. $];
            }
            src = src[1 .. $];
            continue;
        }
        break;
    }
}

string readName() {
    skipSpace;
    string ret;
    while (!src.length == 0 && src[0] != ' ' && src[0] != '\t' && src[0] != '\n' && src[0] != '\r' && src[0] != '(' && src[0] != ')') {
        ret ~= src[0];
        src = src[1 .. $];
    }
    return ret;
}

Binding[] readArgArray() {
    Binding[] args;
    while (true) {
        skipSpace;
        if (src[0] == ')') {
            src = src[1 .. $];
            break;
        }
        if (src[0] == '(') {
            src = src[1 .. $];
            args ~= Binding(readName, true, readArgArray);
        } else {
            args ~= Binding(readName, false);
            skipSpace;
        }
    }
    return args;
}

int readExprMatch(Binding type) {
    skipSpace;
    if (src[0] == '\'') {
        char chr = src[1];
        src = src[2 .. $];
        if (chr == '\\') {
            chr = src[0];
            src = src[1 .. $];
            if (chr == 't') {
                chr = '\t';
            } else if (chr == 'n') {
                chr = '\n';
            } else if (chr == 'r') {
                chr = '\r';
            }
        }
        if (src.length != 0 && src[0] == '\'') {
            src = src[1 .. $];
        }
        int outreg = nregs++;
        ops ~= [opint, outreg, cast(int) chr];
        return outreg;
    }
    bool startsOpenParen = src[0] == '(';
    while (startsOpenParen) {
        src = src[1 .. $];
        skipSpace;
    }
    string name = readName;
    scope (exit) {
        if (startsOpenParen) {
            skipSpace;
            src = src[1 .. $];
        }
    }
    if (startsOpenParen) {
        skipSpace;
        if (src.length != 0 && src[0] == ')') {
            type.isFunc = true;
        }
    }
    if (name == "or") {
        int lhs = readExprMatch(Binding.init);
        int outreg = nregs++;
        ops ~= [opbb, lhs];
        int jzero = cast(int) ops.length++;
        int jnonzero = cast(int) ops.length++;
        ops[jnonzero] = cast(int) ops.length;
        ops ~= [opreg, outreg, lhs];
        ops ~= opjump;
        int jout = cast(int) ops.length++;
        ops[jzero] = cast(int) ops.length;
        int rhs = readExprMatch(Binding.init);
        ops ~= [opreg, outreg, rhs];
        ops[jout] = cast(int) ops.length;
        return outreg;
    } else if (name == "and") {
        int lhs = readExprMatch(Binding.init);
        int outreg = nregs++;
        ops ~= [opbb, lhs];
        int jzero = cast(int) ops.length++;
        int jnonzero = cast(int) ops.length++;
        ops[jzero] = cast(int) ops.length;
        ops ~= [opint, outreg, 0];
        ops ~= opjump;
        int jout = cast(int) ops.length++;
        ops[jnonzero] = cast(int) ops.length;
        int rhs = readExprMatch(Binding.init);
        ops ~= [opreg, outreg, rhs];
        ops[jout] = cast(int) ops.length;
        return outreg;
    } else if (name == "do") {
        readExprMatch(Binding.init);
        return readExprMatch(type);
    } else if (name == "if") {
        int branch = readExprMatch(Binding.init);
        ops ~= [opbb, branch];
        int jfalse = cast(int) ops.length++;
        int jtrue = cast(int) ops.length++;
        int outreg = nregs++;
        ops[jtrue] = cast(int) ops.length;
        int vtrue = readExprMatch(Binding.init);
        ops ~= [opreg, outreg, vtrue];
        ops ~= opjump;
        int jend = cast(int) ops.length++;
        ops[jfalse] = cast(int) ops.length;
        int vfalse = readExprMatch(Binding.init);
        ops ~= [opreg, outreg, vfalse];
        ops[jend] = cast(int) ops.length;
        return outreg;
    } else if (name == "let") {
        string let = readName;
        int where = readExprMatch(Binding.init);
        defs[let] = Binding.init;
        locals[let] = where;
        return readExprMatch(type);
    } else if ('0' <= name[0] && name[0] <= '9') {
        int outreg = nregs++;
        ops ~= [opint, outreg, name.to!int];
        return outreg;
    } else if (type.isFunc) {
        if (int* ptr = name in locals) {
            return *ptr;
        }
        int outreg = nregs++;
        ops ~= [opint, outreg, funcs[name]];
        return outreg;
    } else {
        return readCall(name);
    }
}

int readCall(string name) {
    if (defs[name].isFunc) {
        int[] argValues;
        foreach (argType; defs[name].args) {
            argValues ~= readExprMatch(argType);
        }
        int outreg = nregs++;
        if (int* ptr = name in locals) {
            ops ~= [opcalldyn, outreg, *ptr, cast(int) argValues.length] ~ argValues;
        } else if (int* ptr = name in funcs) {
            ops ~= [opcall, outreg, *ptr, cast(int) argValues.length] ~ argValues;
        } else if (int* opptr = name in binops) {
            ops ~= [*opptr, outreg, argValues[1], argValues[0]];
        } else if (int* opcmp = name in cmpops) {
            ops ~= [*opcmp, argValues[1], argValues[0]];
            int jfalse = cast(int) ops.length++;
            int jtrue = cast(int) ops.length++;
            ops[jfalse] = cast(int) ops.length;
            ops ~= [opint, outreg, 0, opjump];
            int end = cast(int) ops.length++;
            ops[jtrue] = cast(int) ops.length;
            ops ~= [opint, outreg, 1];
            ops[end] = cast(int) ops.length;
        } else if (name == "putchar") {
            ops ~= [opputchar, argValues[0]];
        }
        return outreg;
    } else {
        return locals[name];
    }
}

void readDef() {
    src = src[1 .. $];
    string fname = readName;
    Binding[] vals = readArgArray;
    defs[fname] = Binding(fname, true, vals);
    foreach (val; vals) {
        defs[val.name] = val;
    }
    skipSpace;
    if (src[0] == '?') {
        src = src[1 .. $];
    } else {
        ops ~= opfunc;
        int jover = cast(int) ops.length++;
        ops ~= cast(int) vals.length;
        ops ~= 0;
        int nregswhere = cast(int) ops.length++;
        funcs[fname] = cast(int) ops.length;
        nregs = 1;
        locals = null;
        foreach (arg; vals) {
            locals[arg.name] = nregs;
            nregs += 1;
        }
        int rr = readExprMatch(Binding.init);
        ops ~= [opret, rr];
        ops[nregswhere] = nregs;
        ops[jover] = cast(int) ops.length;
    }
}

void main(string[] args) {
    src = args[1].readText;
    skipSpace;
    while (src.length != 0) {
        readDef;
        skipSpace;
    }
    "out.bc".write(ops ~ [opcall, 0, funcs["main"], 0, opexit]);
}
