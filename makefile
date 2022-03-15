
OPT ?= -Os

CFILES := minivm/vm/vm.c minivm/vm/gc.c

VMS := $(CFILES:%.c=%.o)

bin/dbrew: brew/app.d $(VMS)
	$(DC) $(OPT) -i brew/app.d $(VMS) -ofbin/dbrew 

$(VMS): $(@:%.o=%.c)
	$(CC) $(OPT) -o$(@) -c $(@:%.o=%.c)

bin: .dummy
	mkdir -p $@

.dummy:
