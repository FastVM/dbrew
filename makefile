
OPT ?= -O

LOPT ?= $(OPT)
COPT ?= $(OPT)
DOPT ?= $(OPT)

DASCFILES := minivm/vm/arch/x86.dasc
CFILES := 
DFILES := brew/app.d brew/ast.d brew/comp.d brew/opt.d brew/parse.d brew/vm.d brew/util.d

DASCOBJS := $(DASCFILES:%.dasc=%.o)
COBJS := $(CFILES:%.c=%.o)
DOBJS := $(DFILES:%.d=%.o)

bin/dbrew: $(DASCOBJS) $(COBJS) $(DOBJS)
	mkdir -p bin
	$(CC) $(LOPT) $(DASCOBJS) $(COBJS) $(DOBJS) -o $(@) $(LFLAGS)

minivm/bin/luajit-minilua: minivm/luajit/src/host/minilua.c
	$(CC) -o $(@) minivm/luajit/src/host/minilua.c -lm

$(DASCOBJS): $(@:%.o=%.dasc) | minivm/bin/luajit-minilua
	minivm/bin/luajit-minilua minivm/luajit/dynasm/dynasm.lua -o $(@:%.o=%.tmp.c) $(@:%.o=%.dasc)
	$(CC) $(COPT) -o $(@) -c $(@:%.o=%.tmp.c)

$(DOBJS): $(@:%.o=%.d)
	$(DC) -betterC $(DOPT) -of$(@) -c $(@:%.o=%.d) $(DFLAGS)

$(COBJS): $(@:%.o=%.c)
	$(CC) $(COPT) -o $(@) -c $(@:%.o=%.c) $(CFLAGS)

bin: .dummy
	mkdir -p $@

clean:
	$(MAKE) -C minivm clean
	rm brew/*.o bin/*

.dummy:
