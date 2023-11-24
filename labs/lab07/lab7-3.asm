%include 'in_out.asm'
SECTION .data
    msgA:	DB 'Введите A: ',0
    msgB:       DB 'Введите B: ',0
    msgC:	DB 'Введите C: ',0
    answer:	DB 'Наименьшее: ',0

SECTION .bss
    A:	RESB 80
    B:  RESB 80
    C:  RESB 80
    result:     RESB 80
    min: RESB 80

SECTION .text
    GLOBAL _start

_start:
    mov eax,msgA
    call sprint
    mov ecx,A
    mov edx,80
    call sread
    mov eax,A
    call atoi 
    mov [A],eax

    mov eax, msgB
    call sprint
    mov ecx,B
    mov edx,80
    call sread
    mov eax,B
    call atoi
    mov [B],eax

    mov eax,msgC
    call sprint
    mov ecx,C
    mov edx,80
    call sread 
    mov eax,C
    call atoi
    mov [C],eax   
    
    mov ecx,[A]
    mov [min],ecx

    cmp ecx, [B]
    jl check_C
    mov ecx, [B]
    mov [min], ecx

check_C:
    cmp ecx, [C]
    jl finish
    mov ecx,[C]
    mov [min],ecx 

finish:
    mov eax,answer
    call sprint

    mov eax, [min]
    call iprintLF

    call quit
