segment .note.GNU-stack noalloc noexec nowrite progbits
  default rel

segment .data
  msg: db "Digite um valor: ", 0
msg1: db "Digite outro valor: ", 0
  formint: db "%lf", 0
  formout: db "Result: %.2f", 10, 0
  number1: dq 0.00
  number2: dq 0.00

segment .text
  global main
  extern printf, scanf

main:
  push rbp
  mov rbp, rsp      ; Alinhamento de stack (16 bytes)
  and rsp, -16

  ; Primeiro Numero
  lea rdi, [rel msg]
  xor eax, eax
  call printf wrt ..plt

  lea rdi, [rel formint]
  lea rsi, [rel number1]
  xor eax, eax
  call scanf wrt ..plt

  ; Segundo numero

  lea rdi, [rel msg1]
  xor eax, eax
  call printf wrt ..plt

  lea rdi, [rel formint]
  lea rsi, [rel number2]
  xor eax, eax
  call scanf wrt ..plt

  ; soma
  movsd xmm0, [rel number1]
  addsd xmm0, [rel number2]  
 
  
  ; Printar os valores
  lea rdi, [rel formout]
  mov al, 1
  call printf wrt ..plt


  ; restaruando o stack pointer definindo codigo de retorno (EXIT = 0) e retornado
  xor eax, eax
  leave
  ret
  

