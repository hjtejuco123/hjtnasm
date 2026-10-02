section .data
    p1 db "Enter first digit: "
    p1len equ $-p1
    p2 db "Enter second digit: "
    p2len equ $-p2
    gt db "Output: First is greater",10
    gtlen equ $-gt
    lt db "Output: Second is greater",10
    ltlen equ $-lt
    eq db "Output: Values are equal",10
    eqlen equ $-eq
section .bss
    a resb 2
    b resb 2
section .text
global _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx,p1
    mov edx,p1len
    int 0x80
    mov eax,3
    xor ebx,ebx
    mov ecx,a
    mov edx,2
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,p2
    mov edx,p2len
    int 0x80
    mov eax,3
    xor ebx,ebx
    mov ecx,b
    mov edx,2
    int 0x80

    mov al,[a]
    cmp al,[b]
    ja .first
    jb .second

    mov ecx,eq
    mov edx,eqlen
    jmp .print
.first:
    mov ecx,gt
    mov edx,gtlen
    jmp .print
.second:
    mov ecx,lt
    mov edx,ltlen
.print:
    mov eax,4
    mov ebx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
