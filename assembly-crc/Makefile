all: crc_asm

crc_asm: main.o crc_table_init.o crc_calc.o
	gcc -m32 main.o crc_table_init.o crc_calc.o -o crc_asm.exe

main.o: main.c
	gcc -m32 -c main.c

crc_table_init.o: crc_table_init.c
	gcc -m32 -c crc_table_init.c

crc_calc.o: crc_calc.asm
	nasm -f elf32 crc_calc.asm

clean:
	rm *.o crc_asm.exe

