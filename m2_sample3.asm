;print two separate lines

SYS_EXIT equ 1
SYS_WRITE equ 4
STDOUT equ 1

section .data
   line1 db 'This is the first line.',0xA       ;hex A = LF Newline \n 
   len_line1 equ $ - line1
   line2 db 'This is the second line.',0xA       ;hex A = LF Newline \n 
   len_line2 equ $ - line2

section .text
    global _start

_start:
    mov eax, SYS_WRITE   ; sys_write
    mov ebx, STDOUT      ; stdout
    mov ecx, line1       ;message to display 'Hello World!'
    mov edx, len_line1   ;13
    int 0x80             ;int

    mov eax, SYS_WRITE   ; sys_write
    mov ebx, STDOUT      ; stdout
    mov ecx, line2       ;message to display 'Hello World!'
    mov edx, len_line2   ;13
    int 0x80             ;int

    mov eax, SYS_EXIT    ; sys_exit
    ;mov ebx, 0           ; return 0;
    xor ebx,ebx 
    int 0x80
