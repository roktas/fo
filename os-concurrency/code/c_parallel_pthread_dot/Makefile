# Test kodlarını üret.
# Kullanım:
# 	make       # üret
# 	make clean # temizle

PROGS  := $(patsubst %.c,%,$(wildcard *.c))

# pthread kitaplığını ekle.
CFLAGS += -Wall -lpthread

all: $(PROGS)
clean: $(PROGS)
	rm -f $(PROGS)
