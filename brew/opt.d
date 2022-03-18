module brew.opt;

import brew.ast;

Form retopt(Form obj) {
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
        return obj;
    }
    Node[] args;
    foreach (arg; obj.args) {
        if (arg.type == Node.Type.form) {
            args ~= retopt(arg.value.form).node;
        } else {
            args ~= arg;
        }
    }
    return form(obj.form, args);
}

Form[] allopt(Form[] funcs) {
    Form[] ret;
    foreach (func; funcs) {
        ret ~= retopt(func);
    }
    return ret;
}
