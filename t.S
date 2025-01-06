section .data
s db "section .data\ns db %c%s%c\nsection .text\nglobal _start\nextern printf\n_start:\n",0
section .text
global _start
extern printf
_start:
mov rdi,s
mov rsi,10
mov rdx,39
mov rcx,s
mov r8,39
mov r9,10
sub rsp,32
mov qword [rsp+1],10
mov qword [rsp+2],10
mov qword [rsp+3],10
mov qword [rsp+4],10
xor rax,rax
call printf
add rsp,32
mov rax,60
xor rdi,rdi
syscall
