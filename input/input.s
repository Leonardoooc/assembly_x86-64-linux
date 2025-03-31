.global _start
.intel_syntax noprefix

_start:
  call getInput
  call printPostInput
  call printInput
  jmp exit

getInput:
  mov rax, 0x00
  mov rdi, 0x00
  mov rsi, inputData
  mov rdx, 16
  syscall
  ret

printPostInput:
  mov rax, 0x01
  mov rdi, 0x01
  lea rsi, postInputData
  mov rdx, 10
  syscall
  ret

printInput:
  mov rax, 0x01
  mov rdi, 0x01
  mov rsi, inputData
  mov rdx, 16
  syscall
  ret

exit:
  mov rax, 0x3c
  mov rdi, 0
  syscall

.section .bss
  .align 16
  inputData: .space 16

.section .data
  postInputData: .asciz "Digitado: "
