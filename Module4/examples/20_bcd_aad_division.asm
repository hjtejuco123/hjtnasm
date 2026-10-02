section .data
    p db "Enter two-digit dividend (10-99): "
    plen equ $-p
    dmsg db "Enter one-digit divisor (1-9): "
    dlen equ $-dmsg
    qmsg db "Quotient = "
    qlen equ $-qmsg
    rmsg db ", Remainder = "
    rlen equ $-rmsg
    nl db 10
section .bss
    num resb 3
    divr resb 2
    q resb 2
    r resb 1
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
    mov ecx,num
    mov edx,3
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,dmsg
    mov edx,dlen
    int 0x80
    mov eax,3
    xor ebx,ebx
    mov ecx,divr
    mov edx,2
    int 0x80

    mov ah,[num]
    sub ah,'0'
    mov al,[num+1]
    sub al,'0'
    aad
    xor ah,ah
    mov bl,[divr]
    sub bl,'0'
    div bl
    mov dl,ah
    xor ah,ah
    aam
    add ah,'0'
    add al,'0'
    mov [q],ah
    mov [q+1],al
    add dl,'0'
    mov [r],dl

    mov eax,4
    mov ebx,1
    mov ecx,qmsg
    mov edx,qlen
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,q
    mov edx,2
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,rmsg
    mov edx,rlen
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,r
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
