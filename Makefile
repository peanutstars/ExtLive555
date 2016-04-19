
CORES	:= $(shell cat /proc/cpuinfo | grep process | wc -l)

TARGET	= live
Makefile=$(TARGET)/Makefile

ifeq ( , $(wildcard $(Makefile)))
PREPARE := genMakefiles
endif

all: $(PREPARE)
	$(MAKE) -C $(TARGET) -j $(CORES)

genMakefiles:
	@(cd $(TARGET) ; ./genMakefiles linux)

clean: $(PREPARE)
	$(MAKE) -C $(TARGET) clean

install:
