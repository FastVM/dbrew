module brew.ast;
import brew.util;

Form form(Form.Type type, Array!Node args) {
    return Form(type, args);
}

Form form(size_t n)(Form.Type type, Node[n] args) {
    return Form(type, args);
}

Ident ident(Array!char name) {
    return Ident(name);
}

Number num(size_t num) {
    return Number(num);
}

String str(Array!char str) {
    return String(str);
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
        str,
    }

    union Value {
        Form form;
        Ident ident;
        Number num;
        String str;
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

    this(String str) {
        value.str = str;
        type = Type.str;
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
}

/// ident or number, detects at runtime
struct Ident {
    Array!char repr;

    this(Array!char s) {
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

/// string value literal
struct String {
    Array!char value;

    this(Array!char v) {
        value = v;
    }
}
