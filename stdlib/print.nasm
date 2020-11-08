section .text
extern _floralid__clength_u
extern _floralid_syscall_write_i_u_i

global _floralid_print_u
_floralid_print_u:
  push rdi ; save str
  call _floralid__clength_u ; get length -> rax
  pop rsi ; argument 2 (str)
  mov rcx, rdi ; save str
  mov rdi, 1 ; argument 1 (1 = stdout)
  mov rdx, rax ; argument 3 (str length)
  jmp _floralid_syscall_write_i_u_i ; tail call function

global _floralid_print_ch
_floralid_print_ch:
  dec rsp
  mov byte [rsp], dil
  mov edi, 1
  mov rsi, rsp
  mov edx, 1
  mov eax, 0x2000004
  syscall
  inc rsp
  ret
