
OPT ?= -Os

CFLAGS += -fno-asynchronous-unwind-tables
CFLAGS += -nostdlib
CFLAGS += -fno-exceptions
CFLAGS += -fomit-frame-pointer

COPT ?= $(OPT)
LOPT ?= $(OPT)
DOPT ?= $(OPT)

CFLAGS += $(COPT)
LFLAGS += $(LOPT)

bin/ebrew: bin/ebrew.o bin/lib.o
	$(LD) -o $@ -s $^ $(LFLAGS)

bin/ebrew.o: bin/ebrew.c
	$(CC) -o $@ -c $^ $(CFLAGS)

bin/ebrew.c: bin/dbrew bin/all.eb
	./bin/dbrew bin/all.eb $@

bin/all.eb: ebrew/lib.eh ebrew/ebrew.eb
	cat $^ > $@

bin/dbrew: .dummy
	$(DC) $(DOPT) -i brew/app.d -ofbin/dbrew 

bin/lib.o: lib.s
	as -o $@ $^

bin: .dummy
	mkdir -p $@

.dummy:
