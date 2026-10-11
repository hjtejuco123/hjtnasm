section .data
    p db "Enter 5 digits without spaces: "
    plen equ $-p
    q db "Digit to search: "
    qlen equ $-q
    yes db "Output: FOUND",10
    yeslen equ $-yes
    no db "Output: NOT FOUND",10
    nolen equ $-no
section .bss
    arr resb 6
    key resb 2
section .text
global _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx,p
    mov edx,plen
    int 0x80
    mov eax,3
    xor ebx,ebx
    mov ecx,arr
    mov edx,6
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,q
    mov edx,qlen
    int 0x80
    mov eax,3
    xor ebx,ebx
    mov ecx,key
    mov edx,2
    int 0x80

    mov esi,arr
    mov ecx,5
    mov al,[key]
.loop:
    cmp al,[esi]
    je .found
    inc esi
    loop .loop
    mov ecx,no
    mov edx,nolen
    jmp .print
.found:
    mov ecx,yes
    mov edx,yeslen
.print:
    mov eax,4
    mov ebx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
