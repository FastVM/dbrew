#!/usr/bin/env sh

set -e

env CCLUA=clang make -B CC=emcc DC=ldc2 DFLAGS+=-mtriple=wasm32 LDFLAGS+='-s STANDALONE_WASM=1' DASCFILES= OPT=-Os
