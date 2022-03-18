module brew.comp;

import std.stdio;
import std.conv;
import std.conv;
import brew.ast;
import brew.vm;

enum size_t[2][string] binops = [
        "add": [opadd, opaddi],
        "sub": [opsub, opsubi],
        "mul": [opmul, opmuli],
        "div": [opdiv, opdivi],
        "mod": [opmod, opmodi],
    ];

struct Emitter {
    size_t nregs;
    size_t[string] funcs;
    size_t[string] locals;
    Opcode[] ops;

    size_t compileType(Form form) {
        final switch (form.form) {
        case Form.Type.do_:
            size_t last = 0;
            foreach (arg; form.args) {
                last = compile(arg);
            }
            return last;
        case Form.Type.extern_:
            return size_t.max;
        case Form.Type.ret:
            size_t reg = compile(form.args[0]);
            ops ~= [opret, reg];
            return size_t.max;
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
            foreach (arg; form.args[1 .. $ - 1]) {
                locals[arg.value.ident.repr] = nregs;
                nregs += 1;
            }
            compile(form.args[$ - 1]);
            ops[nregswhere] = nregs;
            ops[jover] = ops.length;
            return size_t.max;
        case Form.Type.call:
            string name = form.args[0].value.ident.repr;
            if (size_t[2]* ptr = name in binops) {
                size_t[2] op = *ptr;
                if (form.args[1].type == Node.Type.num) {
                    size_t lhs = form.args[1].value.num.value;
                    size_t rhs = compile(form.args[2]);
                    size_t outreg = nregs++;
                    ops ~= op[1];
                    ops ~= outreg;
                    ops ~= rhs;
                    ops ~= lhs;
                    return outreg;
                } else {
                    size_t lhs = compile(form.args[1]);
                    size_t rhs = compile(form.args[2]);
                    size_t outreg = nregs++;
                    ops ~= op[0];
                    ops ~= outreg;
                    ops ~= rhs;
                    ops ~= lhs;
                    return outreg;
                }
            }
            size_t[] kargs;
            foreach (arg; form.args[1 .. $]) {
                kargs ~= compile(arg);
            }
            if (size_t* ptr = name in locals) {
                size_t outreg = nregs++;
                ops ~= [opcalldyn, outreg, *ptr, kargs.length];
                ops ~= kargs;
                return outreg;
            } else if (size_t* ptr = name in funcs) {
                size_t outreg = nregs++;
                switch (kargs.length) {
                case 0:
                    ops ~= [opcall0, outreg, *ptr];
                    break;
                case 1:
                    ops ~= [opcall1, outreg, *ptr, kargs[0]];
                    break;
                case 2:
                    ops ~= [opcall2, outreg, *ptr, kargs[0], kargs[1]];
                    break;
                case 3:
                    ops ~= [
                        opcall3, outreg, *ptr, kargs[0], kargs[1], kargs[2]
                    ];
                    break;
                default:
                    ops ~= [opcall, outreg, *ptr, kargs.length];
                    ops ~= kargs;
                    break;
                }
                return outreg;
            } else if (name == "putchar") {
                ops ~= [opputchar];
                ops ~= kargs;
                return kargs[0];
            } else if (name == "cons") {
                size_t lhs = compile(form.args[0]);
                size_t rhs = compile(form.args[1]);
                size_t outreg = nregs++;
                ops ~= [oparray, outreg, 2, lhs, rhs];
                return outreg;
            } else if (name == "car") {
                size_t pair = compile(form.args[0]);
                size_t outreg = nregs++;
                ops ~= [opgeti, outreg, pair, 0];
                return outreg;
            } else if (name == "cdr") {
                size_t pair = compile(form.args[0]);
                size_t outreg = nregs++;
                ops ~= [opgeti, outreg, pair, 1];
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
            }
            assert(false, name);
        case Form.Type.let:
            size_t where = compile(form.args[1]);
            locals[form.args[0].value.ident.repr] = where;
            return compile(form.args[2]);
        case Form.Type.and:
            size_t lhs = compile(form.args[0]);
            size_t outreg = nregs++;
            ops ~= [opbeqi, lhs, 0];
            size_t jzero = ops.length++;
            size_t jnonzero = ops.length++;
            ops[jzero] = ops.length;
            ops ~= [opint, outreg, 0];
            ops ~= opjump;
            size_t jout = ops.length++;
            ops[jnonzero] = ops.length;
            size_t rhs = compile(form.args[1]);
            ops ~= [opreg, outreg, rhs];
            ops[jout] = ops.length;
            return outreg;
        case Form.Type.or:
            size_t lhs = compile(form.args[0]);
            size_t outreg = nregs++;
            ops ~= [opbeqi, lhs, 0];
            size_t jzero = ops.length++;
            size_t jnonzero = ops.length++;
            ops[jnonzero] = ops.length;
            ops ~= [opreg, outreg, lhs];
            ops ~= opjump;
            size_t jout = ops.length++;
            ops[jzero] = ops.length;
            size_t rhs = compile(form.args[1]);
            ops ~= [opreg, outreg, rhs];
            ops[jout] = ops.length;
            return outreg;
        case Form.Type.if_:
            size_t jtrue;
            size_t jfalse;
            if (form.args[0].type == Node.Type.form && form.args[0].value.form.form == Form
                .Type.call) {
                string name = form.args[0].value.form.args[0].value.ident.repr;
                Node[] args = form.args[0].value.form.args[1 .. $];
                switch (name) {
                case "eq":
                    if (args[0].type == Node.Type.num) {
                        size_t rhs = compile(args[1]);
                        ops ~= [opbeqi, rhs, args[0].value.num.value];
                        jfalse = ops.length++;
                        jtrue = ops.length++;
                    } else if (args[1].type == Node.Type.num) {
                        size_t lhs = compile(args[0]);
                        ops ~= [opbeqi, lhs, args[1].value.num.value];
                        jfalse = ops.length++;
                        jtrue = ops.length++;
                    } else {
                        size_t lhs = compile(args[0]);
                        size_t rhs = compile(args[1]);
                        ops ~= [opbeq, rhs, lhs];
                        jfalse = ops.length++;
                        jtrue = ops.length++;
                    }
                    break;
                case "lt":
                    if (args[0].type == Node.Type.num) {
                        size_t rhs = compile(args[1]);
                        ops ~= [opblti, rhs, args[0].value.num.value];
                        jfalse = ops.length++;
                        jtrue = ops.length++;
                    } else {
                        size_t lhs = compile(args[0]);
                        size_t rhs = compile(args[1]);
                        ops ~= [opblt, rhs, lhs];
                        jfalse = ops.length++;
                        jtrue = ops.length++;
                    }
                    break;
                default:
                    size_t branch = compile(form.args[0]);
                    ops ~= [opbb, branch];
                    jfalse = ops.length++;
                    jtrue = ops.length++;
                    break;
                }
            }
            size_t outreg = nregs++;
            ops[jtrue] = ops.length;
            size_t vtrue = compile(form.args[1]);
            ops ~= [opreg, outreg, vtrue];
            ops ~= opjump;
            size_t jend = ops.length++;
            ops[jfalse] = ops.length;
            size_t vfalse = compile(form.args[2]);
            ops ~= [opreg, outreg, vfalse];
            ops[jend] = ops.length;
            return outreg;
        }

        assert(false, form.form.to!string);
    }

    size_t compileType(Ident id) {
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

    size_t compileType(Number num) {
        size_t outreg = nregs++;
        ops ~= [opint, outreg, num.value];
        return outreg;
    }

    size_t compileType(String str) {
        assert(false);
    }

    size_t compile(Node node) {
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

Opcode[] compile(Form[] forms) {
    Emitter emit;
    foreach (arg; forms) {
        emit.compile(arg.node);
    }
    emit.ops ~= [opcall, 0, emit.funcs["main"], 0];
    emit.ops ~= opexit;
    return emit.ops;
}
