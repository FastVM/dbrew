module brew.comp;

import std.stdio;
import std.conv;
import brew.ast;

enum ebrewPre = `typedef __SIZE_TYPE__ value_t;`;

string compileType(Form form)
{
    final switch (form.form)
    {
    case Form.Type.program:
        string ret = ebrewPre;
        foreach (arg; form.args)
        {
            ret ~= arg.compile;
        }
        return ret;
    case Form.Type.do_:
        return "({" ~ form.args[0].compile ~ ";" ~ form.args[1].compile ~ ";})";
    case Form.Type.extern_:
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
    case Form.Type.func:
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
    case Form.Type.call:
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
    case Form.Type.let:
        return "({value_t " ~ form.args[0].compile ~ "=" ~ form.args[1].compile ~ ";" ~ form
            .args[2].compile ~ ";})";
    case Form.Type.and:
        return "({value_t a=" ~ form.args[0].compile ~ ";a?" ~ form.args[1].compile ~ ":a;})";
    case Form.Type.or:
        return "({value_t a=" ~ form.args[0].compile ~ ";a?a:" ~ form.args[1].compile ~ ";})";
    case Form.Type.for_:
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
    case Form.Type.if_:
        return "((" ~ form.args[0].compile ~ ")?(" ~ form.args[1].compile ~ "):(" ~ form
            .args[2].compile ~ "))";
    case Form.Type.addr:
        return "((value_t)&" ~ form.args[0].compile ~ ")";
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
    return num.value.to!string ~ "U";
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
    final switch (node.type)
    {
    case Node.Type.form:
        return compileType(node.value.form);
    case Node.Type.ident:
        return compileType(node.value.ident);
    case Node.Type.num:
        return compileType(node.value.num);
    case Node.Type.str:
        return compileType(node.value.str);
    }
}
