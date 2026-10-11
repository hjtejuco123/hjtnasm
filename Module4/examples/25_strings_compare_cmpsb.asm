section .data
    p1 db "Enter first 3-letter word: "
    p1len equ $-p1
    p2 db "Enter second 3-letter word: "
    p2len equ $-p2
    yes db "Output: EQUAL",10
    yeslen equ $-yes
    no db "Output: NOT EQUAL",10
    nolen equ $-no
section .bss
    a resb 4
    b resb 4
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
    mov edx,4
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,p2
    mov edx,p2len
    int 0x80
    mov eax,3
    xor ebx,ebx
    mov ecx,b
    mov edx,4
    int 0x80

    cld
    mov esi,a
    mov edi,b
    mov ecx,3
    repe cmpsb
    jne .noteq
    mov ecx,yes
    mov edx,yeslen
    jmp .print
.noteq:
    mov ecx,no
    mov edx,nolen
.print:
    mov eax,4
    mov ebx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
