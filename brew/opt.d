module brew.opt;

import brew.ast;
import brew.util;

Form retopt(Form obj) {
    if (obj.form == Form.Type.func) {
        Array!Node args = obj.args[0..$-1];
        args ~= obj.args[$-1].value.form.retopt.node;
        return form(Form.Type.func, args);
    }
    if (obj.form == Form.Type.ret) {
        Node ret = obj.args[0];
        if (ret.type != Node.Type.form) {
            return obj;
        }
        Form retform = ret.value.form;
        if (retform.form == Form.Type.if_) {
            Node cond = retform.args[0];
            Form iftrue = form(Form.Type.ret, [retform.args[1]]).retopt;
            Form iffalse = form(Form.Type.ret, [retform.args[2]]).retopt;
            return form(Form.Type.if_, [cond, iftrue.node, iffalse.node]);
        }
        if (retform.form == Form.Type.let) {
            Form then = form(Form.Type.ret, [retform.args[2]]).retopt;
            return form(Form.Type.let, [retform.args[0], retform.args[1], then.node]);
        }
        if (retform.form == Form.Type.do_) {
            Form rhs = form(Form.Type.ret, [retform.args[1]]).retopt;
            return form(Form.Type.do_, [retform.args[0], rhs.node]);
        }
    }
    return obj;
}

Array!Form allopt(Array!Form funcs) {
    Array!Form ret;
    foreach (func; funcs) {
        ret ~= retopt(func);
    }
    return ret;
}
