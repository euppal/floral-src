section .text

; Defines various math subroutines

%define abs64 _floralid_std#abs_i
%define abs32 _floralid_std#abs_i32
%define ipow64 _floralid_std#pow_i_i

; The following abs() code was ~~stolen~~ borrowed from https://bits.stephan-brumme.com/absInteger.html
; PRESERVES rsi, rcx, rdx, r8, r9, r10, r11
global abs64
abs64:
    mov rax, rdi
    sar rdi, 63
    xor rax, rdi
    sub rax, rdi
    ret
global abs32
abs32:
    mov eax, edi
    sar edi, 31
    xor eax, edi
    sub eax, edi
    ret

global ipow64
ipow64:
    mov rax, 1
ipow64.loop:
    cmp rsi, 0
    jz ipow64.end
    imul rax, rsi
    dec rsi
    jmp ipow64.loop
ipow64.end:
    ret

%if 0
Maps `n` from the range `a`, `b` to the range `x`, `y`
This uses the fact that a / b * c = a * c / b to delay divison till end

func intmap(n: Int, a: Int, b: Int, x: Int, y: Int) {
    var i = b - a; // size of original range
    var j = n - a; // how far into the original range the value is
    var k = y - x; // size of new range
    var l = k * j / i; // ratio of offset to size translated from original size to new size
    return l + x; // offset into new range + start of new range = position in new range
}
%endif

global _floralid_std#intmap_i_i_i_i_i
_floralid_std#intmap_i_i_i_i_i:
    ; (rdi - rsi) / (rdx - rsi) * (r8 - rcx) + rcx
    sub rdi, rsi
    sub rdx, rsi
    sub r8, rcx
    ; rdi / rdx * r8 + rcx
    mov rsi, rdx
    xor edx, edx
    mov rax, rdi
    ; rax * r8 / rsi + rcx
    imul rax, r8
    idiv rsi
    ; rax + rcx
    add rax, rcx
    ret
