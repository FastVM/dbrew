module brew.util;

import core.stdc.stdlib;
import core.stdc.stdio;

struct Array(Type) {
    size_t length;
    size_t alloc;
    Type *ptr;

    this(size_t n)(Type[n] values) {
        alloc = n;
        ptr = cast(Type*) malloc(Type.sizeof * alloc);
        foreach (value; values) {
            this ~= value;
        }
    }

    this(typeof(null) n) {}

    ~this() {
        // free(ptr);
    }

    Array!Type dup() {
        Array!Type ret;
        foreach (value; ptr[0..length]) {
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

    void opOpAssign(string op: "~")(Type value) {
        if (length + 1 >= alloc) {
            alloc = (length + 1) * 2;
            ptr = cast(Type*) realloc(cast(void*) ptr, Type.sizeof * alloc);
        }
        ptr[length] = value;
        length += 1;
    }

    void opOpAssign(string op: "~", size_t n)(Type[n] values) {
        foreach (value; values) {
            this ~= value;
        }
    }

    void opOpAssign(string op: "~", Arg)(Arg arg) {
        foreach (val; arg) {
            this ~= val;
        }
    }

    int opApply(int delegate(Type) dg) {
        foreach (index; 0..length) {
            if (int res = dg(ptr[index])) {
                return res;
            }
        }
        return 0;
    }

    int opApply(int delegate(size_t, Type) dg) {
        foreach (index; 0..length) {
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
    Array!(Array!char) keys;
    Array!Type values;

    void opAssign(typeof(null) n) {
        keys = null;
        values = null;
    }

    void opIndexAssign(String)(Type value, String key) {
        if (Type* ptr = key in this) {
            *ptr = value;
        } else {
            keys ~= key;
            values ~= value;
        }
    }

    Type opIndex(String)(String find) {
        foreach (index, key; keys) {
            if (key == find) {
                return values[index];
            }
        }
        assert(false, "bounds error");
    }
    
    Type* opBinaryRight(string op: "in", String)(String find) {
        foreach (index, key; keys) {
            if (key == find) {
                return &values[index];
            }
        }
        return null;
    }
}
