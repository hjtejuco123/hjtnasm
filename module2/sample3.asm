SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1
 
section .data
    line1 db 'Lab starts at 8:00 AM.', 0xa
    len_line1 equ $ - line1     ;bytes - display len 
    line2 db 'Bring your NASM worksheet.', 0xa
    len_line2 equ $ - line2


section .text
    global _start
_start:
    mov eax, SYS_WRITE      ;4
    mov ebx, STDOUT         ;1
    mov ecx, line1          ;Lab starts at 8:00 AM.
    mov edx, len_line1      ;
    int 0x80
 
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, line2
    mov edx, len_line2
    int 0x80
 
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80
 
