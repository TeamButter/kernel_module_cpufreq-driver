PWD := $(shell pwd)

ifeq ($(ARCH), arm)
# when compiling for ARM we're cross compiling
export CROSS_COMPILE ?= $(call check_cc2, arm-linux-gnueabi-gcc, arm-linux-gnueabi-, arm-eabi-)
endif

.PHONY: build clean  


build:
	 $(MAKE) -C $(KDIR) M=$(PWD) modules  

clean:
	 rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c 


$(info Building with KERNELRELEASE = ${KERNELRELEASE}) 

#KBUILD_CPPFLAGS += -std=gnu99
obj-m :=    cpufreq-sc8810.o
