NASMFLAGS = -felf64
BUILDDIR = ./build/

all: ch02_hello ch02_read_register ch02_print_call ch02_endianness ch02_false ch02_strlen

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

ch02_endianness:
	nasm $(NASMFLAGS) ch02_endianness.asm -o ${BUILDDIR}ch02_endianness.o 
	ld -o ${BUILDDIR}ch02_endianness ${BUILDDIR}ch02_endianness.o 

ch02_false:
	nasm $(NASMFLAGS) ch02_false.asm -o ${BUILDDIR}ch02_false.o 
	ld -o ${BUILDDIR}ch02_false ${BUILDDIR}ch02_false.o 

ch02_strlen:
	nasm $(NASMFLAGS) ch02_strlen.asm -o ${BUILDDIR}ch02_strlen.o 
	ld -o ${BUILDDIR}ch02_strlen ${BUILDDIR}ch02_strlen.o 