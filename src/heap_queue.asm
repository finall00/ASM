global _start


;----------------------|
; Syscalls numbers     |
;----------------------|
%define SYS_exit 60
%define SYS_brk 12


%define EXIT_SUCESS     0
%define EXIT_ERROR      1
%define OFFSET_CAPACITY 3
%define MAX_UINT        255

section .bss
array: resb 1

section .data
pointer: db 0
currentCapacity: db OFFSET_CAPACITY

section .text
_start:



.error:
  mov rdi, EXIT_ERROR

.exit:
  mov rax, SYS_exit
  syscall


.append:
  mov r9, [currentCapacity]
  cmp byte [pointer], r9b         ; verifica se o array esta cheio
  je .resize

  cmp rdi, MAX_UINT               ; elemento > 255 ?
  jg .done

  mov r8b, [pointer]              ; indice atual
  mov [rbx  + r8], rdi            ; adiciona no array
  inc byte [pointer]              ; incrementa o indice

.done:
  ret


.resize:
  mov r10, rdi

  mov rdi, 0 
  mov rax, SYS_brk
  syscall

  mov rdi, rax
  add rdi, OFFSET_CAPACITY
  mov rax, SYS_brk
  syscall

  mov r9, [currentCapacity]
  add r9, OFFSET_CAPACITY
  mov [currentCapacity], r9

  mov rdi, r10
  jmp .append
  
