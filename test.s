    .data
format: .ascii "%d\n"  
.text
    .global main  
main:
  mov  $format, %rdi
  mov  $1, %rsi
  mov  $0, %eax
  call printf
  ret