section .data
    p1 db "Enter dividend digit: "
    p1len equ $-p1
    p2 db "Enter divisor digit (1-9): "
    p2len equ $-p2
    qmsg db "Quotient = "
    qlen equ $-qmsg
    rmsg db ", Remainder = "
    rlen equ $-rmsg
    nl db 10
section .bss
    a resb 2
    b resb 2
    q resb 1
    r resb 1
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

    movzx eax,byte [a]
    sub eax,'0'
    movzx ebx,byte [b]
    sub ebx,'0'
    xor edx,edx
    div ebx
    add al,'0'
    add dl,'0'
    mov [q],al
    mov [r],dl

    mov eax,4
    mov ebx,1
    mov ecx,qmsg
    mov edx,qlen
    int 0x80
    mov eax,4
    mov ebx,1
    mov ecx,q
    mov edx,1
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
