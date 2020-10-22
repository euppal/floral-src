section .text

extern _fgetws
extern _fdopen

global _floralid_wread_i_u
_floralid_wread_i_u:
    xchg rdi, rsi
    push rsi
    push rdi
    xor edi, edi
    lea rsi, [rel _floralid_#perms_str]
    call _fdopen
    pop rdi
    pop rsi
    mov rdx, rax
    sub rsp, 8
    call _fgetws
    add rsp, 8
    ret

section .rodata

_floralid_#perms_str:
    db "r", 0
