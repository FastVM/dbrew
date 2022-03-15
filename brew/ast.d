module brew.ast;

import std.algorithm;
import std.conv;
import std.meta;

Form form(Args...)(Args args)
{
    return Form(args);
}

Ident ident(string name)
{
    return Ident(name);
}

Number num(size_t num)
{
    return Number(num);
}

String str(string str)
{
    return String(str);
}

Node node(Type)(Type arg)
{
    return Node(arg);
}

/// any node, not valid in the ast
struct Node
{
    enum Type
    {
        form,
        ident,
        num,
        str,
    }

    union Value
    {
        Form form;
        Ident ident;
        Number num;
        String str;
    }

    Value value;
    Type type;

    this(Node other)
    {
        value = other.value;
        type = other.type;
    }

    this(Form form)
    {
        value.form = form;
        type = Type.form;
    }

    this(Ident ident)
    {
        value.ident = ident;
        type = Type.ident;
    }

    this(Number num)
    {
        value.num = num;
        type = Type.num;
    }

    this(String str)
    {
        value.str = str;
        type = Type.str;
    }

    string toString()
    {
        final switch (type)
        {
        case Type.form:
            return value.form.to!string;
        case Type.ident:
            return value.ident.to!string;
        case Type.num:
            return value.num.to!string;
        case Type.str:
            return value.str.to!string;
        }
    }
}

/// call of function or operator call
struct Form
{
    enum Type
    {
        addr,
        or,
        and,
        do_,
        if_,
        let,
        for_,
        call,
        extern_,
        func,
        program,
        ret,
        tfunc,
        tvalue,
    }
    Type form;
    Node[] args;

    this(Args...)(Type f, Args as)
    {
        static foreach (a; as)
        {
            static if (is(typeof(a) == Node[]))
            {
                args ~= a;
            }
            else
            {
                args ~= node(a);
            }
        }
        form = f;
    }

    string toString()
    {
        char[] ret;
        ret ~= "(";
        ret ~= form.to!string;
        foreach (i, v; args)
        {
            ret ~= " ";
            ret ~= v.to!string;
        }
        ret ~= ")";
        return cast(string) ret;
    }
}

/// ident or number, detects at runtime
struct Ident
{
    string repr;

    this(string s)
    {
        repr = s;
    }

    string toString()
    {
        return repr;
    }
}

/// number value literal
struct Number
{
    size_t value;

    this(T)(T v)
    {
        value = v;
    }

    string toString()
    {
        return "[" ~ value.to!string ~ "]";
    }
}

/// string value literal
struct String
{
    string value;

    this(T)(T v)
    {
        value = v;
    }

    string toString()
    {
        return "[" ~ value.to!string ~ "]";
    }
}
