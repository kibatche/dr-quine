;comment1
section .data
s db ';comment1%csection .data%cs db %c%s%c,0%csection .text%cglobal _start%cextern printf%cextern exit%c_start:%cmov rcx,22%ccolleen:%cpush 10%cloop colleen%cmain:%cmov rdi,s%cmov rsi,10%cmov rdx,10%cmov rcx,39%cmov r8,s;c2%cmov r9,39%cxor rax,rax%ccall printf%cxor rdi,rdi%ccall exit%c',0
section .text
global _start
extern printf
extern exit
_start:
mov rcx,22
colleen:
push 10
loop colleen
main:
mov rdi,s
mov rsi,10
mov rdx,10
mov rcx,39
mov r8,s;c2
mov r9,39
xor rax,rax
call printf
xor rdi,rdi
call exit