
OPT ?= -O

LOPT ?= $(OPT)
COPT ?= $(OPT)
DOPT ?= $(OPT)

CFILES := minivm/vm/gc.c minivm/vm/vm.c
DFILES := brew/app.d brew/ast.d brew/comp.d brew/opt.d brew/parse.d brew/rt.d brew/vm.d brew/util.d

COBJS := $(CFILES:%.c=%.o)
DOBJS := $(DFILES:%.d=%.o)

bin/dbrew: $(DOBJS) $(COBJS)
	mkdir -p bin
	$(CC) $(LOPT) $(DOBJS) $(COBJS) -o$(@) $(LFLAGS)

bin/dbrew.wasm: .dummy
	$(MAKE) -B OPT='$(OPT)' CC='emcc' DFLAGS+='--march=wasm32' LFLAGS+='-s WASM=1 -s STANDALONE_WASM $(OPT)'

objs: dobjs cobjs

dobjs: $(DOBJS)

cobjs: $(COBJS)

$(DOBJS): $(@:%.o=%.d)
	$(DC) -betterC $(DOPT) -of$(@) -c $(@:%.o=%.d) $(DFLAGS)

$(COBJS): $(@:%.o=%.c)
	$(CC) $(COPT) -o$(@) -c $(@:%.o=%.c) $(CFLAGS)

bin: .dummy
	mkdir -p $@

.dummy:
