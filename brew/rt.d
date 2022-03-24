module brew.rt;

import brew.vm;
import brew.util;
import raylib;

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

Color ecolor(Memory* gc, Dynamic arg) {
    return Color(cast(ubyte) gc.car(arg).num, cast(ubyte) gc.car(gc.cdr(arg)).num, cast(ubyte) gc.car(gc.cdr(gc.cdr(arg))).num, 255);
}

extern (C) Dynamic vm_run_ext(Memory* gc, size_t func, Dynamic arg) {
    switch (func) {
    case 0:
        edebug(gc, arg);
        printf("\n");
        return arg;
    case 1:
        InitWindow(gc.car(arg).num, gc.cdr(arg).num, "window");
        return Dynamic(0);
    case 2:
        CloseWindow();
        return Dynamic(0);
    case 3:
        if (WindowShouldClose()) {
            return Dynamic(1);
        } else {
            return Dynamic(0);
        }
    case 4:
        BeginDrawing();
        return Dynamic(0);
    case 5:
        EndDrawing();
        return Dynamic(0);
    case 6:
        Color color = gc.ecolor(arg);
        ClearBackground(color);
        return Dynamic(0);
    case 7:
        Color color = gc.ecolor(gc.car(arg));
        arg = gc.cdr(arg);
        Array!char name = gc.str(gc.car(arg));
        arg = gc.cdr(arg);
        name ~= '\0';
        scope(exit) free(name.ptr);
        Dynamic where = gc.car(arg);
        DrawText(name.ptr, gc.car(where).num, gc.cdr(where).num, gc.cdr(arg).num, color);
        return Dynamic(0);
    case 8:
        if (arg.type == Dynamic.Type.num) {
            return Dynamic(1);
        } else {
            return Dynamic(0);
        }
    case 9:
        Color color = gc.ecolor(gc.car(arg));
        arg = gc.cdr(arg);
        Dynamic p1 = gc.car(arg);
        Dynamic p2 = gc.cdr(arg);
        int x1 = gc.car(p1).num;
        int y1 = gc.cdr(p1).num;
        int x2 = gc.car(p2).num;
        int y2 = gc.cdr(p2).num;
        DrawRectangle(x1, y1, x2 - x1, y2 - y1, color);
        return Dynamic(0);
    default:
        assert(false, "bad extern");
    }
}
