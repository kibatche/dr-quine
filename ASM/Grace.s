;sys_creat c'est comme open mais avec les flags O_CREAT | O_WRONLY | O_TRUNC
    %define SYSCREAT 85
    %define MODE 0644o
section .rodata
file db "Grace_kid.s"
section .data
fmt db ";sys_creat c'est comme open mais avec les flags O_CREAT | O_WRONLY | O_TRUNC%1$c%%define SYSCREAT 85%1$c%%define MODE 0644o%1$csection .rodata%1$cfile db %2$cGrace_kid.s%2$c%1$csection .data%1$cfmt db %2$c%3$s%2$c,0%1$csection .text%1$cglobal _start%1$cextern dprintf%1$cextern exit%1$c%%macro notamain 0%1$cmov rax,SYSCREAT%1$cmov rdi,file%1$cmov rsi,MODE%1$csyscall%1$cmov rdi,rax%1$cmov rsi,fmt%1$cmov rdx,10%1$cmov rcx,34%1$cmov r8,fmt%1$cxor rax,rax%1$ccall dprintf%1$cxor rdi,rdi%1$ccall exit%1$c%%endmacro%1$c_start:%1$cnotamain%1$c",0
section .text
global _start
extern dprintf
extern exit
%macro notamain 0
mov rax,SYSCREAT
mov rdi,file
mov rsi,MODE
syscall
mov rdi,rax
mov rsi,fmt
mov rdx,10
mov rcx,34
mov r8,fmt
xor rax,rax
call dprintf
xor rdi,rdi
call exit
%endmacro
_start:
notamain
