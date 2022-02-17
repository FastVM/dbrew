module brew.comp;

import std.stdio;
import std.conv;
import brew.ast;

enum ebrewPre = `
#include <unistd.h>
#include <stdint.h>
#include <stdio.h>
#include <errno.h>

typedef __SIZE_TYPE__ value_t;

value_t eb_stdin(value_t p, value_t n) {
    char *ptr = (void *)p;
    value_t d = 0;
    while (d < n) {
        ptr[d] = getchar();
        if (ptr[d] == '\0' || feof(stdin)) {
            break;
        }
        d += 1;
    }
    return d;
}

value_t eb_stdout(value_t p, value_t n) {
    return fprintf(stdout, "%.*s", n, p);
}

value_t eb_stderr(value_t p, value_t n) {
    return fprintf(stderr, "%.*s", n, p);
}

value_t eb_exit(value_t n) {
    exit(n);
}

value_t eb_malloc(value_t a) {
    return malloc(a);
}

value_t eb_debug49(value_t a) {
    printf("[[[%s]]]\n", strerror(errno));
    printf("t: %zu\n", a);
    return a;
}

value_t eb_debug49c(value_t a) {
    printf("[%c]", a);
    return a;
}

value_t eb_load(value_t a) {
    return *(value_t *)a;
}

value_t eb_store(value_t a, value_t b) {
    *(value_t *)a = b;
    return 0;
}

value_t eb_peek(value_t a) {
    return *(uint8_t *)a;
}

value_t eb_poke(value_t a, value_t b) {
    *(uint8_t *)a = b;
    return 0;
}

value_t eb_add(value_t x, value_t y) {
    return x + y;
}

value_t eb_sub(value_t x, value_t y) {
    return x - y;
}

value_t eb_mul(value_t x, value_t y) {
    return x * y;
}

value_t eb_div(value_t x, value_t y) {
    return x / y;
}

value_t eb_mod(value_t x, value_t y) {
    return x % y;
}

value_t eb_shl(value_t x, value_t y) {
    return y << x;
}

value_t eb_cmpa(value_t x, value_t y) {
    return x < y;
}

value_t eb_cmpe(value_t x, value_t y) {
    return x == y;
}

value_t eb_ne(value_t x, value_t y) {
    return x != y;
}

value_t eb_neg(value_t x) {
    __PTRDIFF_TYPE__ *y = (__PTRDIFF_TYPE__*)&x;
    *y = - *y;
    return *(value_t *)y;
}

value_t eb_not(value_t x) {
    return !x;
}

value_t eb_linux(size_t rdi, size_t rsi, size_t rdx, size_t rcx, size_t r8, size_t r9, size_t rax) {
    return syscall(rax, rdi, rsi, rdx, rcx, r8, r9);
}
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
        // ret ~= "printf(\"+ " ~ name ~ "\\n\");";
        ret ~= "value_t r=";
        ret ~= form.args[$ - 1].compile;
        ret ~= ";";
        // ret ~= "printf(\"- " ~ name ~ "\\n\");";
        ret ~= "return r;";
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
        return "main";
    }
    string ret;
    ret ~= "eb_";
    foreach (chr; id.repr)
    {
        if (chr == '_') {
            ret ~= "_UNDERSCORE_";
        } else if (chr == '-') {
            ret ~= "_DASH_";
        } else {
            ret ~= chr; 
        }
        // ubyte n = chr.to!ubyte;
        // ret ~= to!string(n / 16, 16);
        // ret ~= to!string(n % 16, 16);
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
