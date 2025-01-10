%define SYSCREAT 85
%define MODE 0644o
section .bss
sullysrcbuff resb 100;allocation de memoire pour variables non initialisees
sullyexecbuff resb 100
cmdonebuff resb 100
cmdtwobuff resb 100
section .data
currentfilename db __FILE__,0
sullyfilename db "Sully.s",0
sullysrcfmt db "Sully_%d.s",0
sullyexecfmt db "Sully_%d",0
cmdonefmt db "nasm %s -f elf64&&gcc -nostartfiles -o %2$s %2$s.o -no-pie",0
cmdtwofmt db "./%s",0
i dq 5
fmt db "%%define SYSCREAT 85%1$c%%define MODE 0644o%1$csection .bss%1$csullysrcbuff resb 100;allocation de memoire pour variables non initialisees%1$csullyexecbuff resb 100%1$ccmdonebuff resb 100%1$ccmdtwobuff resb 100%1$csection .data%1$ccurrentfilename db __FILE__,0%1$csullyfilename db %2$cSully.s%2$c,0%1$csullysrcfmt db %2$cSully_%%d.s%2$c,0%1$csullyexecfmt db %2$cSully_%%d%2$c,0%1$ccmdonefmt db %2$cnasm %%s -f elf64&&gcc -nostartfiles -o %%2$s %%2$s.o -no-pie%2$c,0%1$ccmdtwofmt db %2$c./%%s%2$c,0%1$ci dq %3$d%1$cfmt db %2$c%4$s%2$c,0%1$csection .text%1$cglobal _start%1$cextern exit%1$cextern sprintf%1$cextern dprintf%1$cextern system%1$c_start:%1$cmov rax,[i]%1$ccmp rax,-1%1$cjle end%1$cmov rsi,currentfilename%1$cmov rdi,sullyfilename%1$cmov rcx,7%1$crepe cmpsb; compare rdi et rsi si pareil, goto label next%1$cje makesrcfilename%1$cmov rax,[i]%1$cdec rax%1$cmov [i],rax%1$cmakesrcfilename:%1$cmov rdi,sullysrcbuff%1$cmov rsi,sullysrcfmt%1$cmov rdx,[i]%1$cxor rax,rax%1$ccall sprintf%1$cmakeexecfilename:%1$cmov rdi,sullyexecbuff%1$cmov rsi,sullyexecfmt%1$cmov rdx,[i]%1$cxor rax,rax%1$ccall sprintf%1$cmakecmdone:%1$cmov rdi,cmdonebuff;nasm...%1$cmov rsi,cmdonefmt%1$cmov rdx,sullysrcbuff;Sully_x.s%1$cmov rcx,sullyexecbuff;Sully_x%1$cxor rax,rax%1$ccall sprintf%1$cmakecmdtwo:%1$cmov rdi,cmdtwobuff;./Sully_x%1$cmov rsi,cmdtwofmt%1$cmov rdx,sullyexecbuff%1$cxor rax,rax%1$ccall sprintf%1$ccreatefile:%1$cmov rax,SYSCREAT%1$cmov rdi,sullysrcbuff;on recup la string resulatt de sprintf et on le passe dans rdi pour le second arg%1$cmov rsi,MODE%1$csyscall%1$cfillfile:%1$cmov rdi,rax;on prend le fd retourne par syscreat%1$cmov rsi,fmt%1$cmov rdx,10%1$cmov rcx,34%1$cmov r8,[i]%1$cmov r9,fmt%1$cxor rax,rax%1$ccall dprintf%1$cexeccmdone:%1$cmov rdi,cmdonebuff%1$cxor rax,rax%1$ccall system%1$cmov rax,[i]%1$cdec rax%1$ccmp rax,-1%1$cjle end%1$cmov rdi,cmdtwobuff%1$cxor rax,rax%1$ccall system%1$cend:%1$cxor rdi,rdi%1$ccall exit%1$c",0
section .text
global _start
extern exit
extern sprintf
extern dprintf
extern system
_start:
mov rax,[i]
cmp rax,-1
jle end
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
mov rsi,cmdtwofmt
mov rdx,sullyexecbuff
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
dec rax
cmp rax,-1
jle end
mov rdi,cmdtwobuff
xor rax,rax
call system
end:
xor rdi,rdi
call exit
