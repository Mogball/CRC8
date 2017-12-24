all:
	(cd assembly-add && make)
	(cd assembly-crc && make)

clean:
	(cd assembly-add && make clean)
	(cd assembly-crc && make clean)

