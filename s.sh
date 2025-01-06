nasm -f elf64 -g t.asm && gcc -nostartfiles -o test t.o -lc -no-pie && ./test
