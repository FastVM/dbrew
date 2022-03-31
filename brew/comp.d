module brew.comp;

import brew.ast;
import brew.vm;
import brew.util;

struct Emitter {
    Table!Opcode funcs;
    Table!Opcode locals;
    Array!Opcode ops;
    char[] fname;

    Opcode nregs;
    Opcode nregsMax;

    Opcode alloc() {
        Opcode ret = nregs++;
        if (ret > nregsMax) {
            nregsMax = ret;
        }
        return ret;
    }

    void compileType(Form form, Opcode outreg) {
        final switch (form.form) {
        case Form.Type.do_:
            foreach (arg; form.args) {
                compile(arg, outreg);
            }
            break;
        case Form.Type.extern_:
            break;
        case Form.Type.ret:
            if (form.args[0].type == Node.Type.form && form.args[0].value.form.form == Form.Type.call) {
                Form cform = form.args[0].value.form;
                Array!char name = cform.args[0].value.ident.repr;
                if (name.ptr[0..name.length] == fname) {
                    Array!Opcode kargs;
                    Opcode treg = outreg;
                    foreach (num, arg; cform.args.ptr[1 .. cform.args.length]) {
                        Opcode creg = compileMaybe(arg, treg);
                        if (creg == treg) {
                            treg = alloc;
                        }
                        kargs ~= creg;
                    }
                    ops ~= [optcall, cast(Opcode) kargs.length];
                    ops ~= kargs;
                    break;
                }
            }
            if (form.args[0].type == Node.Type.num) {
                ops ~= [opreti, cast(Opcode) form.args[0].value.num.value];
            } else {
                Opcode ret = compileMaybe(form.args[0], 0);
                ops ~= [opret, ret];
            }
            break;
        case Form.Type.func:
            Array!char name = form.args[0].value.ident.repr;
            fname = name.ptr[0..name.length];
            ops ~= opfunc;
            Opcode jover = cast(Opcode) ops.length++;
            ops ~= form.args.length - 2;
            Opcode nregswhere = cast(Opcode) ops.length++;
            funcs[name] = cast(Opcode) ops.length;
            nregs = 1;
            locals = null;
            foreach (arg; form.args.ptr[1 .. form.args.length - 1]) {
                locals[arg.value.ident.repr] = alloc;
            }
            nregsMax = nregs;
            compileMaybe(form.args[$ - 1], 0);
            ops[nregswhere] = nregsMax;
            ops[jover] = cast(Opcode) ops.length;
            break;
        case Form.Type.call:
            Array!char name = form.args[0].value.ident.repr;
            if (name == "add" || name == "sub" ) {
                if (form.args[1].type == Node.Type.num) {
                    Opcode rhs = compileMaybe(form.args[2], outreg);
                    final switch (name.ptr[0..name.length]) {
                    case "add":
                        ops ~= opaddi;
                        break;
                    case "sub":
                        ops ~= opsubi;
                        break;
                    }
                    ops ~= outreg;
                    ops ~= rhs;
                    ops ~= cast(Opcode) form.args[1].value.num.value;
                    break;
                } else {
                    Opcode lhs = compileMaybe(form.args[1], alloc);
                    Opcode rhs = compileMaybe(form.args[2], outreg);
                    final switch (name.ptr[0..name.length]) {
                    case "add":
                        ops ~= opadd;
                        break;
                    case "sub":
                        ops ~= opsub;
                        break;
                    }
                    ops ~= outreg;
                    ops ~= rhs;
                    ops ~= lhs;
                    break;
                }
            } else if (name == "mul" || name == "div" || name == "mod") {
                Opcode lhs = compileMaybe(form.args[1], alloc);
                Opcode rhs = compileMaybe(form.args[2], outreg);
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
                }
                ops ~= outreg;
                ops ~= rhs;
                ops ~= lhs;
                break;
            }
            Array!Opcode kargs;
            Opcode treg = outreg;
            foreach (num, arg; form.args.ptr[1 .. form.args.length]) {
                Opcode creg = compileMaybe(arg, treg);
                if (creg == treg) {
                    treg = alloc;
                }
                kargs ~= creg;
            }
            if (Opcode* ptr = name in locals) {
                ops ~= [opdcall, outreg, *ptr, cast(Opcode) kargs.length];
                ops ~= kargs;
                break;
            } else if (Opcode* ptr = name in funcs) {
                ops ~= [opcall, outreg, *ptr, cast(Opcode) kargs.length];
                ops ~= kargs;
                break;
            } else if (name == "putchar") {
                ops ~= [opputchar];
                ops ~= kargs;
                break;
            } else {
                printf("name not found: %.*s\n", name.length, name.ptr);
                assert(false);
            }
        case Form.Type.let:
            Opcode varreg = compileMaybe(form.args[1], alloc);
            locals[form.args[0].value.ident.repr] = varreg;
            compile(form.args[2], outreg);
            locals.remove(form.args[0].value.ident.repr);
            break;
        case Form.Type.and:
        case Form.Type.or:
            assert(false, "bad form");
        case Form.Type.if_:
            Opcode jfalse;
            Opcode jtrue;
            if (form.args[0].type == Node.Type.form && form.args[0].value.form.form == Form.Type.call) {
                Array!Node args = form.args[0].value.form.args;
                Ident func = args[0].value.ident;
                char[] name = func.repr.ptr[0..func.repr.length];
                switch (name) {
                case "equal":
                case "eq":
                    Opcode lhs = compileMaybe(args[1], outreg);
                    Opcode rhs = compileMaybe(args[2], alloc);
                    ops ~= [opbeq, rhs, lhs];
                    jfalse = cast(Opcode) ops.length++;
                    jtrue = cast(Opcode) ops.length++;
                    break;
                case "above":
                case "lt":  
                    Opcode lhs = compileMaybe(args[1], outreg);
                    Opcode rhs = compileMaybe(args[2], alloc);
                    ops ~= [opblt, rhs, lhs];
                    jfalse = cast(Opcode) ops.length++;
                    jtrue = cast(Opcode) ops.length++;
                    break;
                default:
                    break;
                }
            }
            if (jtrue == 0 && jfalse == 0) {
                Opcode condreg = compileMaybe(form.args[0], outreg);
                ops ~= [opbb, condreg];
                jfalse = cast(Opcode) ops.length++;
                jtrue = cast(Opcode) ops.length++;
            }
            ops[jtrue] = cast(Opcode) ops.length;
            compile(form.args[1], outreg);
            ops ~= opjump;
            Opcode jend = cast(Opcode) ops.length++;
            ops[jfalse] = cast(Opcode) ops.length;
            compile(form.args[2], outreg); 
            ops[jend] = cast(Opcode) ops.length;
            break;
        }
    }

    void compileType(Ident id, Opcode outreg) {
        if (Opcode* ptr = id.repr in locals) {
            ops ~= [opreg, outreg, *ptr];
        } else if (Opcode* ptr = id.repr in funcs) {
            ops ~= [opintf, outreg, *ptr];
        } else {
            assert(false, id.repr.ptr[0..id.repr.length]);
        }
    }

    void compileType(Number num, Opcode outreg) {
        ops ~= [opint, outreg, cast(Opcode) num.value];
    }

    void compileType(String str, Opcode outreg) {
        assert(false);
    }

    Opcode compileMaybe(Node node, Opcode outreg) {
        if (node.type == Node.Type.ident) {
            if (Opcode* ptr = node.value.ident.repr in locals) {
                return *ptr;
            }
        }
        if (node.type == Node.Type.form) {
            Form form = node.value.form;
            if (form.form == Form.Type.let) {
                Opcode varreg = compileMaybe(form.args[1], alloc);
                locals[form.args[0].value.ident.repr] = varreg;
                Opcode ret = compileMaybe(form.args[2], outreg);
                locals.remove(form.args[0].value.ident.repr);
                return ret;
            }
        }
        compile(node, outreg);
        return outreg;
    }

    void compile(Node node, Opcode outreg) {
        Opcode nregsOld = nregs;
        scope(exit) nregs = nregsOld;
        final switch (node.type) {
        case Node.Type.form:
            return compileType(node.value.form, outreg);
        case Node.Type.ident:
            return compileType(node.value.ident, outreg);
        case Node.Type.num:
            return compileType(node.value.num, outreg);
        case Node.Type.str:
            return compileType(node.value.str, outreg);
        }
    }
}

Array!Opcode compile(Array!Form forms) {
    Emitter emit;
    foreach (index, arg; forms) {
        emit.compileMaybe(arg.node, 0);
    }
    emit.ops ~= [opcall, cast(Opcode) 0, cast(Opcode) emit.funcs["main"], cast(Opcode) 0];
    emit.ops ~= opexit;
    return emit.ops;
}
