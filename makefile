NASMFLAGS = -felf64
BUILDDIR = ./build/

all: ch02_hello ch02_read_register ch02_print_call

clean:
	rm -rf $(BUILDDIR)
	mkdir $(BUILDDIR)
	touch $(BUILDDIR).exists

ch02_hello:
	nasm $(NASMFLAGS) ch02_hello.asm -o ${BUILDDIR}ch02_hello.o 
	ld -o ${BUILDDIR}ch02_hello ${BUILDDIR}ch02_hello.o 

ch02_read_register:
	nasm $(NASMFLAGS) ch02_read_register.asm -o ${BUILDDIR}ch02_read_register.o 
	ld -o ${BUILDDIR}ch02_read_register ${BUILDDIR}ch02_read_register.o 

ch02_print_call:
	nasm $(NASMFLAGS) ch02_print_call.asm -o ${BUILDDIR}ch02_print_call.o 
	ld -o ${BUILDDIR}ch02_print_call ${BUILDDIR}ch02_print_call.o 