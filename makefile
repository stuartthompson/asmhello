all: hello_osx32.o
	ld -macosx_version_min 10.7.0 -e _start -o hello_osx32 hello_osx32.o
	ld -macosx_version_min 10.7.0 -lSystem -e _start -o hello_osx64 hello_osx64.o

hello_osx32.o:
	nasm -f macho -o hello_osx32.o hello_osx32.asm
	nasm -f macho64 -o hello_osx64.o hello_osx64.asm

clean:
	rm *.o
	rm hello_osx32
	rm hello_osx64
