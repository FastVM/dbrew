module brew.util;

import core.stdc.stdlib;
import core.stdc.stdio;

struct Array(Type) {
    size_t length;
    size_t alloc;
    Type* ptr;

    this(size_t n)(Type[n] values) {
        alloc = n;
        ptr = cast(Type*) malloc(Type.sizeof * alloc);
        foreach (value; values) {
            this ~= value;
        }
    }

    this(typeof(null) n) {
    }

    ~this() {
        // free(ptr);
    }

    Array!Type dup() {
        Array!Type ret;
        foreach (value; ptr[0 .. length]) {
            ret ~= value;
        }
        return ret;
    }

    Array!Type opSlice(size_t start, size_t end) {
        Array!Type ret;
        foreach (value; ptr[start .. end]) {
            ret ~= value;
        }
        return ret;
    }

    ref Type opIndex(size_t index) {
        return ptr[index];
    }

    void opOpAssign(string op : "~")(Type value) {
        if (length + 1 >= alloc) {
            alloc = (length + 1) * 2;
            ptr = cast(Type*) realloc(cast(void*) ptr, Type.sizeof * alloc);
        }
        ptr[length] = value;
        length += 1;
    }

    void opOpAssign(string op : "~", size_t n)(Type[n] values) {
        foreach (value; values) {
            this ~= value;
        }
    }

    void opOpAssign(string op : "~", Arg)(Arg arg) {
        foreach (val; arg) {
            this ~= val;
        }
    }

    int opApply(int delegate(Type) dg) {
        foreach (index; 0 .. length) {
            if (int res = dg(ptr[index])) {
                return res;
            }
        }
        return 0;
    }

    int opApply(int delegate(size_t, Type) dg) {
        foreach (index; 0 .. length) {
            if (int res = dg(index, ptr[index])) {
                return res;
            }
        }
        return 0;
    }

    bool opEquals(Arg)(Arg other) {
        if (length != other.length) {
            return false;
        }
        foreach (index, value; other) {
            if (value != this[index]) {
                return false;
            }
        }
        return true;
    }

    void opAssign(typeof(null) n) {
        length = 0;
    }

    size_t opDollar() {
        return length;
    }
}

struct Table(Type) {
    Table!Type[95]* values;
    Type value;
    bool has;

    void opAssign(typeof(null) n) {
        has = false;
    }

    void opIndexAssign(String)(Type arg, String key) {
        has = true;
        if (key.length == 0) {
            value = arg;
        } else {
            if (values is null) {
                values = cast(Table!Type[95]*) malloc((Table!Type[984]).sizeof);
                foreach (i; 0..95) {
                    (*values)[i] = Table!Type.init;
                }
            }
            (*values)[key[0] - 32][key.ptr[1 .. key.length]] = arg;
        }
    }

    Type opIndex(String)(String find) {
        if (!has) {
            assert(false, "bounds error");
        }
        if (find.length == 0) {
            return value;
        }
        if (values is null) {
            assert(false, "bounds error");
        }
        return (*values)[find[0] - 32][find.ptr[1 .. find.length]];
    }

    Type* opBinaryRight(string op : "in", String)(String find) {
        if (find.length == 0) {
            if (!has) {
                return null;
            }
            return &value;
        }
        if (values is null) {
            return null;
        }
        return find.ptr[1 .. find.length] in (*values)[find[0] - 32];
    }
}
