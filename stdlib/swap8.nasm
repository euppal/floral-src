global _floralid_swap8_u_u
_floralid_swap8_u_u:
    mov rax, [rdi]
    mov rcx, [rsi]
    mov [rsi], rax
    mov [rdi], rcx
    ret
