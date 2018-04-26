; Hello World for OSX 32bit
;
; nasm -f macho -o hello_osx32.o hello_osx32.asm
; ld -macosx_version_min 10.7.0 -e _start -o hello_osx32 hello_osx32.o

section .data
	msg db "Hello, World!", 10	; "Hello, World!\n"

section .text
	global _start

_start:
	push dword 14			; msg length
	push dword msg			; msg
	push dword 1			; stdout
	mov eax, 4			; sys write
	sub esp, 4
	int 0x80
	add esp, 16

	push dword 0			; exit code 0
	mov eax, 1			; sys exit
	sub esp, 12
	int 0x80 
