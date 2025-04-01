.global _start
.intel_syntax noprefix

_start:
  call comparecondition
  jmp exit

comparecondition:
  call getArg1
  call getArg2

  mov rax, [arg1]
  sub rax, '0'

  mov rdi, [arg2]
  sub rdi, '0'

  cmp rax, rdi
  je conditiontrue
  jne conditionfalse

getArg1:
  mov rax, 0x01
  mov rdi, 0x01
  lea rsi, [input1]
  mov rdx, 13
  syscall

  mov rax, 0x00
  mov rdi, 0x00
  lea rsi, [arg1]
  mov rdx, 10
  syscall
  ret

getArg2:
  mov rax, 0x01
  mov rdi, 0x01
  lea rsi, [input2]
  mov rdx, 14
  syscall

  mov rax, 0x00
  mov rdi, 0x00
  lea rsi, [arg2]
  mov rdx, 10
  syscall
  ret

conditiontrue:
  mov rax, 0x01
  mov rdi, 0x01
  lea rsi, [wordtrue]
  mov rdx, 4
  syscall
  ret

conditionfalse:
  mov rax, 0x01
  mov rdi, 0x01
  lea rsi, [wordfalse]
  mov rdx, 5
  syscall
  ret

exit:
  mov rax, 0x3c
  mov rdi, 0
  syscall

.section .data
  wordtrue: .asciz "True"
  wordfalse: .asciz "False"
  input1: .asciz "First value: "
  input2: .asciz "Second value: "

.section .bss
  arg1: .space 10
  arg2: .space 10
