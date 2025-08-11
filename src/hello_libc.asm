section .note.GNU-stack noalloc noexec nowrite progbits
default rel

section .data
    prompt: db "Hello World!",10, 0

section .text
    global main                 
    extern printf

main:
    push rbp
    lea rdi, [rel prompt]    
    call printf wrt ..plt
 
    mov rax, 0
    pop rbp
    ret
