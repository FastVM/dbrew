module brew.comp;

import std.stdio;
import std.conv;
import brew.ast;

enum ebrewPre = `
typedef __SIZE_TYPE__ value_t;
`;

string compileType(Form form)
{
    switch (form.form)
    {
    case "program":
        string ret = ebrewPre;
        foreach (arg; form.args)
        {
            ret ~= arg.compile;
        }
        return ret;
    case "do":
        return "({" ~ form.args[0].compile ~ ";" ~ form.args[1].compile ~ ";})";
    case "extern":
        string ret;
        ret ~= "value_t ";
        ret ~= form.args[0].compile;
        ret ~= "(";
        foreach (index, arg; form.args[1 .. $])
        {
            if (index != 0)
            {
                ret ~= ",";
            }
            ret ~= "value_t ";
            ret ~= arg.compile;

        }
        ret ~= ");";
        return ret;
    case "function":
        string name = form.args[0].compile;
        string ret;
        ret ~= "value_t ";
        ret ~= name;
        ret ~= "(";
        foreach (index, arg; form.args[1 .. $ - 1])
        {
            if (index != 0)
            {
                ret ~= ",";
            }
            ret ~= "value_t ";
            ret ~= arg.compile;

        }
        ret ~= ")";
        ret ~= "{";
        ret ~= "return ";
        ret ~= form.args[$ - 1].compile;
        ret ~= ";";
        ret ~= "}";
        return ret;
    case "call":
        string ret;
        ret ~= "((value_t(*)(";
        foreach (i; 1 .. form.args.length)
        {
            if (i != 1)
            {
                ret ~= ",";
            }
            ret ~= "value_t";
        }
        ret ~= "))";
        ret ~= form.args[0].compile;
        ret ~= ")";
        ret ~= "(";
        foreach (index, arg; form.args[1 .. $])
        {
            if (index != 0)
            {
                ret ~= ",";
            }
            ret ~= "(value_t)";
            ret ~= arg.compile;
        }
        ret ~= ")";
        return ret;
    case "let":
        return "({value_t " ~ form.args[0].compile ~ "=" ~ form.args[1].compile ~ ";" ~ form
            .args[2].compile ~ ";})";
    case "and":
        return "({value_t a=" ~ form.args[0].compile ~ ";a?" ~ form.args[1].compile ~ ":a;})";
    case "or":
        return "({value_t a=" ~ form.args[0].compile ~ ";a?a:" ~ form.args[1].compile ~ ";})";
    case "for":
        string name = form.args[0].compile;
        string ret;
        ret ~= "({value_t ";
        ret ~= name;
        ret ~= "=";
        ret ~= form.args[1].compile;
        ret ~= ";for(;;){value_t t=";
        ret ~= form.args[2].compile;
        ret ~= ";if(t){";
        ret ~= name;
        ret ~= "=t;}else{break;}}";
        ret ~= name;
        ret ~= ";})";
        return ret;
    case "if":
        return "((" ~ form.args[0].compile ~ ")?(" ~ form.args[1].compile ~ "):(" ~ form
            .args[2].compile ~ "))";
    case "addr":
        return "((value_t)&" ~ form.args[0].compile ~ ")";
    default:
        assert(false, form.form);
    }
}

string compileType(Ident id)
{
    if (id.repr == "_start")
    {
        return "_start";
    }
    string ret;
    ret ~= "f";
    foreach (chr; id.repr)
    {
        ubyte n = chr.to!ubyte;
        ret ~= to!string(n / 16, 16);
        ret ~= to!string(n % 16, 16);
    }
    return ret;
}

string compileType(Number num)
{
    return num.value.to!string;
}

string compileType(String str)
{
    string ret;
    ret ~= "(value_t)(void*)";
    ret ~= '"';
    foreach (chr; str.value)
    {
        ret ~= "\\x";
        ubyte n = chr.to!ubyte;
        ret ~= to!string(n / 16, 16);
        ret ~= to!string(n % 16, 16);
    }
    ret ~= '"';
    return ret;
}

string compile(Node node)
{
    if (Form form = cast(Form) node)
    {
        return compileType(form);
    }
    if (Ident id = cast(Ident) node)
    {
        return compileType(id);
    }
    if (Number num = cast(Number) node)
    {
        return compileType(num);
    }
    if (String str = cast(String) node)
    {
        return compileType(str);
    }
    assert(false);
}
