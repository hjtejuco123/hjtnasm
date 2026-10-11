section .data
    p db "Enter text (max 20 chars): "
    plen equ $-p
    cp db "Character to find: "
    cplen equ $-cp
    yes db "Output: FOUND",10
    yeslen equ $-yes
    no db "Output: NOT FOUND",10
    nolen equ $-no
section .bss
    buf resb 32
    ch resb 2
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
    mov ecx,buf
    mov edx,21
    int 0x80
    mov ebp,eax
    dec ebp

    mov eax,4
    mov ebx,1
    mov ecx,cp
    mov edx,cplen
    int 0x80
    mov eax,3
    xor ebx,ebx
    mov ecx,ch
    mov edx,2
    int 0x80

    cld
    mov edi,buf
    mov ecx,ebp
    mov al,[ch]
    repne scasb
    jne .notfound
    mov ecx,yes
    mov edx,yeslen
    jmp .print
.notfound:
    mov ecx,no
    mov edx,nolen
.print:
    mov eax,4
    mov ebx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
