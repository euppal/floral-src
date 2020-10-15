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
  call _floralid_syscall_write_i_u_i ; call function
  ret ; return from function
