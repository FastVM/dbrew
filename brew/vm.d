module brew.vm;

import brew.util;

alias Opcode = uint;

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
enum Opcode opbeq = 14;
enum Opcode opblt = 15;
enum Opcode opdcall = 16;
enum Opcode opintf = 17;
enum Opcode optcall = 18;

extern(C) int vm_run_arch_int(size_t nops, const(Opcode)* ops);
extern(C) int vm_run_arch_x86(size_t nops, const(Opcode)* ops);
