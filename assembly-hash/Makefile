all: hash_asm.exe

hash_asm.exe: main.o hash.o
	gcc -m32 main.o hash.o -o hash_asm.exe

main.o: main.c
	gcc -m32 -c main.c -o main.o

hash.o: hash.c
	gcc -m32 -c hash.c -o hash.o

clean:
	rm *.o hash_asm.exe

