global _start

%define SYS_exit 60

%define EXIT_SUCCESS 0
%define EXIT_ERROR 1
%define OFFSET_CAPACITY 3

section .bss
    queue resb OFFSET_CAPACITY + 1

section .data
    pointer: db 0

section .text
_start:
    mov rdi, 1
    call .enqueue

    mov rdi, 2
    call .enqueue

    call .dequeue
    cmp rax, 1
    jne .error

    call .dequeue
    cmp rax, 2
    jne .error

    call .dequeue
    cmp rax, 0
    jne .error

    mov rdi, 42
    call .enqueue

    call .dequeue
    cmp rax, 42
    jne .error

    mov rdi, 43
    call .enqueue

    mov rdi, 44
    call .enqueue

    call .dequeue
    cmp rax, 43
    jne .error

    call .dequeue
    cmp rax, 44
    jne .error

    call .dequeue
    cmp rax, 0
    jne .error

    mov rdi, EXIT_SUCCESS
    jmp .exit

.error:
    mov rdi, EXIT_ERROR
    

.exit:
    mov rax, SYS_exit
    syscall

.enqueue:
    xor r8, r8
    mov r8b, [pointer]
    mov [queue + r8], dil      ; dil = parte baixa de rdi
    inc byte [pointer]
    ret

.dequeue:
    xor rax, rax               ; limpar rax
    mov r8b, [pointer]         ; r8b = quantidade de itens na fila
    cmp r8b, 0
    je .done_dequeue           ; se fila vazia, retorne 0

    mov al, [queue]            ; rax = primeiro elemento da fila

    xor rsi, rsi               ; índice para loop
.loop_dequeue:
    cmp rsi, r8
    jae .shift_done

    mov r9b, [queue + rsi + 1]
    mov [queue + rsi], r9b
    inc rsi
    jmp .loop_dequeue

.shift_done:
    dec byte [pointer]
.done_dequeue:
    ret
