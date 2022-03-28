
OPT ?= -O

LOPT ?= $(OPT)
COPT ?= $(OPT)
DOPT ?= $(OPT)

DASCFILES := minivm/vm/jit.dasc
CFILES := 
DFILES := brew/app.d brew/ast.d brew/comp.d brew/opt.d brew/parse.d brew/rt.d brew/vm.d brew/util.d

DASCOBJS := $(DASCFILES:%.dasc=%.o)
COBJS := $(CFILES:%.c=%.o)
DOBJS := $(DFILES:%.d=%.o)

bin/dbrew: $(DASCOBJS) $(COBJS) $(DOBJS)
	mkdir -p bin
	$(CC) $(LOPT) $(DASCOBJS) $(COBJS) $(DOBJS) -o$(@) $(LFLAGS)

minivm/minilua: minivm/luajit/src/host/minilua.c
	$(CC) -o minivm/minilua -lm minivm/luajit/src/host/minilua.c

$(DASCOBJS): $(@:%.o=%.dasc) minivm/minilua
	minivm/minilua minivm/luajit/dynasm/dynasm.lua -o $(@:%.o=%.tmp.c) $(@:%.o=%.dasc) $(DASCFLAGS)
	$(CC) $(COPT) -o$(@) -c $(@:%.o=%.tmp.c) $(CFLAGS)

$(DOBJS): $(@:%.o=%.d)
	$(DC) -betterC $(DOPT) -of$(@) -c $(@:%.o=%.d) $(DFLAGS)

$(COBJS): $(@:%.o=%.c)
	$(CC) $(COPT) -o$(@) -c $(@:%.o=%.c) $(CFLAGS)

bin: .dummy
	mkdir -p $@

.dummy:
