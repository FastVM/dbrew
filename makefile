
OPT ?= -O

COPT ?= $(OPT)
DOPT ?= $(OPT)

CFILES := minivm/vm/vm.c minivm/vm/gc.c
DFILES := brew/app.d brew/ast.d brew/comp.d brew/opt.d brew/parse.d brew/vm.d brew/util.d

COBJS := $(CFILES:%.c=%.o)
DOBJS := $(DFILES:%.d=%.o)

bin/dbrew: $(DOBJS) $(COBJS)
	$(DC) -betterC $(DOPT) $(DOBJS) $(COBJS) -of$(@)

$(DOBJS): $(@:%.o=%.d)
	$(DC) -betterC $(DOPT) -of$(@) -c $(@:%.o=%.d)

$(COBJS): $(@:%.o=%.c)
	$(CC) $(COPT) -o$(@) -c $(@:%.o=%.c)

bin: .dummy
	mkdir -p $@

.dummy:
