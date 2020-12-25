MODULE_NAME := my_drive

ifneq ($(KERNELRELEASE),)

# If make is in kernel build mode
obj-m := $(MODULE_NAME).o
$(MODULE_NAME)-y := driver_src.o

else

# If make is in normal mode
KERNELDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

default:
	make -C $(KERNELDIR) M=$(PWD) modules

clean:
	rm -rf .*.cmd *.mod *.o *.ko Module.symvers modules.order *.mod.c .tmp*

endif