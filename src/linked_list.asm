global _start

%define SYS_brk     12
%define SYS_exit    60

%define EXIT_ERROR   1
%define EXIT_SUCCESS 0

%define NODE_SIZE 10 ; 1 byte, 8 bytes for next address

section .bss
head: resb 8
result: resb 8

section .data

section .text
_start:
  call .current_brk
  mov [head], rax
  
  mov r8, 1 
  call .insert

  mov rdi, EXIT_SUCCESS
  jmp .exit

.error:
  mov rdi, EXIT_ERROR
.exit:
  mov rax, SYS_exit
  syscall

.insert:
  call .allocate_node
  mov byte [rdx + 0], r8b
  mov byte [rdx + NODE_SIZE - 1], 0XFF
  
  test r9,  r9
  jz .done_insert

  mov [r9 + 1], rdx
.done_insert:
  ret
.traverse:
  mov rbx, [head]
  mov rsi, 0

.loop_traverse:
  mov r8b, [rbx]
  mov byte [result + rsi], r8b

  mov rbx, [rbx + 1]

  cmp rbx, 0
  je .done_traverse

  add rsi, 1 
  jmp .loop_traverse

.done_traverse:
  ret

.allocate_node:
  call .current_brk
  mov rdx, rax

  mov rdi, rax
  mov rdi, NODE_SIZE
  mov rax, SYS_brk
  syscall
  ret

.current_brk:
  xor rdi, rdi
  mov rax, SYS_brk
  syscall
  ret
