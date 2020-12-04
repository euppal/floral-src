section .text

%define reverse _floralid_std#reverse_u_i
%define itoa _floralid_std#itoa_i_u
%define abs64 _floralid_std#abs_i

extern abs64
extern reverse

; void itoa(int64_t value, char* buffer)
global itoa
itoa:
    mov r9, rdi
    call abs64              ; // floral abs preseves rsi
    xor ecx, ecx            ; int64_t idx = 0;
    mov r8d, 10             ; #define r8d 10
itoa.while:
    cmp rax, 0              ; #define cond abs != 0
    jz itoa.while_end       ; while (cond)
    xor edx, edx            ;     // x86 division setup
    div r8                  ;     div_t result = div(abs, r8d);
    mov edi, '0'            ;     #define edi '0'
    add edi, edx            ;     #define digit edi + result.remainder
    mov [rsi+rcx], dil      ;     buffer[idx] = digit;
    ; mov rax, rax          ;     abs = result.quotient;
    inc rcx                 ;     idx++;
    jmp itoa.while
itoa.while_end:
    cmp r9, 0               ; #define cond value < 0
    jge itoa.not_negative   ; if (cond)
    mov byte [rsi+rcx], '-' ;     buffer[idx] = '-';
    inc rcx                 ;     idx++;
itoa.not_negative:
    push rsi
    push rcx
    mov rdi, rsi            ; arg 0 (buffer)
    mov rsi, rcx            ; arg 1 (idx)
    call reverse            ; reverse(buffer, idx);
    pop rcx
    pop rsi
    mov byte [rsi+rcx], 0   ; buffer[idx] = 0;
    ret

%if 0
FloralVoid FloralID(itoa, FloralTypeIDSuffixBuilder(FloralTypeIDInt, FloralTypeIDPointer))(const FloralInt value, FloralChar* buffer) {
    // Variable/constant setup
    FloralInt idx = 0;
    FloralUInt abs;

    abs = value < 0 ? -value : value;

    while (abs) {
        buffer[idx++] = ('0' + (abs % 10));
        abs /= 10;
    }

    // Add negative sign if less than zero
    if (value < 0) {
        buffer[idx++] = '-';
    }

    // Buffer will be backwards
    reverse(buffer, idx);

    // Append null terminator
    buffer[idx] = 0;
}
%endif
