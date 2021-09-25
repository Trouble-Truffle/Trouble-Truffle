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
    mov     eax, sys_write
    int     0x80

    mov     rdx, output
    mov     r8, 1
    mov     r9, 0

    mov     ebx, 0
    mov     eax, sys_exit
    int     0x80

for:
    mov     ecx, "test"
    mov     eax, sys_write
    inc     r9
    cmp     r9, r8
    jne     for



section .data
    msg db "ello World?",0xa
    len equ $ - msg
    stars times 10 db '*'

section .bss
    maxlines equ 12
    datasize equ 44
    output: resb datasize
