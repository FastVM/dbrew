module brew.ast;
import brew.util;

Form form(Form.Type type, Array!Node args) {
    return Form(type, args);
}

Form form(size_t n)(Form.Type type, Node[n] args) {
    return Form(type, Array!Node.alloc(args));
}

Ident ident(char[] name) {
    return Ident(name);
}

Number num(size_t num) {
    return Number(num);
}

Node node(Type)(Type arg) {
    return Node(arg);
}

/// any node, not valid in the ast
struct Node {
    enum Type {
        form,
        ident,
        num,
    }

    union Value {
        Form form;
        Ident ident;
        Number num;
    }

    Value value;
    Type type;

    this(Node other) {
        value = other.value;
        type = other.type;
    }

    this(Form form) {
        value.form = form;
        type = Type.form;
    }

    this(Ident ident) {
        value.ident = ident;
        type = Type.ident;
    }

    this(Number num) {
        value.num = num;
        type = Type.num;
    }

    void dealloc() {
        final switch (type) {
        case Type.form:
            value.form.dealloc();
            break;
        case Type.ident:
        case Type.num:
            break;
        }
    }
}

/// call of function or operator call
struct Form {
    enum Type {
        do_,
        if_,
        let,
        call,
        extern_,
        func,
        ret,
        or,
        and,
    }

    Type form;
    Array!Node args;

    this(Type f, Array!Node a) {
        form = f;
        args = a;
    }

    this(size_t n)(Type f, Node[n] a) {
        form = f;
        args = Array!Node(a);
    }

    void dealloc() {
        foreach (arg; args) {
            arg.dealloc();
        }
        args.dealloc();
    }
}

/// ident or number, detects at runtime
struct Ident {
    char[] repr;

    this(char[] s) {
        repr = s;
    }
}

/// number value literal
struct Number {
    size_t value;

    this(T)(T v) {
        value = v;
    }
}
