section .data;c
s db 'section .data%cc%cs db %c%s%c %csection .text%cglobal _start%cextern printf%c_start:%cmov rax,10%cmov rcx,20%ccolleen:%cpush rax%cloop colleen%cmain:%cmov rdi,s%cmov rsi,59%cmov rdx,10%cmov rcx,10%cmov r8,10%cmov r9,10%cxor rax,rax%ccall printf%cmov rax,60%cxor rdi,rdi%csyscall',0
section .text
global _start
extern printf
_start:
mov rcx,12
colleen:
push 10
loop colleen
next:
push 59
sub rsp,8
main:
mov rdi,s;d
mov rsi,59
mov rdx,10
mov rcx,39
mov r8,s
mov r9,39
xor rax,rax
call printf
mov rax,60
xor rdi,rdi
syscall
