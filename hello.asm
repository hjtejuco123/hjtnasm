;ascii.cl

;code->sys_write->Linux Kernel -> terminal 

section .data
    msg db "Hello, World!", 0xA ;A - LF \n
    msg_len equ $ - msg     ;len function - 13

section .text
    global _start

_start:
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg        ;message to display 'Hello World!'
    mov edx, msg_len    ;13
    int 0x80            ;int

    mov eax, 1           ; sys_exit
    mov ebx, 0           ; return 0;
    int 0x80
