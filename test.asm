;nasm -f elf32 test.asm -o test.o 
;ld -m elf_i386 test.o -o test 

;---------------------
;virtual box
;ubuntu 22


;data section
section .data 
    msg db "Hello, World! Hadji", 0xA     ;13 characters
    msg_len equ $ - msg                   ;compute the length msg 
    msg2 db "I love ASM progrmaming!",10
    msg2_len equ $ - msg2 

section .text
    global _start

_start:
    ;"Hello, World! Hadji"
    mov eax, 4          ;sys_write
    mov ebx, 1          ;std_out
    mov ecx, msg        ;message
    mov edx, msg_len    ;length
    int 0x80            ;execute

    ;"I love ASM progrmaming!"
    mov eax, 4          ;sys_write
    mov ebx, 1          ;std_out
    mov ecx, msg2       ;message
    mov edx, msg2_len   ;length
    int 0x80            ;execute

    mov eax,1           ;sys_exit
    mov ebx,0           ;return 0
    int 0x80            ;execute





