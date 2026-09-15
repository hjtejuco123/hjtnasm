
; add 
section .data
    msg db "The sum is: "
    len equ $ - msg

section .bss
    sum resb 1 

section .text
    global _start

_start:

    ;'3' and '4'        33 / 34 
    mov eax,'3'
    sub eax,'0'         ;33-30 = 3

    mov ebx,'4'
    sub ebx,'0'         ;34-30 = 4

    add eax, ebx        ;3+4 = 7 store sa eax 
    add eax,'0'         ;7+30 = 37 = ASCII (7)
    mov [sum],al 

    mov byte [sum+1],0xA

    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,sum
    mov edx,2
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80


