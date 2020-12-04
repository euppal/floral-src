%define esc 0x1B
%define endl 0x0A
%define STDERR_FILENO 2

section .text

extern _setlocale
extern _fputs
extern _fprintf
extern _fdopen
extern _exit

; void init_floral() {
;     setlocale(LC_ALL, "");
; }
global _init_floral
_init_floral:
    xor edi, edi
    lea rsi, [rel _floralid_#_empty_str]
    jmp _setlocale

; void FloralID(, FloralTypeIDSuffixBuilder(FloralTypeIDPointer, FloralTypeIDPointer))(char* ret, char* rbp) {
;     fputs(_floralid_#_alert_str, stderr);
;     fprintf(stderr, _floralid_#_diagnostic_format_str, ret , rbp);
;     exit(1);
; }
global _floralid_stkgrd_fail_u_u
_floralid_stkgrd_fail_u_u:
    push rsi
    push rdi
    mov edi, STDERR_FILENO
    lea rsi, [rel _floralid_#_perms_str]
    call _fdopen
    mov r12, rax
    lea rdi, [rel _floralid_#_alert_str]
    mov rsi, rax
    call _fputs
    mov rdi, r12
    lea rsi, [rel _floralid_#_diagnostic_format_str]
    pop rdx
    pop rcx
    call _fprintf
    mov edi, 1
    jmp _exit

section .bss
    _floralid_#_empty_str: resb 1

section .rodata
    _floralid_#_perms_str: db `w\0`
    _floralid_#_alert_str: db esc, `[33mSECURITY`, esc, `[0;0m: return address overwritten. May be evidence of buffer overflow attack.`, endl, 0
    _floralid_#_diagnostic_format_str: db `- Current return address: %p`, endl, `- Current base pointer: %p`, endl, 0
