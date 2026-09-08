;Exit code 
;eax 
section .text
    global _start

_start:
    mov eax,1       ;sys_exit 
    mov ebx,7       ;return 7
    int 0x80        ;execute 
