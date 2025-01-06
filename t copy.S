section .data
s db 'section .data',10,'s db ',10
db 'section .text',10,'global _start',10,'extern printf',10
db '_start:',10,'mov rdi, s', 10
db 'xor rax, rax', 10
db 'call printf', 10
db 'mov rax, 60', 10
db 'xor rdi, rdi', 10   
db 'syscall', 10, 0


section .text
global _start
extern printf
_start:
mov rdi, s
mov rsi, d
xor rax, rax
call printf
mov rax, 60
xor rdi, rdi
syscall
