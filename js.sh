#!/usr/bin/env sh

set -e

env CCLUA=clang make objs -B CC=clang DC=ldc2 DFLAGS+='-mtriple=wasm32' CFLAGS+='--target=wasm32' OPT=-Os
wasm-ld-12 brew/*.o minivm/vm/*.o -o bin/dbrew.wasm --entry=main --allow-undefined