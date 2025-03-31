.global _start
.intel_syntax

_start:
  MOV %rax, 0x01
  MOV %rdi, 0x01
  LEA %rsi, [var]
  MOV %rdx, 13
  SYSCALL

  MOV %rax, 0x3c
  MOV %rdi, 0
  SYSCALL

.section .data
  var: .asciz "Hello, World!"
