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
    Array!Opcode freeRegs;

    Opcode alloc() {
        if (freeRegs.length > 0) {
            Opcode ret = freeRegs[$-1];
            freeRegs.length--;
            return ret;
        } else {
            return nregs++;
        }
    }

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
            if (form.args[0].type == Node.Type.form && form.args[0].value.form.form == Form.Type.call) {
                Form cform = form.args[0].value.form;
                Array!char name = cform.args[0].value.ident.repr;
                if (name.ptr[0..name.length] == fname) {
                    Array!Opcode kargs;
                    foreach (arg; cform.args.ptr[1 .. cform.args.length]) {
                        kargs ~= compile(arg);
                    }
                    ops ~= [optcall, cast(Opcode) kargs.length];
                    ops ~= kargs;
                    return Opcode.max;
                }
            }
            if (form.args[0].type == Node.Type.num) {
                ops ~= [opreti, cast(Opcode) form.args[0].value.num.value];
            } else {
                Opcode reg = compile(form.args[0]);
                ops ~= [opret, reg];
            }
            return Opcode.max;
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
                locals[arg.value.ident.repr] = cast(Opcode) nregs;
                nregs += 1;
            }
            compile(form.args[$ - 1]);
            ops[nregswhere] = nregs;
            ops[jover] = cast(Opcode) ops.length;
            return Opcode.max;
        case Form.Type.call:
            Array!char name = form.args[0].value.ident.repr;
            if (name == "add" || name == "sub" ) {
                if (form.args[1].type == Node.Type.num) {
                    Opcode outreg = alloc;
                    Opcode rhs = compile(form.args[2]);
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
                    return outreg;
                } else {
                    Opcode lhs = compile(form.args[1]);
                    Opcode rhs = compile(form.args[2]);
                    Opcode outreg = alloc;
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
                    return outreg;
                }
            } else if (name == "mul" || name == "div" || name == "mod" || name == "lt" || name == "eq"|| name == "above" || name == "equal") {
                Opcode lhs = compile(form.args[1]);
                Opcode rhs = compile(form.args[2]);
                Opcode outreg = alloc;
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
                case "equal":
                    ops ~= opeq;
                    break;
                case "lt":
                case "above":
                    ops ~= oplt;
                    break;
                }
                ops ~= outreg;
                ops ~= rhs;
                ops ~= lhs;
                return outreg;
            }
            Array!Opcode kargs;
            foreach (arg; form.args.ptr[1 .. form.args.length]) {
                kargs ~= compile(arg);
            }
            if (Opcode* ptr = name in locals) {
                Opcode outreg = alloc;
                ops ~= [opdcall, outreg, *ptr, cast(Opcode) kargs.length];
                ops ~= kargs;
                return outreg;
            } else if (Opcode* ptr = name in funcs) {
                Opcode outreg = alloc;
                ops ~= [opcall, outreg, *ptr, cast(Opcode) kargs.length];
                ops ~= kargs;
                return outreg;
            } else if (name == "putchar") {
                ops ~= [opputchar];
                ops ~= kargs;
                return kargs[0];
            } else {
                printf("name not found: %.*s\n", name.length, name.ptr);
                assert(false);
            }
        case Form.Type.let:
            Opcode where = compile(form.args[1]);
            Array!char name = form.args[0].value.ident.repr;
            locals[name] = cast(Opcode) where;
            Opcode ret = compile(form.args[2]);
            locals.remove(name);
            return ret;
        case Form.Type.for_:
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
                    Opcode lhs = compile(args[1]);
                    Opcode rhs = compile(args[2]);
                    ops ~= [opbeq, rhs, lhs];
                    jfalse = cast(Opcode) ops.length++;
                    jtrue = cast(Opcode) ops.length++;
                    break;
                case "above":
                case "lt":  
                    Opcode lhs = compile(args[1]);
                    Opcode rhs = compile(args[2]);
                    ops ~= [opblt, rhs, lhs];
                    jfalse = cast(Opcode) ops.length++;
                    jtrue = cast(Opcode) ops.length++;
                    break;
                default:
                    break;
                }
            }
            if (jtrue == 0 && jfalse == 0) {
                Opcode branch = compile(form.args[0]);
                ops ~= [opbb, branch];
                jfalse = cast(Opcode) ops.length++;
                jtrue = cast(Opcode) ops.length++;
            }
            Opcode outreg = alloc;
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
            Opcode outreg = alloc;
            ops ~= [opintf, outreg, *ptr];
            return outreg;
        } else {
            assert(false, id.repr.ptr[0..id.repr.length]);
        }
    }

    Opcode compileType(Number num) {
        Opcode outreg = alloc;
        ops ~= [opint, outreg, cast(Opcode) num.value];
        return outreg;
    }

    Opcode compileType(String str) {
        assert(false);
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
    foreach (index, arg; forms) {
        emit.compile(arg.node);
    }
    emit.ops ~= [opcall, cast(Opcode) 0, cast(Opcode) emit.funcs["main"], cast(Opcode) 0];
    emit.ops ~= opexit;
    return emit.ops;
}
