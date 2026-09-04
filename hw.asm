;create a program to display hello world
;NASM 32 bit  
section .data
    msg db "HelloWor ld!", 0xA  ;LF -> \n 
    ;msg_len equ $ - msg         ;compute length string    13 
    msg2 db "I Love ASM programming",0xA
    msg_len2 equ $ - msg2 


;mov destination, source 
section .text
    global _start 
_start:
    mov eax,4                  ;sys_write      
    mov ebx,1                  ;stdout
    mov ecx,msg                ;text to be displayed 
    mov edx,12                 ;length 
    int 0x80                   ;trigger 

    mov eax,4                  ;sys_write      
    mov ebx,1                  ;stdout
    mov ecx,msg2                ;text to be displayed 
    mov edx,msg_len2            ;length 
    int 0x80                   ;trigger 


    mov eax,1                   ;sys_exit
    mov ebx,0
    int 0x80 
