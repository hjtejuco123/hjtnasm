;number is odd or even 

section .data
    p db "Enter a number from 0-9: ",0
    plen equ $ - p 
    evenmsg db "Output - Even ", 10
    evenlen equ $ - evenmsg 
    oddmsg db "Output - Odd ",10
    oddlen equ $ - oddmsg

section .bss
    x resb 2 

section .text
    global _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,p
    mov edx,plen
    int 0x80

    mov eax,3
    mov ebx,0
    mov ecx,x 
    mov edx,2 
    int 0x80

    mov al,[x]
    sub al,'0'
    test al,1       ;bitwise AND 7=0111 (odd) 8=1000 (even) 
    jnz .odd 

    mov eax,4
    mov ebx,1
    mov ecx,evenmsg
    mov edx,evenlen
    int 0x80 
    jmp .exit 

.odd:
    mov eax,4
    mov ebx,1
    mov ecx,oddmsg 
    mov edx,oddlen
    int 0x80

.exit:
    mov eax,1
    mov ebx,0
    int 0x80
