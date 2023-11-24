%include 'in_out.asm'

section .data
    msg db 'Введите значение переменной x: ', 0
    rem db 'Результат: ', 0
    
section .bss
    x resb 80 ; Переменная, значение которой будем вводить с клавиатуры, выделенный размер - 80 байт

section .text
    global _start ; Начало программы
_start: ; Точка входа в программу
    ; ---- Вычисление выражения
    mov eax, msg  ; запись адреса выводимого сообщения в eax
    call sprint ; вызов подпрограммы печати сообщения
    mov ecx, x ; запись адреса переменной в ecx
    mov edx, 80 ; запись длины вводимого значения в edx
    call sread ; вызов подпрограммы ввода сообщения
    ; Преобразование ASCII кода в число (eax = x)
    mov eax, x ; передаем адрес переменной x в eax
    
    call atoi ; ASCII код в число, результат в eax
    ; x^3 / 2 + 1
    ; Возводим x в степень 3
        mov ebx,1        
    imul ebx,eax      ; Умножаем x на само себя (x^2)
   imul ebx,eax   
    imul ebx,eax
    
    xor edx,edx
    mov eax,ebx
    mov ebx,2
    div ebx
    
    add eax,1
    
    mov edi,eax ; запись результата вычисления в 'edi'

    ; Вывод результата

    mov eax,rem ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF 
    call quit ; вызов подпрограммы завершения
