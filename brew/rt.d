module brew.rt;

import brew.vm;
import brew.util;

extern (C) Dynamic vm_run_ext(size_t func, Dynamic arg) {
    switch (func) {
    default:
        assert(false, "bad extern");
    }
}
