section .data
    p db "Enter two digits to pack/unpack: "
    plen equ $-p
    msg db "Unpacked digits: "
    msglen equ $-msg
    sp db " "
    nl db 10
section .bss
    buf resb 3
    packed resb 1
    d1 resb 1
    d2 resb 1
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
    mov edx,3
    int 0x80

    mov al,[buf]
    sub al,'0'
    shl al,4
    mov bl,[buf+1]
    sub bl,'0'
    or al,bl
    mov [packed],al

    mov al,[packed]
    mov bl,al
    shr al,4
    and bl,0x0F
    add al,'0'
    add bl,'0'
    mov [d1],al
    mov [d2],bl

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msglen
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,d1
    mov edx,1
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,sp
    mov edx,1
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,d2
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
