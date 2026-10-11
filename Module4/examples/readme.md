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
# Sample Inputs and Outputs

## Conditions
1. `01_conditions_even_odd.asm` — Input: `7` → Output: `ODD`
2. `02_conditions_compare_two.asm` — Inputs: `8`, `3` → Output: `First is greater`
3. `03_conditions_grade.asm` — Input: `6` → Output: `MIDDLE (5-7)`
4. `04_conditions_largest_three.asm` — Inputs: `4`, `9`, `2` → Output: `Largest digit: 9`
5. `05_conditions_vowel.asm` — Input: `e` → Output: `VOWEL`

## Loops
6. `06_loops_repeat_char.asm` — Input: `A` → Output: `AAAAA`
7. `07_loops_count_1_to_n.asm` — Input: `5` → Output: `1 2 3 4 5`
8. `08_loops_sum_1_to_n.asm` — Input: `5` → Output: `Sum = 15`
9. `09_loops_reverse_digits.asm` — Input: `12345` → Output: `54321`
10. `10_loops_multiplication_table.asm` — Input: `3` → Output: `3 6 9 12 15 18 21 24 27`

## Numbers / ASCII
11. `11_numbers_add_two_digits.asm` — Inputs: `7`, `8` → Output: `Sum = 15`
12. `12_numbers_subtract_digits.asm` — Inputs: `9`, `4` → Output: `Difference = 5`
13. `13_numbers_multiply_digits.asm` — Inputs: `7`, `6` → Output: `Product = 42`
14. `14_numbers_divide_digits.asm` — Inputs: `9`, `2` → Output: `Quotient = 4, Remainder = 1`
15. `15_numbers_two_digit_parser.asm` — Input: `42` → Output: `Number + 1 = 43`

## BCD / Adjust Instructions
16. `16_bcd_pack_two_digits.asm` — Input: `47` → Output: `47`
17. `17_bcd_unpack_byte.asm` — Input: `83` → Output: `8 3`
18. `18_bcd_add_two_digits.asm` — Inputs: `7`, `8` → Output: `15`
19. `19_bcd_multiply_digits_aam.asm` — Inputs: `7`, `8` → Output: `56`
20. `20_bcd_aad_division.asm` — Inputs: `84`, `7` → Output: `12, Remainder = 0`

## Strings
21. `21_strings_echo.asm` — Input: `hello` → Output: `You entered: hello`
22. `22_strings_copy_rep_movsb.asm` — Input: `assembly` → Output: `Copied text: assembly`
23. `23_strings_count_length.asm` — Input: `hello` → Output: `Length = 5`
24. `24_strings_find_char_scasb.asm` — Inputs: `network`, `w` → Output: `FOUND`
25. `25_strings_compare_cmpsb.asm` — Inputs: `cat`, `cat` → Output: `EQUAL`

## Arrays
26. `26_arrays_sum_five_digits.asm` — Input: `12345` → Output: `Sum = 15`
27. `27_arrays_find_max.asm` — Input: `38164` → Output: `Largest = 8`
28. `28_arrays_count_even.asm` — Input: `12345` → Output: `Even digit count = 2`
29. `29_arrays_reverse.asm` — Input: `ABCDE` → Output: `EDCBA`
30. `30_arrays_search_digit.asm` — Inputs: `12345`, `4` → Output: `FOUND`
