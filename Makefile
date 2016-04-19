
CORES	:= $(shell cat /proc/cpuinfo | grep process | wc -l)
DESTDIR	:= $(shell pwd)/../install

TARGET	= live
Makefile=$(TARGET)/Makefile

ifeq ( , $(wildcard $(Makefile)))
PREPARE := genMakefiles
endif

all: $(PREPARE)
	DESTDIR=$(DESTDIR) $(MAKE) -C $(TARGET) -j $(CORES)

genMakefiles:
	@(cd $(TARGET) ; ./genMakefiles linux)

clean: $(PREPARE)
	$(MAKE) -C $(TARGET) clean

install:
	$(MAKE) -C $(TARGET) install
