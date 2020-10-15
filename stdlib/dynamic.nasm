section .text

extern _malloc
extern _free

global _floralid_alloc_u_u
_floralid_alloc_u_u:
  imul rdi, rsi
  jmp _malloc

global _floralid_dealloc_u
_floralid_dealloc_u:
  jmp _free
