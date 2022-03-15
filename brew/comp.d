module brew.comp;

import std.stdio;
import std.conv;
import std.conv;
import brew.ast;
import brew.vm;

enum size_t[string] binops = [
    "add": opadd,
    "sub": opsub,
    "mul": opmul,
    "div": opdiv,
    "mod": opmod,
    "pow": oppow,
];

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
            foreach (arg; form.args[1..$-1]) {
                locals[arg.value.form.args[0].value.ident.repr] = nregs;
                nregs += 1;
            }
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
            if (size_t* ptr = name in locals) {
                size_t outreg = nregs++;
                ops ~= [opcalldyn, outreg, *ptr, kargs.length];
                ops ~= kargs;
                return outreg;
            } else if (size_t* ptr = name in funcs) {
                size_t outreg = nregs++;
                ops ~= [opcall, outreg, *ptr, kargs.length];
                ops ~= kargs;
                return outreg;
            } else if (name == "putchar") {
                ops ~= [opputchar];
                ops ~= kargs;
                return kargs[0];
            } else if (size_t* ptr = name in binops) {
                size_t outreg = nregs++;
                assert(kargs.length == 2);
                ops ~= [*ptr];
                ops ~= outreg;
                ops ~= kargs[1]; 
                ops ~= kargs[0]; 
                return outreg;
            } else if (name == "eq") {
                size_t outreg = nregs++;
                assert(kargs.length == 2);
                ops ~= [opbeq, kargs[1], kargs[0]];
                size_t jfalse = ops.length++;
                size_t jtrue = ops.length++;
                ops[jfalse] = ops.length;
                ops ~= [opint, outreg, 0];
                ops ~= opjump;
                size_t end = ops.length++;
                ops[jtrue] = ops.length;
                ops ~= [opint, outreg, 1];
                ops[end] = ops.length;
                return outreg;
            } else if (name == "neq") {
                size_t outreg = nregs++;
                assert(kargs.length == 2);
                ops ~= [opbeq, kargs[0], kargs[1]];
                size_t jfalse = ops.length++;
                size_t jtrue = ops.length++;
                ops[jfalse] = ops.length;
                ops ~= [opint, outreg, 0];
                ops ~= opjump;
                size_t end = ops.length++;
                ops[jtrue] = ops.length;
                ops ~= [opint, outreg, 1];
                ops[end] = ops.length;
                return outreg;
            } else if (name == "lt") {
                size_t outreg = nregs++;
                assert(kargs.length == 2);
                ops ~= [opblt, kargs[1], kargs[0]];
                size_t jfalse = ops.length++;
                size_t jtrue = ops.length++;
                ops[jfalse] = ops.length;
                ops ~= [opint, outreg, 0];
                ops ~= opjump;
                size_t end = ops.length++;
                ops[jtrue] = ops.length;
                ops ~= [opint, outreg, 1];
                ops[end] = ops.length;
                return outreg;
            } else if (name == "gt") {
                size_t outreg = nregs++;
                assert(kargs.length == 2);
                ops ~= [opblt, kargs[0], kargs[1]];
                size_t jfalse = ops.length++;
                size_t jtrue = ops.length++;
                ops[jfalse] = ops.length;
                ops ~= [opint, outreg, 0];
                ops ~= opjump;
                size_t end = ops.length++;
                ops[jtrue] = ops.length;
                ops ~= [opint, outreg, 1];
                ops[end] = ops.length;
                return outreg;
            }
            assert(false);
        case Form.Type.let:
            size_t where = compile(form.args[1]);
            locals[form.args[0].value.ident.repr] = where;
            return compile(form.args[2]);
        case Form.Type.and:
        case Form.Type.or:
        case Form.Type.for_:
            break;
        case Form.Type.if_:
            size_t branch = compile(form.args[0]);
            size_t outreg = nregs++;
            ops ~= [opbb, branch];
            size_t jfalse = ops.length++;
            size_t jtrue = ops.length++;
            ops[jtrue] = ops.length;
            size_t vtrue = compile(form.args[1]);
            ops ~= [opreg, outreg, vtrue];
            ops ~= opjump;
            size_t jend = ops.length++;
            ops[jfalse] = ops.length;
            size_t vfalse = compile(form.args[2]);
            ops ~= [opreg, outreg, vfalse];
            ops[jend] = ops.length;
            return branch;
        }
        assert(false, form.form.to!string);
    }

    size_t compileType(Ident id)
    {
        if (size_t* ptr = id.repr in locals) {
            return *ptr;
        } else if (size_t* ptr = id.repr in funcs) {
            size_t outreg = nregs++;
            ops ~= [opint, outreg, *ptr];
            return outreg;
        } else {
            assert(false);
        }
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
