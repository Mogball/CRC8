all: add_asm

add_asm: main.o add.o
	gcc -m32 main.o add.o -o add_asm.exe

main.o: main.c
	gcc -m32 -c main.c

add.o: add.asm
	nasm -f elf32 add.asm -o add.o

clean:
	rm *.o add_asm

