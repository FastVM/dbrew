module brew.comp;

import std.stdio;
import std.conv;
import std.conv;
import brew.ast;
import brew.vm;

class Emitter
{
    size_t nregs;
    size_t[string] funcs;
    size_t[string] locals;
    Opcode[] ops;

    this()
    {
    }

    size_t compileType(Form form)
    {
        final switch (form.form)
        {
        case Form.Type.program:
            foreach (arg; form.args)
            {
                compile(arg);
            }
            string name = form.args[0].value.ident.repr;
            size_t outreg = nregs++;
            ops ~= [opcall, outreg, funcs["main"], 0];
            ops ~= opexit;
            return 0;
        case Form.Type.do_:
            size_t last = 0;
            foreach (arg; form.args)
            {
                last = compile(arg);
            }
            return last;
        case Form.Type.extern_:
            return 0;
        case Form.Type.tvalue:
            return 0;
        case Form.Type.tfunc:
            return 0;
        case Form.Type.ret:
            size_t arg = compile(form.args[0]);
            ops ~= [opret, arg];
            return arg;
        case Form.Type.func:
            string name = form.args[0].value.ident.repr;
            ops ~= opfunc;
            size_t jover = ops.length++;
            ops ~= form.args.length - 2;
            ops ~= name.length;
            foreach (chr; name) {
                ops ~= chr;
            }
            size_t nregswhere = ops.length++;
            funcs[name] = ops.length;
            nregs = 1;
            locals = null;
            compile(form.args[$-1]);
            ops[nregswhere] = nregs;
            ops[jover] = ops.length;
            return 0;
        case Form.Type.call:
            size_t[] kargs;
            foreach (arg; form.args[1..$]) {
                kargs ~= compile(arg);
            }
            string name = form.args[0].value.ident.repr;
            if (size_t* ptr = name in funcs) {
                size_t outreg = nregs++;
                ops ~= [opcall, outreg, *ptr, kargs.length];
                ops ~= kargs;
                return outreg;
            } else if (name == "putchar") {
                ops ~= [opputchar];
                ops ~= kargs;
                return kargs[0];
            }
            assert(false);
        case Form.Type.let:
        case Form.Type.and:
        case Form.Type.or:
        case Form.Type.for_:
        case Form.Type.if_:
        case Form.Type.addr:
            break;
        }
        assert(false, form.form.to!string);
    }

    size_t compileType(Ident id)
    {
        return locals[id.repr];
    }

    size_t compileType(Number num)
    {
        size_t outreg = nregs++;
        ops ~= [opint, outreg, num.value];
        return outreg;
    }

    size_t compileType(String str) {
        assert(false);
    }

    size_t compile(Node node)
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
}

Opcode[] compile(Node node)
{
    Emitter emit = new Emitter();
    emit.compile(node);
    return emit.ops;
}
