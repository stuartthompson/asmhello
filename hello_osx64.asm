; Hello World for OSX x64
;
; nasm -f macho64 -o hello_osx64.o hello_osx64.asm
; ld -macosx_version_min 10.7.0 -lSystem -e _start -o hello_osx64 hello_osx64.o

section	.data
	msg db "Hello, World!", 10

section	.text
	global _start

_start:
	mov rax, 0x2000004 		; sys write
	mov rdi, 1			; stdout
	mov rsi, msg			; msg data
	mov rdx, 14			; msg length
	syscall

	mov rax, 0x2000001		; sys exit
	mov rdi, 0			; exit code
	syscall
