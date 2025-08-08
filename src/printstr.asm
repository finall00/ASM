
  %define SYS_write 1
  %define SYS_exit 60

section .data
  msg db 'Estou aqui mais um dia sobre o olhar saguinario do vigia', 10, 0 

section .bss 

  pstr resb 8
  char resb 1


section .text
  global _start


_start:
  call write_char
  call _exit 

_exit:
  mov rax, SYS_exit
  mov rdi, 0
  syscall



write_char:
  mov rax, SYS_write
  mov rdi, rax
  mov rdx, 1
  syscall
  ret
  

