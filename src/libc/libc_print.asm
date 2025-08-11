%define SYS_exit 60 ; Codigo da syscall de Exit

section .data
  msg : db "hello world libc!! %.2f", 10, 0  ; 
  num : dq 3.14169 

section .text
  global _start
  extern printf

_start:

  mov rdi, msg
  mov rax, 1
  movsd xmm0, [num]

  call printf

  jmp .exit

.exit:
  mov eax, SYS_exit
  xor edi, edi
  syscall

