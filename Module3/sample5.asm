
; add 
section .data
    msg1 db "Enter a digit "
    len1 equ $ - msg1 

    msg2 db "Enter a second digit "
    len2 equ $ - msg2 

    msg db "The sum is: "
    len equ $ - msg

section .bss
    sum resb 2
    num1 resb 2
    num2 resb 2

section .text
    global _start

_start:

    ;first prompt 
    mov eax,4
    mov ebx,1
    mov ecx,msg1 
    mov edx,len1
    int 0x80

    mov eax,3
    mov ebx,0
    mov ecx,num1
    mov edx,2
    int 0x80

    ;second prompt 
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,len2
    int 0x80

    mov eax,3
    mov ebx,0
    mov ecx,num2
    mov edx,2
    int 0x80

    mov eax,0
    mov al, [num1]
    sub al,'0'

    mov ebx,0
    mov bl, [num2] 
    sub bl,'0'

    add al, bl 
    add al,'0'

    mov [sum],al
    
    mov byte[sum+1],0XA

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


