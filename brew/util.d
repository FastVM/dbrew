module brew.util;

extern (C) {
    struct FILE;

    int printf(const(char)* format, ...);

    FILE* fopen(const(char)* path, const(char)* attr);
    int fclose(FILE* file);
    size_t fread(void* ptr, size_t size, size_t count, FILE* file);
    size_t fwrite(void* ptr, size_t size, size_t count, FILE* file);

    void* malloc(size_t size);
    void* realloc(void* ptr, size_t size);
    void free(void* ptr);
}

struct Array(Type) {
    Type* ptr;
    uint length;
    uint nalloc;

    this(size_t n)(Type[n] values) @disable {
        nalloc = n;
        ptr = cast(Type*) malloc(Type.sizeof * n);
        foreach (value; values) {
            this ~= value;
        }
    }

    static Array!Type alloc(size_t n)(Type[n] values) {
        Array!Type ret;
        ret.nalloc = n;
        ret.ptr = cast(Type*) malloc(Type.sizeof * n);
        foreach (index, value; values) {
            ret.ptr[index] = value;
        }
        ret.length = n;
        return ret;
    }

    void dealloc() {
        free(cast(void*) ptr);
        length = 0;
        nalloc = 0;
    }

    ref Type opIndex(size_t index) {
        return ptr[index];
    }

    void opOpAssign(string op : "~", Arg)(Arg value) {
        if (length + 5 >= nalloc) {
            nalloc = (length + 1) * 2;
            ptr = cast(Type*) realloc(cast(void*) ptr, Type.sizeof * nalloc);
        }
        ptr[length] = cast(Type) value;
        length += 1;
    }

    void opOpAssign(string op : "~", size_t n)(Type[n] values) {
        foreach (value; values) {
            this ~= value;
        }
    }

    void opOpAssign(string op : "~")(Array!Type arg) {
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

ubyte charno(char c) {
    if ('0' <= c && c <= '9') {
        return cast(ubyte)(c - '0');
    }
    if ('A' <= c && c <= 'Z') {
        return cast(ubyte)(c - 'A' + 10);
    }
    if ('a' <= c && c <= 'z') {
        return cast(ubyte)(c - 'a' + 36);
    }
    if (c == '_') {
        return 62;
    }
    if (c == '-') {
        return 63;
    }
    assert(false);
}

struct Table(Type, string dealloc1=``) {
    Table!Type[64]* values;
    Type value;
    bool has;

    void dealloc() {
        if (values !is null) {
            foreach (value; *values) {
                value.dealloc();
            }
            free(cast(void*) values);
        }
        mixin(dealloc1);
    }

    void opAssign(typeof(null) n) {
        has = false;
        if (values !is null) {
            foreach (index; 0 .. 64) {
                (*values)[index] = null;
            }
        }
    }

    void set(string key, Type arg) {
        has = true;
        if (key.length == 0) {
            value = arg;
        } else {
            if (values is null) {
                values = cast(Table!Type[64]*) malloc((Table!Type[64]).sizeof);
                foreach (i; 0 .. 64) {
                    (*values)[i] = Table!Type.init;
                }
            }
            (*values)[charno(key[0])].set(key[1 .. $], arg);
        }
    }

    Type get(string find) {
        if (find.length == 0) {
            assert(has, "bounds check failed");
            return value;
        }
        return (*values)[charno(find[0])].get(find[1 .. $]);
    }

    Type* refget(string find) {
        if (find.length == 0) {
            if (!has) {
                return null;
            }
            return &value;
        }
        if (values is null) {
            return null;
        }
        return (*values)[charno(find[0])].refget(find[1 .. $]);
    }

    void remove(string key) {
        if (key.length == 0) {
            has = false;
        } else {
            (*values)[charno(key[0])].remove(key[1 .. $]);
        }
    }

    void opIndexAssign(String)(Type arg, String key) {
        set(cast(string) key.ptr[0 .. key.length], arg);
    }

    void remove(Array!char key) {
        remove(cast(string) key.ptr[0 .. key.length]);
    }

    Type opIndex(String)(String find) {
        return get(cast(string) find.ptr[0 .. find.length]);
    }

    Type* opBinaryRight(string op : "in", String)(String find) {
        return refget(cast(string) find.ptr[0 .. find.length]);
    }
}
