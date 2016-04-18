
TARGET	= live
Makefile=$(TARGET)/Makefile

ifeq ( , $(wildcard $(Makefile)))
PREPARE := genMakefiles
endif

all: $(PREPARE)
	$(MAKE) -C $(TARGET)

genMakefiles:
	@(cd $(TARGET) ; ./genMakefiles linux)

clean:
	$(MAKE) -C $(TARGET) clean

install:
