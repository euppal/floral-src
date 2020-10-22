global _floralid_wmakeupper_u
_floralid_wmakeupper_u:
    xor eax, eax
_floralid_wmakeupper_u.loophead:
    mov esi, dword [rdi]
    mov edx, 32
    cmp esi, 97
    cmovb edx, eax
    cmp esi, 122
    cmova edx, eax
    sub esi, edx
    add rdi, 4
    cmp esi, 0
    jnz _floralid_makeupper_u.loophead
    ret

global _floralid_wmakelower_u
_floralid_wmakelower_u:
    xor eax, eax
_floralid_wmakelower_u.loophead:
    mov esi, dword [rdi]
    mov edx, 32
    cmp esi, 65
    cmovb edx, eax
    cmp esi, 96
    cmova edx, eax
    add esi, edx
    add rdi, 4
    cmp esi, 0
    jnz _floralid_wmakelower_u.loophead
    ret
