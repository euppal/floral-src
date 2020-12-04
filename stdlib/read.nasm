section .text
extern _floralid_syscall#read_i_u_i

global _floralid_std#read_i_u
_floralid_std#read_i_u:
  mov rdx, rdi
  mov rdi, 1
  call _floralid_syscall#read_i_u_i ; call function
  ret ; return from function
