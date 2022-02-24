
OPT ?= -Os

CFLAGS += -nostdlib
CFLAGS += -fno-unwind-tables -fno-asynchronous-unwind-tables
CFLAGS += -fno-exceptions
CFLAGS += -fno-stack-protector 
CFLAGS += -fomit-frame-pointer

COPT ?= $(OPT)
LOPT ?= $(OPT)
DOPT ?= $(OPT)

CFLAGS += $(COPT)
LFLAGS += $(LOPT)

bin/ebrew: bin/ebrew.o
	$(LD) -o $@ -s $^ $(LFLAGS)

bin/ebrew.o: bin/ebrew.c
	$(CC) -o $@ -c $^ $(CFLAGS)

bin/ebrew.c: bin/dbrew bin/all.eb
	./bin/dbrew bin/all.eb $@

bin/all.eb: ebrew/lib.eh ebrew/ebrew.eb
	cat $^ > $@

bin/dbrew: .dummy
	$(DC) $(DOPT) -i brew/app.d -ofbin/dbrew 

bin: .dummy
	mkdir -p $@

.dummy:
