section .text

global _floralid_strtowstr_u_u
_floralid_strtowstr_u_u:
    xor eax, eax
    mov al, [rsi]
    mov [rdi], eax
    inc rsi
    add rdi, 4
    cmp eax, 0
    jne _floralid_strtowstr_u_u
    ret
