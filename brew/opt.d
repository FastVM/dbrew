module brew.opt;

import brew.ast;
import brew.util;

Form retopt(Form obj) {
    if (obj.form == Form.Type.func) {
        obj.args[$-1] = obj.args[$-1].value.form.retopt.node;
        return obj;
    }
    if (obj.form == Form.Type.ret) {
        Node ret = obj.args[0];
        if (ret.type != Node.Type.form) {
            return obj;
        }
        Form retform = ret.value.form;
        if (retform.form == Form.Type.if_) {
            retform.args[1] = form(Form.Type.ret, [retform.args[1]]).retopt.node;
            retform.args[2] = form(Form.Type.ret, [retform.args[2]]).retopt.node;
            return obj;
        }
        if (retform.form == Form.Type.let) {
            retform.args[2] = form(Form.Type.ret, [retform.args[2]]).retopt.node;
            return obj;
        }
        if (retform.form == Form.Type.do_) {
            retform.args[1] = form(Form.Type.ret, [retform.args[1]]).retopt.node;
            return obj;
        }
    }
    return obj;
}

Array!Form allopt(Array!Form funcs) {
    foreach (index, func; funcs) {
        funcs[index] = retopt(func);
    }
    return funcs;
}
