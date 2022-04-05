
OPT ?= -O

LOPT ?= $(OPT)
COPT ?= $(OPT)
DOPT ?= $(OPT)

CFILES := 
DFILES := brew/app.d brew/ast.d brew/comp.d brew/opt.d brew/parse.d brew/vm.d brew/util.d

COBJS := $(CFILES:%.c=%.o)
DOBJS := $(DFILES:%.d=%.o)

bin/dbrew: $(COBJS) $(DOBJS)
	mkdir -p bin
	$(CC) $(LOPT) $(COBJS) $(DOBJS) -o$(@) $(LFLAGS)

minivm/minilua: minivm/luajit/src/host/minilua.c
	$(CC) -o minivm/minilua -lm minivm/luajit/src/host/minilua.c

$(DOBJS): $(@:%.o=%.d)
	$(DC) -betterC $(DOPT) -of$(@) -c $(@:%.o=%.d) $(DFLAGS)

$(COBJS): $(@:%.o=%.c)
	$(CC) $(COPT) -o$(@) -c $(@:%.o=%.c) $(CFLAGS)

bin: .dummy
	mkdir -p $@

.dummy:
