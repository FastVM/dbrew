module brew.vm;

import brew.util;

alias Opcode = ushort;

enum Opcode opexit = 0;
enum Opcode opreg = 1;
enum Opcode opint = 2;
enum Opcode opjump = 3;
enum Opcode opfunc = 4;
enum Opcode opadd = 5;
enum Opcode opsub = 6;
enum Opcode opmul = 7;
enum Opcode opdiv = 8;
enum Opcode opmod = 9;
enum Opcode opcall = 10;
enum Opcode opret = 11;
enum Opcode opputchar = 12;
enum Opcode opbb = 13;
enum Opcode opeq = 14;
enum Opcode oplt = 15;
enum Opcode opdcall = 16;
enum Opcode opxcall = 17;
enum Opcode opcons = 18;
enum Opcode opcar = 19;
enum Opcode opcdr = 20;
enum Opcode opfree = 21;

struct Config {
    size_t gc_ents;
    size_t gc_init;
    size_t gc_shrink;
}

union Dynamic {
    size_t num;
    Dynamic[2]* pair;
}

extern(C) int vm_run(size_t nops, Opcode* ops);

int runvm(Array!Opcode ops) {
    return vm_run(ops.length, ops.ptr);
}
