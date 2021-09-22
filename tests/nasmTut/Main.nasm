%define stdout 1

%define sys_exit  1
%define sys_write 4

section .text
    global _start

_start:
    mov     edx, len
    mov     ecx, msg
    mov     ebx, stdout
    mov     eax, sys_write
    int     0x80
    mov     ecx, stars
    ;mov     eax, sys_write
    int     0x80

    mov     eax, sys_exit
    int     0x80

section .data
    msg db "Hello World?",0xa
    len equ $ - msg
    stars times 10 db '*'

section .bss
