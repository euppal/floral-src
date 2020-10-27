section .text

;  Maps `n` from the range `a`, `b` to the range `x`, `y`
;  This uses the fact that a / b * c = a * c / b to delay divison till end
;
;  func intmap(n: Int, a: Int, b: Int, x: Int, y: Int) {
;    var i = b - a;
;    var j = n - a;
;    var k = y - x;
;    var l = j * k;
;    return l / i + x;
;  }

global _floralid_intmap_i_i_i_i_i
_floralid_intmap_i_i_i_i_i:
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
