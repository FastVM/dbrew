module brew.comp;

import std.stdio;
import std.conv;
import brew.ast;

enum ebrewPre = `
typedef __SIZE_TYPE__ value_t;

static value_t eb_add(value_t x, value_t y) {
    return y + x;
}

static value_t eb_cmpa(value_t x, value_t y) {
    return y > x;
}

static value_t eb_cmpe(value_t x, value_t y) {
    return y == x;
}

static value_t eb_not(value_t x) {
    return !x;
}

static value_t eb_sub(value_t x, value_t y) {
    return y - x;
}

static value_t eb_mul(value_t x, value_t y) {
    return y * x;
}

static value_t eb_div(value_t x, value_t y) {
    return y / x;
}

static value_t eb_mod(value_t x, value_t y) {
    return y % x;
}

static value_t eb_shl(value_t x, value_t y) {
    return y << x;
}

static value_t eb_peek(value_t x) {
    return *(unsigned char*)x;
}

static value_t eb_load(value_t x) {
    return *(value_t*)x;
}

static value_t eb_poke(value_t x, value_t y) {
    *(unsigned char*)x = y;
    return y;
}

static value_t eb_store(value_t x, value_t y) {
    *(value_t*)x = y;
    return x;
}

static value_t eb_neg(value_t x) {
    return -x;
}

static value_t __attribute__((naked)) eb_linux(value_t rdi, value_t rsi, value_t rdx, value_t rcx, value_t r8, value_t r9, value_t rax) {
    __asm__(
        "mov 8(%rsp),%rax\n"
        "syscall\n"
        "ret\n"
    );
}

`;

string compileFunc(Node node)
{
    return node.compile;
}

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
    case Form.Type.vif:
        string ret;
        ret ~= "if(";
        ret ~= form.args[0].compile;
        ret ~= "){";
        ret ~= form.args[1].compile;
        ret ~= "}else{";
        ret ~= form.args[2].compile;
        ret ~= "}";
        return ret;
    case Form.Type.vblock:
        string ret;
        foreach (arg; form.args)
        {
            ret ~= arg.compile;
            if (ret[$-1] != ';')
            {
                ret ~= ";";
            }
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
            ret ~= arg.compile;

        }
        ret ~= ");";
        return ret;
    case Form.Type.tvalue:
        string ret;
        ret ~= "value_t ";
        ret ~= form.args[0].compile;
        return ret;
    case Form.Type.tfunc:
        string ret;
        ret ~= "value_t(*";
        ret ~= form.args[0].compile;
        ret ~= ")(";
        if (form.args.length == 1)
        {
            ret ~= "void";
        }
        else
        {
            foreach (index, arg; form.args[1..$])
            {
                if (index != 0)
                {
                    ret ~= ",";
                }
                ret ~= arg.compile; 
            }
        }
        ret ~= ")";
        return ret;
    case Form.Type.ret:
        string ret;
        ret ~= "return ";
        ret ~= form.args[0].compile;
        ret ~= ";";
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
            ret ~= arg.compile;

        }
        ret ~= ")";
        ret ~= "{";
        ret ~= form.args[$ - 1].compile;
        if (ret[$-1] != ';')
        {
            ret ~= ";";
        }
        ret ~= "}";
        return ret;
    case Form.Type.call:
        string ret;
        ret ~= form.args[0].compileFunc;
        ret ~= "(";
        foreach (index, arg; form.args[1 .. $])
        {
            if (index != 0)
            {
                ret ~= ",";
            }
            ret ~= arg.compile;
        }
        ret ~= ")";
        return ret;
    case Form.Type.vvar:
        string ret;
        ret ~= "value_t ";
        ret ~= form.args[0].compile;
        ret ~= "=";
        ret ~= form.args[1].compile;
        ret ~= ";";
        return ret;
    case Form.Type.let:
        return "({value_t " ~ form.args[0].compile ~ "=" ~ form.args[1].compile ~ ";" ~ form
            .args[2].compile ~ ";})";
    case Form.Type.and:
        return "({value_t a=" ~ form.args[0].compile ~ ";a?" ~ form.args[1].compile ~ ":a;})";
    case Form.Type.or:
        return "({value_t a=" ~ form.args[0].compile ~ ";a?a:" ~ form.args[1].compile ~ ";})";
    case Form.Type.retfor:
        string name = form.args[0].compile;
        string ret;
        ret ~= "value_t ";
        ret ~= name;
        ret ~= "=";
        ret ~= form.args[1].compile;
        ret ~= ";for(;;){value_t t=";
        ret ~= form.args[2].compile;
        ret ~= ";if(t == 0){return ";
        ret ~= name;
        ret ~= ";}";
        ret ~= name;
        ret ~= "=t;}";
        return ret;
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
    ret ~= "eb_";
    foreach (chr; id.repr)
    {
        if (chr == '-')
        {
            ret ~= "_DASH_";
        }
        else
        {
            ret ~= chr;
        }
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
