; ============================================================
; Christmas Tree Poem
; NASM 32-bit Linux
; Assemble:
;   nasm -f elf32 tree.asm -o tree.o
;   ld -m elf_i386 tree.o -o tree
; Run:
;   ./tree
; ============================================================

section .data

    ; ANSI escape sequence to clear screen
    clearScreen db 27, '[2J', 27, '[H'
    clearScreen_len equ $ - clearScreen

    ; --------------------------------------------------------
    ; Christmas Tree Poem
    ; Spaces are used to create the tree shape
    ; --------------------------------------------------------

    line1  db "                    I", 10
    line1_len equ $ - line1

    line2  db "                  wrote", 10
    line2_len equ $ - line2

    line3  db "                 a poem", 10
    line3_len equ $ - line3

    line4  db "               in the shape", 10
    line4_len equ $ - line4

    line5  db "              of a Christmas", 10
    line5_len equ $ - line5

    line6  db "            tree but then forgot", 10
    line6_len equ $ - line6

    line7  db "           to water it and only a few", 10
    line7_len equ $ - line7

    line8  db "                    days", 10
    line8_len equ $ - line8

    line9  db "                   later", 10
    line9_len equ $ - line9

    line10 db "                   there", 10
    line10_len equ $ - line10

    line11 db "             were", 10
    line11_len equ $ - line11

    line12 db "                         words", 10
    line12_len equ $ - line12

    line13 db "       all", 10
    line13_len equ $ - line13

    line14 db "                    over", 10
    line14_len equ $ - line14

    line15 db "             the", 10
    line15_len equ $ - line15

    line16 db "                                    carpet", 10
    line16_len equ $ - line16

    ; --------------------------------------------------------
    ; Student information
    ; --------------------------------------------------------

    message db 10, "I Love Assembly Programming :)", 10
    message_len equ $ - message

    studentNumber db "Student Number: 2023123456", 10
    studentNumber_len equ $ - studentNumber

    firstName db "HADJI", 10
    firstName_len equ $ - firstName

    middleName db "JAVIER", 10
    middleName_len equ $ - middleName

    lastName db "TEJUCO", 10
    lastName_len equ $ - lastName


section .text
    global _start


_start:

    ; Clear terminal
    call clearTheScreen

    ; Display Christmas tree poem
    call displayLine1
    call displayLine2
    call displayLine3
    call displayLine4
    call displayLine5
    call displayLine6
    call displayLine7
    call displayLine8
    call displayLine9
    call displayLine10
    call displayLine11
    call displayLine12
    call displayLine13
    call displayLine14
    call displayLine15
    call displayLine16

    ; Display student information
    call displayMessage
    call displayStudentNumber
    call displayFirstName
    call displayMiddleName
    call displayLastName

    ; Exit program
    mov eax, 1
    mov ebx, 0
    int 0x80


; ============================================================
; CLEAR SCREEN
; ============================================================

clearTheScreen:

    mov eax, 4
    mov ebx, 1
    mov ecx, clearScreen
    mov edx, clearScreen_len
    int 0x80

    ret


; ============================================================
; DISPLAY TREE POEM
; ============================================================

displayLine1:
    mov eax, 4
    mov ebx, 1
    mov ecx, line1
    mov edx, line1_len
    int 0x80
    ret


displayLine2:
    mov eax, 4
    mov ebx, 1
    mov ecx, line2
    mov edx, line2_len
    int 0x80
    ret


displayLine3:
    mov eax, 4
    mov ebx, 1
    mov ecx, line3
    mov edx, line3_len
    int 0x80
    ret


displayLine4:
    mov eax, 4
    mov ebx, 1
    mov ecx, line4
    mov edx, line4_len
    int 0x80
    ret


displayLine5:
    mov eax, 4
    mov ebx, 1
    mov ecx, line5
    mov edx, line5_len
    int 0x80
    ret


displayLine6:
    mov eax, 4
    mov ebx, 1
    mov ecx, line6
    mov edx, line6_len
    int 0x80
    ret


displayLine7:
    mov eax, 4
    mov ebx, 1
    mov ecx, line7
    mov edx, line7_len
    int 0x80
    ret


displayLine8:
    mov eax, 4
    mov ebx, 1
    mov ecx, line8
    mov edx, line8_len
    int 0x80
    ret


displayLine9:
    mov eax, 4
    mov ebx, 1
    mov ecx, line9
    mov edx, line9_len
    int 0x80
    ret


displayLine10:
    mov eax, 4
    mov ebx, 1
    mov ecx, line10
    mov edx, line10_len
    int 0x80
    ret


displayLine11:
    mov eax, 4
    mov ebx, 1
    mov ecx, line11
    mov edx, line11_len
    int 0x80
    ret


displayLine12:
    mov eax, 4
    mov ebx, 1
    mov ecx, line12
    mov edx, line12_len
    int 0x80
    ret


displayLine13:
    mov eax, 4
    mov ebx, 1
    mov ecx, line13
    mov edx, line13_len
    int 0x80
    ret


displayLine14:
    mov eax, 4
    mov ebx, 1
    mov ecx, line14
    mov edx, line14_len
    int 0x80
    ret


displayLine15:
    mov eax, 4
    mov ebx, 1
    mov ecx, line15
    mov edx, line15_len
    int 0x80
    ret


displayLine16:
    mov eax, 4
    mov ebx, 1
    mov ecx, line16
    mov edx, line16_len
    int 0x80
    ret


; ============================================================
; DISPLAY STUDENT INFORMATION
; ============================================================

displayMessage:
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, message_len
    int 0x80
    ret


displayStudentNumber:
    mov eax, 4
    mov ebx, 1
    mov ecx, studentNumber
    mov edx, studentNumber_len
    int 0x80
    ret


displayFirstName:
    mov eax, 4
    mov ebx, 1
    mov ecx, firstName
    mov edx, firstName_len
    int 0x80
    ret


displayMiddleName:
    mov eax, 4
    mov ebx, 1
    mov ecx, middleName
    mov edx, middleName_len
    int 0x80
    ret


displayLastName:
    mov eax, 4
    mov ebx, 1
    mov ecx, lastName
    mov edx, lastName_len
    int 0x80
    ret