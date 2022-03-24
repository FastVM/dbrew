module brew.vm;

import brew.util;

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
enum opcallext = 41;

alias Opcode = size_t;
alias FileOpcode = int;

struct Config {
    size_t gc_ents;
    size_t gc_init;
    size_t gc_shrink;
}

struct Dynamic {
    enum Type {
        num,
        ptr,
    }

    private int value;

    this(int n) {
        value = n << 1;
    }

    int num() {
        return value >> 1;
    }

    Type type() {
        if (value % 2 == 0) {
            return Type.num;
        } else {
            return Type.ptr;
        }
    }
}

struct Memory {
    union Slot {
        Dynamic len;
        Dynamic val;
    }

    size_t heap_used;
    size_t heap_alloc;
    Slot* heap;
    Slot* off_heap;
    Dynamic* start;
    Dynamic* end;
    size_t max;
    size_t grow;
    size_t shrink;

    Dynamic pair(Dynamic car, Dynamic cdr) {
        Dynamic ret = vm_gc_new(&this, 2);
        heap[ret.num].val = car;
        heap[ret.num + 1].val = cdr;
        return ret;
    }

    Dynamic car(Dynamic pair) {
        return heap[pair.num].val;
    }

    Dynamic cdr(Dynamic pair) {
        return heap[pair.num + 1].val;
    }
}

extern (C) Dynamic vm_gc_new(Memory* gc, size_t count);
extern (C) int vm_run(Config config, size_t nops, Opcode* ops, size_t nargs, const(char*)* args);



bool runvm(Array!Opcode ops, int argc = 0, const(char*)* argv = null) {
    return 0 != vm_run(Config(200, 1000, 0), ops.length, ops.dup.ptr, argc, argv);
}
