#!/usr/bin/env sh

set -e

mkdir -p bin
as -o bin/lib.o lib.s
dub build --quiet
cat ebrew/lib.eh ebrew/ebrew.eb > bin/all.eb
./dbrew bin/all.eb bin/out.c
cc bin/out.c bin/lib.o -nostdlib -o bin/ebrew -O3
