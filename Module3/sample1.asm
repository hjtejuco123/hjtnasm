;inc and display the result
;INC - add 1 

section .bss 
    result resb 2   ;reserve two bytes

section .text
    global _start

_start:
    mov al, 5       ; load 5 to our al register 
    inc al          ; 5 + 1 = 6

    ;convert to ASCII
    add al,'0'          ;'0' 0x30      = 36

    ;store the result in to memory 
    mov [result],al     ;36 
   
    ;add a newline to our result
    mov byte [result+1],0XA ;   

    ;print the result 
    mov eax, 4      ;sys_write
    mov ebx, 1      ;stdout 
    mov ecx, result 
    mov edx, 2
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80

