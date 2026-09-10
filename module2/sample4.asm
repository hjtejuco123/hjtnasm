SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1
 
section .text
    global _start
_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, myname
    mov edx, len_myname
    int 0x80
 
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, mycourse
    mov edx, len_mycourse
    int 0x80
 
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, mysection
    mov edx, len_mysection
    int 0x80
 
    mov eax, SYS_EXIT
    xor ebx, ebx
    int 0x80
 
section .data
    myname db 'Computer Architecture', 0xa
    len_myname equ $ - myname
    mycourse db 'Author: M. Rivera', 0xa
    len_mycourse equ $ - mycourse
    mysection db 'Shelf: CS-04', 0xa
    len_mysection equ $ - mysection
