BITS 64
section .text

; Defines various utility functions.

%define byte_swap _floralid_std#byte_swap_u_u
%define qword_swap _floralid_std#qword_swap_u_u
%define make_upper _floralid_std#make_upper_u
%define make_lower _floralid_std#make_lower_u

; func byte_swap(&Void, &Void);
global byte_swap
byte_swap:
    mov al, [rdi]
    mov cl, [rsi]
    mov [rsi], al
    mov [rdi], cl
    ret

; func qword_swap(&Void, &Void);
global qword_swap
qword_swap:
    mov rax, [rdi]
    mov rcx, [rsi]
    mov [rsi], rax
    mov [rdi], rcx
    ret

; These ought to be self explanatory.

; func make_upper(&Char);
global make_upper
make_upper:
    xor eax, eax
make_upper.loophead:
    movzx esi, byte [rdi]
    mov rdx, 32
    cmp sil, 97
    cmovb edx, eax
    cmp sil, 122
    cmova edx, eax
    sub byte [rdi], dl
    inc rdi
    cmp sil, 0
    jnz make_upper.loophead
    ret

; func make_lower(&Char);
global make_lower
make_lower:
    xor eax, eax
make_lower.loophead:
    mov esi, dword [rdi]
    mov edx, 32
    cmp esi, 65
    cmovb edx, eax
    cmp esi, 96
    cmova edx, eax
    add dword [rdi], edx
    add rdi, 4
    cmp esi, 0
    jnz make_lower.loophead
    ret
