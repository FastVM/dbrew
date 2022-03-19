module brew.opt;

import brew.ast;
import brew.util;

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
