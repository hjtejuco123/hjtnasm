section .data
    p db "Enter a digit (1-9): "
    plen equ $-p
    hdr db "Products for x1 to x9: "
    hdrlen equ $-hdr
    sp db " "
    nl db 10
section .bss
    n resb 2
    out resb 2
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
    mov ecx,n
    mov edx,2
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,hdr
    mov edx,hdrlen
    int 0x80

    movzx edi,byte [n]
    sub edi,'0'
    mov esi,1
.loop:
    cmp esi,10
    je .done
    mov eax,edi
    imul eax,esi
    cmp eax,10
    jb .one
    xor edx,edx
    mov ebx,10
    div ebx
    add al,'0'
    add dl,'0'
    mov [out],al
    mov [out+1],dl
    mov edx,2
    jmp .show
.one:
    add al,'0'
    mov [out],al
    mov edx,1
.show:
    mov eax,4
    mov ebx,1
    mov ecx,out
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,sp
    mov edx,1
    int 0x80
    inc esi
    jmp .loop
.done:
    mov eax,4
    mov ebx,1
    mov ecx,nl
    mov edx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
