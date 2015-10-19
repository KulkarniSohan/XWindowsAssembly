AS=as
LN=ld
ASFLAGS=-g -o
LIBS=-lc -lX11
LINKER=-dynamic-linker
LNFLAGS=-o

all:
	$(AS) $(ASFLAGS) asm_ui.o xwindows.S

link:
	$(LN) $(LNFLAGS) asm_ui $(LIBS) -dynamic-linker /lib/ld-linux.so.2 asm_ui.o -e main
