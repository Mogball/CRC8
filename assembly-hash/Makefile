all: hash_asm.exe

hash_asm.exe: main.o hash.o
	gcc -m32 main.o hash.o -o hash_asm.exe

main.o: main.c
	gcc -m32 -c main.c -o main.o

hash.o: hash.asm
	nasm -f elf32 hash.asm -o hash.o

clean:
	rm *.o hash_asm.exe

