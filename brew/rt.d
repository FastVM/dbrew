module brew.rt;

import brew.vm;
import brew.util;

void edebug(Memory* gc, Dynamic arg) {
    if (arg.type == Dynamic.Type.num) {
        printf("%i", arg.num);
    } else {
        printf("cons ");
        edebug(gc, gc.car(arg));
        printf(" ");
        edebug(gc, gc.cdr(arg));
    }
}

extern (C) Dynamic vm_run_ext(Memory* gc, size_t func, Dynamic arg) {
    switch (func) {
    case 0:
        edebug(gc, arg);
        printf("\n");
        return arg;
    default:
        assert(false, "bad extern");
    }
}
