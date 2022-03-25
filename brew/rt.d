module brew.rt;

import brew.vm;
import brew.util;
import raylib;

extern (C) Dynamic vm_run_ext(size_t func, Dynamic arg) {
    switch (func) {
    default:
        assert(false, "bad extern");
    }
}
