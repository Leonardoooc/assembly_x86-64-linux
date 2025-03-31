.global _start
.intel_syntax noprefix

_start:
  call calculate
  jmp exit

calculate:
  call getNumber1
  call getNumber2

  mov rax, [number1]
  sub rax, '0'

  mov rdi, [number2]
  sub rdi, '0'

  add rax, rdi
  add rax, '0'
  mov [result], rax

  mov rax, 0x01
  mov rdi, 0x01
  lea rsi, [result]
  mov rdx, 2
  syscall
  ret

getNumber1:
  mov rax, 0x00
  mov rdi, 0x00
  lea rsi, [number1]
  mov rdx, 2
  syscall
  ret

getNumber2:
  mov rax, 0x00
  mov rdi, 0x00
  lea rsi, [number2]
  mov rdx, 2
  syscall
  ret

exit:
  mov rax, 0x3c
  mov rdi, 0
  syscall

.section .bss
  number1: .space 2
  number2: .space 2
  result: .space 2
