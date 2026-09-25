
;determine the largest digit

section .data
    msg db "The largest digit is: ",0xA,0xD 
    len equ $ - msg 
    num1 dd '4'
    num2 dd '7'
    num3 dd '3'

section .bss
    largest resb 2          ;int largest 

section .text 
    global _start

_start:

    mov ecx,[num1]
    cmp ecx,[num2]
    jg check_third_num
    mov ecx,[num2]

check_third_num:
    cmp ecx,[num3]
    jg store_largest
    mov ecx,[num3]


store_largest:

    mov [largest],ecx 

    ;print message 
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 0x80

    ;print largest number 
    mov eax,4
    mov ebx,1
    mov ecx,largest
    mov edx,2
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80







