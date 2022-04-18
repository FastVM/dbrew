

CCLUA ?= $(CC)

OPT ?= -O

LOPT ?= $(OPT)
COPT ?= $(OPT)
DOPT ?= $(OPT)

CFILES := minivm/vm/jump.c minivm/vm/int.c minivm/vm/gc.c
DFILES := brew/app.d brew/ast.d brew/comp.d brew/opt.d brew/parse.d brew/vm.d brew/util.d

COBJS := $(CFILES:%.c=%.o)
DOBJS := $(DFILES:%.d=%.o)

bin/dbrew: $(COBJS) $(DOBJS)
	mkdir -p bin
	$(CC) $(LOPT) $(COBJS) $(DOBJS) -o $(@) $(LDFLAGS)

objs: $(COBJS) $(DOBJS)

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
