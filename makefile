
OPT ?= -O

LOPT ?= $(OPT)
COPT ?= $(OPT)
DOPT ?= $(OPT)

CFILES := minivm/vm/gc.c minivm/vm/vm.c
DFILES := brew/app.d brew/ast.d brew/comp.d brew/opt.d brew/parse.d brew/vm.d brew/util.d

COBJS := $(CFILES:%.c=%.o)
DOBJS := $(DFILES:%.d=%.o)

bin/dbrew: $(DOBJS) $(COBJS)
	mkdir bin
	$(CC) $(LOPT) $(DOBJS) $(COBJS) -o$(@) $(LFLAGS)

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
