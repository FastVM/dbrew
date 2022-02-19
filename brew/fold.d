module brew.fold;

import std.stdio;
import std.algorithm;
import brew.ast;

struct Func
{
    string[] argNames;
    Node then;
}

struct Folder
{
    string[] nonFuncs;
    Func[string] funcs;

    Node foldType(Form toFold, ref Number[string] locals)
    {
        switch (toFold.form)
        {
        case "call":
            Ident first = toFold.args[0].value.ident;
            Node[] args;
            foreach (arg; toFold.args[1..$])
            {
                args ~= fold(arg, locals);
            }
            if (args.length == 2)
            {
                if (args[0].type == Node.Type.num && args[1].type == Node.Type.num)
                {
                    Number lhs = args[0].value.num;
                    Number rhs = args[1].value.num;
                    if (first.repr == "add")
                    {
                        return num(lhs.value + rhs.value).node;
                    }
                    if (first.repr == "sub")
                    {
                        return num(lhs.value - rhs.value).node;
                    }
                    if (first.repr == "mul")
                    {
                        return num(lhs.value * rhs.value).node;
                    }
                    if (first.repr == "div")
                    {
                        return num(lhs.value / rhs.value).node;
                    }
                    if (first.repr == "mod")
                    {
                        return num(lhs.value % rhs.value).node;
                    }
                    if (first.repr == "shl")
                    {
                        return num(rhs.value << lhs.value).node;
                    }
                    if (first.repr == "cmpe")
                    {
                        if (lhs.value == rhs.value)
                        {
                            return num(1).node;
                        }
                        else
                        {
                            return num(0).node;
                        }
                    }
                    if (first.repr == "cmpa")
                    {
                        if (lhs.value <= rhs.value)
                        {
                            return num(1).node;
                        }
                        else
                        {
                            return num(0).node;
                        }
                    }
                }
            }
            if (Func* func = first.repr in funcs)
            {
                bool isCtfe = true;
                foreach (arg; args)
                {
                    if (arg.type == Node.Type.num)
                    {
                        continue;
                    }
                    isCtfe = false;
                }
                if (isCtfe)
                {
                    Number[string] nextLocals = null;
                    foreach (argno, argname; func.argNames)
                    {
                        nextLocals[argname] = args[argno].value.num;
                    }
                    return fold(func.then, nextLocals);
                }
            }
            return form(toFold.form, first, args).node;
        case "and":
            Node lhs = fold(toFold.args[0], locals);
            if (lhs.type == Node.Type.num)
            {
                if (lhs.value.num.value == 0)
                {
                    return num(0).node;
                }
                else
                {
                    return fold(toFold.args[1], locals);
                }
            }
            else
            {
                return form("and", lhs, fold(toFold.args[1], locals)).node;
            }
        case "or":
            Node lhs = fold(toFold.args[0], locals);
            if (lhs.type == Node.Type.num)
            {
                if (lhs.value.num.value != 0)
                {
                    return lhs;
                }
                else
                {
                    return fold(toFold.args[1], locals);
                }
            }
            else
            {
                return form("or", lhs, fold(toFold.args[1], locals)).node;
            }
        case "if":
            Node cond = fold(toFold.args[0], locals);
            if (cond.type == Node.Type.num)
            {
                if (cond.value.num.value != 0)
                {
                    return fold(toFold.args[1], locals);
                }
                else
                {
                    return fold(toFold.args[2], locals);
                }
            }
            else
            {
                return form("if", cond, fold(toFold.args[1], locals), fold(toFold.args[2], locals)).node;
            }
        case "let":
            Ident id = toFold.args[0].value.ident;
            Node value = fold(toFold.args[1], locals);
            Node then = fold(toFold.args[2], locals);
            return form("let", id, value, then).node;
        case "program":
            Node[] args;
            foreach (ref arg; toFold.args)
            {
                Number[string] nextLocals;
                args ~= fold(arg, nextLocals);
            }
            return form(toFold.form, args).node;
        default:
            Node[] args;
            foreach (arg; toFold.args)
            {
                args ~= fold(arg, locals);
            }
            return form(toFold.form, args).node;
        }
    }

    Node foldType(Ident ident, ref Number[string] locals)
    {
        if (Number* ret = ident.repr in locals)
        {
            return node(*ret);
        }
        else
        {
            return ident.node;
        }
    }

    Node foldType(Number number, ref Number[string] locals)
    {
        return number.node;
    }

    Node foldType(String str, ref Number[string] locals)
    {
        return str.node;
    }
    
    Node fold(Node node, ref Number[string] locals)
    {
        final switch (node.type)
        {
        case Node.Type.form:
            return foldType(node.value.form, locals);
        case Node.Type.ident:
            return foldType(node.value.ident, locals);
        case Node.Type.num:
            return foldType(node.value.num, locals);
        case Node.Type.str:
            return foldType(node.value.str, locals);
        }
    }

    Node foldAll(Node node) {
        Number[string] locals;
        return fold(node, locals);
    }

    bool markType(Form toMark)
    {
        switch (toMark.form)
        {
        case "program":
            foreach (arg; toMark.args)
            {
                mark(arg);
            }
            return false;
        case "extern":
            Ident id = toMark.args[0].value.ident;
            if (id.repr != "add" && id.repr != "sub" && id.repr != "mul" && id.repr != "div" && id.repr != "mod" && id.repr != "shl" && id.repr != "cmpa" && id.repr != "cmpe")
            { 
                nonFuncs ~= id.repr;
            }
            return false;
        case "function":
            Ident id = toMark.args[0].value.ident;
            if (mark(toMark.args[$ - 1]))
            {
                string[] args;
                foreach (name; toMark.args[1 .. $ - 1])
                {
                    args ~= name.value.ident.repr;
                }
                funcs[id.repr] = Func(args, toMark.args[$ - 1]);
                return false;
            }
            else
            {
                nonFuncs ~= id.repr;
                return false;
            }
        default:
            foreach (arg; toMark.args)
            {
                if (!mark(arg))
                {
                    return false;
                }
            }
            return true;
        }
    }

    bool mark(Node node)
    {
        switch (node.type)
        {
        case Node.Type.form:
            return markType(node.value.form);
        case Node.Type.ident:
            return !nonFuncs.canFind(node.value.ident.repr);
        default:
            return true;
        }
    }
}
