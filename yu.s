.att_syntax noprefix
.globl main
main:
pushq rbp
movq rsp, rbp
mov $.Cs, rdi
mov $0xa, rsi
mov $0x22, edx
mov $.Cs, ecx
mov $0x22, r8d
mov $0xa, r9d
xor eax, eax
call printf
xor eax, eax
leave
ret
.Cs: .string ".att_syntax noprefix
.globl main
main:
pushq rbp
movq rsp, rbp
mov $.Cs, rdi
mov $0xa, rsi
mov $0x22, edx
mov $.Cs, ecx
mov $0x22, r8d
mov $0xa, r9d
xor eax, eax
call printf
xor eax, eax
leave
ret%c.Cs: .string %c%s%c%c"
