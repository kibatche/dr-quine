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
sub rsp,320
mov qword [rsp],10
mov qword [rsp+8],10
mov qword [rsp+16],10
mov qword [rsp+24],10
mov qword [rsp+32],10
mov qword [rsp+48],10
xor rax,rax
call printf
add rsp,320
mov rax,60
xor rdi,rdi
syscall
section .data
s db 'section .data%cs db %c%s%c,0%csection .text%cglobal _start%cextern printf%c_start%cmov rdi,s%cmov rsi,10%cmov rcx,s%cmov r8,39%cmov r9,10%csub rsp,320%c',0
