
;determine the largest digit
section .data
    msg db "The largest digit is: ",0xA,0xD 
    len equ $ - msg 
    num1 dd '6'     ;52
    num2 dd '5'     ;55
    num3 dd '3'     ;51

section .bss
    largest resb 2          ;int largest 

section .text 
    global _start

_start:

    mov ecx,[num1]      ;load the value of [num1=6] into ecx register
    cmp ecx,[num2]      ;compare num2 with num1 
    jg check_third_num  ;it will not skips but jump 
    mov ecx,[num2]      ;update ecx to hold 

check_third_num:
    cmp ecx,[num3]      ;compare 6 3
    jg store_largest    ;jump to the label store_largest
    mov ecx,[num3]


store_largest:

    mov [largest],ecx   ;store the value of 7 to [largest]

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







