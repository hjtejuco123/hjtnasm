# NASM32 Module 4 

Contents:
-  NASM 32-bit Linux programs:
  - 5 conditions
  - 5 loops
  - 5 numbers/ASCII
  - 5 BCD/adjust
  - 5 strings
  - 5 arrays

Build any program:
```bash
nasm -f elf32 filename.asm -o filename.o
ld -m elf_i386 filename.o -o filename
./filename
```
