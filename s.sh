nasm -f elf64 -g t.asm && gcc -nostartfiles -o test t.o -g -lc -no-pie && ./test
