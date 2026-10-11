section .data
    p db "Enter 5 digits without spaces: "
    plen equ $-p
    msg db "Largest = "
    msglen equ $-msg
    nl db 10
section .bss
    arr resb 6
    outo resb 1
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

    mov esi,arr
    mov al,[esi]
    inc esi
    mov ecx,4
.loop:
    cmp al,[esi]
    jae .skip
    mov al,[esi]
.skip:
    inc esi
    loop .loop
    mov [outo],al

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,outo
    mov edx,1
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,nl
    mov edx,1
    int 0x80
    mov eax,1
    xor ebx,ebx
    int 0x80
