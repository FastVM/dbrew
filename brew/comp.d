module brew.comp;

import brew.ast;
import brew.vm;
import brew.util;

struct Emitter {
    Opcode nregs;
    Table!Opcode funcs;
    Table!Opcode locals;
    Array!Opcode ops;

    Opcode compileType(Form form) {
        final switch (form.form) {
        case Form.Type.do_:
            Opcode last = 0;
            foreach (arg; form.args) {
                last = compile(arg);
            }
            return last;
        case Form.Type.extern_:
            return Opcode.max;
        case Form.Type.ret:
            Opcode reg = compile(form.args[0]);
            ops ~= [opret, reg];
            return Opcode.max;
        case Form.Type.func:
            Array!char name = form.args[0].value.ident.repr;
            ops ~= opfunc;
            Opcode jover = cast(Opcode) ops.length++;
            ops ~= form.args.length - 2;
            ops ~= name.length;
            foreach (chr; name) {
                ops ~= chr;
            }
            Opcode nregswhere = cast(Opcode) ops.length++;
            funcs[name] = cast(Opcode) ops.length;
            nregs = 1;
            locals = null;
            foreach (arg; form.args[1 .. $ - 1]) {
                locals[arg.value.ident.repr] = cast(Opcode) nregs;
                nregs += 1;
            }
            compile(form.args[$ - 1]);
            ops[nregswhere] = nregs;
            ops[jover] = cast(Opcode) ops.length;
            return Opcode.max;
        case Form.Type.call:
            Array!char name = form.args[0].value.ident.repr;
            if (name == "extern") {
                Opcode extno = cast(Opcode) form.args[1].value.num.value;
                Opcode reg = compile(form.args[2]);
                Opcode outreg = nregs++;
                ops ~= [opxcall, outreg, extno, reg]; 
                return outreg;
            } else if (name == "loop") {
                ops ~= opjump;
                Opcode jcond = cast(Opcode) ops.length++;
                Opcode redo = cast(Opcode) ops.length;
                Opcode reg = compile(form.args[1]);
                ops[jcond] = cast(Opcode) ops.length;
                ops ~= [opbb, reg];
                ops ~= redo;
                Opcode jfalse = cast(Opcode) ops.length++;
                ops[jfalse] = cast(Opcode) ops.length;
                return 0;
            } else if (name == "add" || name == "sub" || name == "mul" || name == "div" || name == "mod" || name == "lt" || name == "eq") {
                Opcode lhs = compile(form.args[1]);
                Opcode rhs = compile(form.args[2]);
                Opcode outreg = nregs++;
                final switch (name.ptr[0..name.length]) {
                case "add":
                    ops ~= opadd;
                    break;
                case "sub":
                    ops ~= opsub;
                    break;
                case "mul":
                    ops ~= opmul;
                    break;
                case "div":
                    ops ~= opdiv;
                    break;
                case "mod":
                    ops ~= opmod;
                    break;
                case "eq":
                    ops ~= opeq;
                    break;
                case "lt":
                    ops ~= oplt;
                    break;
                }
                ops ~= outreg;
                ops ~= rhs;
                ops ~= lhs;
                return outreg;
            }
            Array!Opcode kargs;
            foreach (arg; form.args[1 .. $]) {
                kargs ~= compile(arg);
            }
            if (Opcode* ptr = name in locals) {
                Opcode outreg = nregs++;
                ops ~= [opdcall, outreg, *ptr, cast(Opcode) kargs.length];
                ops ~= kargs;
                return outreg;
            } else if (Opcode* ptr = name in funcs) {
                Opcode outreg = nregs++;
                ops ~= [opcall, outreg, *ptr, cast(Opcode) kargs.length];
                ops ~= kargs;
                return outreg;
            } else if (name == "putchar") {
                ops ~= [opputchar];
                ops ~= kargs;
                return kargs[0];
            } else if (name == "cons") {
                Opcode outreg = nregs++;
                ops ~= [opcons, outreg];
                ops ~= kargs;
                return outreg;
            } else if (name == "car") {
                Opcode outreg = nregs++;
                ops ~= [opcar, outreg, kargs[0]];
                return outreg;
            } else if (name == "cdr") {
                Opcode outreg = nregs++;
                ops ~= [opcdr, outreg, kargs[0]];
                return outreg;
            }
            assert(false, "name not found");
        case Form.Type.let:
            Opcode where = compile(form.args[1]);
            Array!char name = form.args[0].value.ident.repr;
            locals[name] = cast(Opcode) where;
            Opcode ret = compile(form.args[2]);
            locals.remove(name);
            return ret;
        case Form.Type.if_:
            Opcode branch = compile(form.args[0]);
            ops ~= [opbb, branch];
            Opcode jfalse = cast(Opcode) ops.length++;
            Opcode jtrue = cast(Opcode) ops.length++;
            Opcode outreg = nregs++;
            ops[jtrue] = cast(Opcode) ops.length;
            Opcode vtrue = compile(form.args[1]);
            ops ~= [opreg, outreg, vtrue];
            ops ~= opjump;
            Opcode jend = cast(Opcode) ops.length++;
            ops[jfalse] = cast(Opcode) ops.length;
            Opcode vfalse = compile(form.args[2]);
            ops ~= [opreg, outreg, vfalse];
            ops[jend] = cast(Opcode) ops.length;
            return outreg;
        }

        assert(false, "bad form");
    }

    Opcode compileType(Ident id) {
        if (Opcode* ptr = id.repr in locals) {
            return *ptr;
        } else if (Opcode* ptr = id.repr in funcs) {
            Opcode outreg = nregs++;
            ops ~= [opint, outreg, *ptr];
            return outreg;
        } else {
            assert(false, id.repr.ptr[0..id.repr.length]);
        }
    }

    Opcode compileType(Number num) {
        Opcode outreg = nregs++;
        ops ~= [opint, outreg, cast(Opcode) num.value];
        return outreg;
    }

    Opcode compileType(String str) {
        // assert(false);
        Opcode chrreg = nregs++;
        Opcode outreg = nregs++;
        ops ~= [opint, outreg, cast(Opcode) 0];
        foreach_reverse(index; 0..str.value.length) {
            ops ~= [opint, chrreg, cast(Opcode) str.value[index]];
            ops ~= [opcons, outreg, chrreg, outreg];
        }
        return outreg;
    }

    Opcode compile(Node node) {
        final switch (node.type) {
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

Array!Opcode compile(Array!Form forms) {
    Emitter emit;
    emit.ops ~= opjump;
    size_t jover = emit.ops.length++;
    foreach (index, arg; forms) {
        emit.compile(arg.node);
    }
    emit.ops[jover] = cast(Opcode) emit.ops.length;
    assert("main" in emit.funcs);
    emit.ops ~= [opcall, cast(Opcode) 0, cast(Opcode) emit.funcs["main"], cast(Opcode) 0];
    emit.ops ~= opexit;
    return emit.ops;
}
