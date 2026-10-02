section .data
    p1 db "Enter first digit: "
    p1len equ $-p1
    p2 db "Enter second digit: "
    p2len equ $-p2
    msg db "Product using AAM = "
    msglen equ $-msg
    nl db 10
section .bss
    a resb 2
    b resb 2
    out resb 2
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
    sub al,'0'
    mov bl,[b]
    sub bl,'0'
    mul bl
    aam
    add ah,'0'
    add al,'0'
    mov [out],ah
    mov [out+1],al

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,out
    mov edx,2
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,nl
    mov edx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
