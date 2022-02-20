module brew.opt;

import std.stdio;
import brew.ast;

Node optStmt(Node val)
{
    if (val.type == Node.Type.form)
    {
        if (val.value.form.form == Form.Type.let)
        {
            Node def = form(Form.Type.vvar, val.value.form.args[0], val.value.form.args[1].opt);
            return form(Form.Type.vblock, def, val.value.form.args[2].optStmt).node;
        }
        if (val.value.form.form == Form.Type.if_)
        {
            Node[] args = val.value.form.args;
            Node vcond = args[0].opt;
            Node vthen = args[1].optStmt;
            Node velse = args[2].optStmt;
            return form(Form.Type.vif, vcond, vthen, velse).node;
        }
        if (val.value.form.form == Form.Type.do_ || val.value.form.form == Form.Type.vblock)
        {
            Node[] all;
            foreach (arg; val.value.form.args)
            {
                Node vopt = optStmt(arg);
                Node[] varg = [vopt];
                if (vopt.type == Node.Type.form)
                {
                    if (vopt.value.form.form == Form.Type.vblock || vopt.value.form.form == Form.Type.do_)
                    {
                        varg = vopt.value.form.args;
                    }
                }
                all ~= varg;
            }
            return form(Form.Type.vblock, all).node;
        }
    }
    return val.opt;
}

Node opt(Node val)
{
    switch (val.type)
    {
    case Node.Type.form:
        switch (val.value.form.form)
        {
        case Form.Type.ret:
            Node res = opt(val.value.form.args[0]);
            if (res.type == Node.Type.form)
            {
                if (res.value.form.form == Form.Type.vblock || res.value.form.form == Form.Type.do_)
                {
                    Node[] args = res.value.form.args;
                    return form(Form.Type.vblock, args[0 .. $ - 1], form(Form.Type.ret, args[$ - 1])
                            .node.optStmt).node;
                }
                if (res.value.form.form == Form.Type.if_ || res.value.form.form == Form.Type.vif)
                {
                    Node[] args = res.value.form.args;
                    Node vcond = args[0].opt;
                    Node vthen = form(Form.Type.ret, args[1].opt).node.optStmt;
                    Node velse = form(Form.Type.ret, args[2].opt).node.optStmt;
                    return form(Form.Type.vif, vcond, vthen, velse).node;
                }
                if (res.value.form.form == Form.Type.let)
                {
                    Node[] args = res.value.form.args;
                    return form(Form.Type.let, args[0], args[1].opt, form(Form.Type.ret, args[2].opt)
                            .node.optStmt).node.opt;
                }
                if (res.value.form.form == Form.Type.for_)
                {
                    Node[] args = res.value.form.args;
                    return form(Form.Type.retfor, args[0], args[1].opt, args[2].opt).node;
                }
            }
            return form(Form.Type.ret, res).node;
        case Form.Type.vblock:
            Node[] args;
            foreach (arg; val.value.form.args)
            {
                args ~= arg.optStmt;
            }
            return form(Form.Type.vblock, args).node;
        case Form.Type.func:
            Node thenDo = val.value.form.args[$ - 1].optStmt;
            return form(Form.Type.func, val.value.form.args[0 .. $ - 1], thenDo).node;
        case Form.Type.do_:
            Node lhs = val.value.form.args[0].optStmt;
            Node rhs = val.value.form.args[1].optStmt;
            return form(Form.Type.do_, lhs, rhs).node;
        case Form.Type.let:
            Form xform = val.value.form;
            Node thenDo = xform.args[2].optStmt;
            Form vvar = form(Form.Type.vvar, xform.args[0], xform.args[1].opt);
            return form(Form.Type.do_, vvar, thenDo).node;
        default:
            Node[] args;
            foreach (arg; val.value.form.args)
            {
                args ~= arg.opt;
            }
            return form(val.value.form.form, args).node;
        }
    default:
        return val;
    }
}
