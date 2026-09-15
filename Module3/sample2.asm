;DEC and display the result
;DEC - subtract 1 

section .bss 
    result resb 2   ;reserve two bytes

section .text
    global _start

_start:
    mov al, 5       ; load 5 to our al register 
    dec al          ; 5 - 1 = 4

    ;convert to ASCII
    add al,'0'          ;'0' 0x30      = 34

    ;store the result in to memory 
    mov [result],al     ;34 
   
    ;add a newline to our result
    mov byte [result+1],0XA  ;LF new line  

    ;print the result 
    mov eax, 4      ;sys_write
    mov ebx, 1      ;stdout 
    mov ecx, result 
    mov edx, 2
    int 0x80

    ;exit program
    mov eax,1
    mov ebx,0
    int 0x80

