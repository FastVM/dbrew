module dbrew.ast;

import std.algorithm;
import std.conv;
import std.meta;

/// any node, not valid in the ast
class Node
{
}

/// call of function or operator call
final class Form : Node
{
    string form;
    Node[] args;

    this(Args...)(string f, Args as)
    {
        static foreach (a; as)
        {
            args ~= a;
        }
        form = f;
    }

    override string toString()
    {
        char[] ret;
        ret ~= "(";
        ret ~= form;
        foreach (i, v; args)
        {
            ret ~= " ";
            ret ~= v.to!string;
        }
        ret ~= ")";
        return cast(string) ret;
    }
}

size_t usedSyms;

Ident genSym()
{
    usedSyms++;
    return new Ident("_purr_" ~ to!string(usedSyms - 1));
}

template ident(string name){
    Ident value;

    shared static this()
    {
        value = new Ident(name);
    }

    Ident ident() {
        return value;
    }
}

/// ident or number, detects at runtime
final class Ident : Node
{
    string repr;

    this(string s)
    {
        repr = s;
    }

    override string toString()
    {
        return repr;
    }
}

/// number value literal
final class Number : Node
{
    size_t value;

    this(T)(T v)
    {
        value = v;
    }

    override string toString()
    {
        return "[" ~ value.to!string ~ "]";
    }
}

/// string value literal
final class String : Node
{
    string value;

    this(T)(T v)
    {
        value = v;
    }

    override string toString()
    {
        return "[" ~ value.to!string ~ "]";
    }
}
