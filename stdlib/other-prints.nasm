section .text

; goal is for this to NOT exist

extern _floralid_std#itoa_i_u
extern _floralid_std#print_u

global _floralid_std#print_i
_floralid_std#print_i:
global _floralid_std#print_i32
_floralid_std#print_i32:
global _floralid_std#print_i16
_floralid_std#print_i16:
    lea rsi, [rel _floralid_#print_buffer]
    call _floralid_std#itoa_i_u
    lea rsi, [rel _floralid_#print_buffer]
    jmp _floralid_std#print_u

global _floralid_std#print_b
_floralid_std#print_b:
    cmp rdi, 0
    je _floralid_print_b.false_branch
    lea rdi, [rel _floralid_#bool_literal_true]
    jmp _floralid_std#print_u
_floralid_print_b.false_branch:
    lea rdi, [rel _floralid_#bool_literal_false]
    jmp _floralid_std#print_u

section .rodata
    _floralid_#bool_literal_false: db "false", 0
    _floralid_#bool_literal_true: db "true", 0

section .bss
    _floralid_#print_buffer: resb 64
