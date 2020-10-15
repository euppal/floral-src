# Utilities
# util.s

.text

.global _floralid__clength_u
_floralid__clength_u:
    movq $-1, %rax
_floralid__clength_u.loophead:
    inc %rax
    cmpb $0, (%rdi, %rax)
    jnz _floralid__clength_u.loophead
    ret
