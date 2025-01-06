section .data
    format db 'section .data',10,'    format db %c%s%c,10,0',10
           db 'section .text',10,'    global _start',10
           db '_start:',10
           db '    Appel de printf',10
           db '    push dword 0',10
           db '    push dword format',10
           db '    call printf',10
           db '    Quitter proprement',10
           db '    push dword 0',10
           db '    call exit',10
    zero db 0

section .text
    global _start
    extern printf, exit

_start:
    ; Appel de printf
    push dword zero       ; Argument 3 : le zéro final
    push dword format     ; Argument 2 : l'adresse de format
    push dword format     ; Argument 1 : l'adresse de format (format lui-même)
    call printf           ; Appel à printf

    ; Quitter proprement
    push dword 0          ; Code de retour
    call exit             ; Appel à exit
