BITS 64
section .text

%define clength _floralid_std#clength_u
%define clength_nomangle _floralid__clength_u

global clength
global clength_nomangle
clength_nomangle:
clength:
    mov rax, -1
clength.loop:
    inc rax
    cmp byte [rdi+rax], 0
    jnz clength.loop
    ret
