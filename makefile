
OPT ?= -Os

COPT ?= $(OPT)
DOPT ?= $(OPT)

CFILES := minivm/vm/vm.c minivm/vm/gc.c

VMS := $(CFILES:%.c=%.o)

bin/dbrew: brew/app.d $(VMS)
	$(DC) $(DOPT) -i brew/app.d $(VMS) -ofbin/dbrew 

$(VMS): $(@:%.o=%.c)
	$(CC) $(COPT) -o$(@) -c $(@:%.o=%.c)

bin: .dummy
	mkdir -p $@

.dummy:
