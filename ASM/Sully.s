%define SYSCREAT 85
%define MODE 0644o
section .bss
sullysrcbuff resb 100;allocation de memoire pour variable non initialisees
sullyexecbuff resb 100
cmdonebuff resb 100
cmdtwobuff resb 100
section .data
currentfilename db __FILE__,0
sullyfilename db "Sully.s",0
sullysrcfmt db "Sully_%d.s",0
sullyexecfmt db "Sully_%d",0
cmdonefmt db "nasm %s -f elf64 && gcc -nostartfiles -o %2$s %2$s.o -no-pie",0
cmdtwofmt db "./%s",0
testfmt db "./%s\n"
i dd 5
fmt db "%%define SYSCREAT 85%1$c%%define MODE 0644o%1$csection .data%1$ccurrentfilename db __FILE__,0%1$csullyfilename db %2$cSully.s%2$c,0%1$csullysrcfmt db %2$cSully_%%d.s%2$c,0%1$csullysrcbuff db 100%1$csullyexecfmt db %2$cSully_%%d%2$c,0%1$csullyexecbuff db 100%1$ccmdonefmt db %2$cnasm %%s -f elf64 && gcc -nostartfiles -o %%2$s %%2$s.o -no-pie%2$c,0%1$ccmdonebuff db 100%1$ccmdtwofmt db %2$c./%%s%2$c,0%1$ccmdtwobuff db 100%1$ci dd %3$d%1$cfmt db%2$c%4$s%2$c,0%1$csection .text%1$cglobal _start%1$cextern exit%1$cextern sprintf%1$cextern dprintf%1$cextern system%1$c_start%1$cmov rsi,currentfilename%1$cmov rdi,sullyfilename%1$cmov rcx,7%1$crepe cmpsb%1$cje makesrcfilename%1$cmov rax,[1]%1$cdec rax%1$makesrcfilename:%1$cmov rdi,sullysrcbuff%1$cmov rsi,sullysrcfmt%1$cmov rdx,[i]%1$cxor rax,rax%1$ccall sprintf%1$cmakeexecfilename:%1$cmov rdi,sullyexecbuff%1$cmov rsi,sullyexecfmt%1$cmov rdx,[i]%1$cxor rax,rax%1$ccall sprintf%1$cmakecmdonename:%1$cmov rdi,cmdonebuff;nasm...%1$cmov rsi,cmdonefmt%1$cmov rdx,sullysrcbuff;Sully_x.s%1$cmov rcx,sullyexecbuff;Sully_x%1$cxor rax,rax%1$ccall sprintf%1$cmakecmdtwo:%1$cmov rdi,cmdtwobuff;./Sully_x%1$cmov rsi,sullyexecbuff%1$cxor rax,rax%1$ccall sprintf%1$ccreatefile:%1$cmov rax,SYSCREAT%1$cmov rdi,sullysrcbuff;on recup la string resulatt de sprintf et on le passe dans rdi pour le second arg%1$cmov rsi,MODE%1$csyscall%1$cfillfile:%1$cmov rdi,rax;on prend le fd retourne par syscreat%1$cmov rsi,%1$cxor rdi,rdi%1$ccall exit%1$c",0
section .text
global _start
extern exit
extern sprintf
extern dprintf
extern printf
extern system
_start:
mov rsi,currentfilename
mov rdi,sullyfilename
mov rcx,7
repe cmpsb; compare rdi et rsi si pareil, goto label next
je makesrcfilename
mov rax,[i]
dec rax
mov [i],rax
makesrcfilename:
mov rdi,sullysrcbuff
mov rsi,sullysrcfmt
mov rdx,[i]
xor rax,rax
call sprintf
makeexecfilename:
mov rdi,sullyexecbuff
mov rsi,sullyexecfmt
mov rdx,[i]
xor rax,rax
call sprintf
makecmdone:
mov rdi,cmdonebuff;nasm...
mov rsi,cmdonefmt
mov rdx,sullysrcbuff;Sully_x.s
mov rcx,sullyexecbuff;Sully_x
xor rax,rax
call sprintf
makecmdtwo:
mov rdi,cmdtwobuff;./Sully_x
mov rsi,sullyexecbuff
xor rax,rax
call sprintf
createfile:
mov rax,SYSCREAT
mov rdi,sullysrcbuff;on recup la string resulatt de sprintf et on le passe dans rdi pour le second arg
mov rsi,MODE
syscall
fillfile:
mov rdi,rax;on prend le fd retourne par syscreat
mov rsi,fmt
mov rdx,10
mov rcx,34
mov r8,[i]
mov r9,fmt
xor rax,rax
call dprintf
execcmdone:
mov rdi,cmdonebuff
xor rax,rax
call system
mov rax,[i]
cmp rax,0
jl end
mov rdi,cmdtwobuff
call system
end:
xor rdi,rdi
call exit

;%1$c = \n
;%2$c = "
;%3$d = i
;%4$s = fmt

; mov rsi,cmdonebuff
; mov rdi,testfmt
; xor rax,rax
; call printf