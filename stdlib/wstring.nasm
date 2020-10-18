section .text

global _floralid_wstrlen_u
_floralid_wstrlen_u:
    xor eax, eax
    mov rcx, rdi
    sub rdi, 4
_floralid_wstrlen_u.loophead:
    add rdi, 4
    cmp eax, [rdi]
    jnz _floralid_wstrlen_u.loophead
    sub rdi, rcx
    shr rdi, 2
    mov rax, rdi
    ret
