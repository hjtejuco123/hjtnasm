
;nasm -f elf32 test.asm -o test.o 
;ld -m elf_i386 test.o -o test 
;data section
section .data 
    msg db "Hello, World! Hadji", 0xA     ;13 characters
    ;msg_len equ $ - msg             ;compute the length msg 

section .text
    global _start

_start:
    mov eax, 4          ;sys_write
    mov ebx, 1          ;std_out
    mov ecx, msg        ;message
    mov edx, 20    ;length
    int 0x80            ;execute

    mov eax,1           ;sys_exit
    mov ebx,0           ;return 0
    int 0x80            ;execute





