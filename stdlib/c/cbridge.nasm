%define esc 0x1B
%define endl 0x0A

; Memory functions

extern _malloc
extern _realloc
extern _free

global _floralid_libc#malloc_i
_floralid_libc#malloc_i:
    jmp _malloc

global _floralid_libc#realloc_u_i
_floralid_libc#realloc_u_i:
    jmp _realloc

global _floralid_libc#free_u
_floralid_libc#free_u:
    jmp _free

; String functions

extern _memset
extern _memchr
extern _memcmp
extern _memcpy
extern _memmove

extern _strcpy
extern _strncpy
extern _strcat
extern _strncat
extern _strcmp
extern _strncmp
extern _strchr
extern _strcoll
extern _strcspn
extern _strerror
extern _strlen
extern _strpbrk
extern _strrchr
extern _strspn
extern _strstr
extern _strtok
extern _strxfrm

global _floralid_libc#memset_u_i32_i
_floralid_libc#memset_u_i32_i:
    jmp _memset

global _floralid_libc#memchr_u_i32_i
_floralid_libc#memchr_u_i32_i:
    jmp _memchr

global _floralid_libc#memcmp_u_u_i
_floralid_libc#memcmp_u_u_i:
    jmp _memcmp

global _floralid_libc#memcpy_u_u_i
_floralid_libc#memcpy_u_u_i:
    jmp _memcpy

global _floralid_libc#memmove_u_u_i
_floralid_libc#memmove_u_u_i:
    jmp _memmove

global _floralid_libc#strcpy_u_u
_floralid_libc#strcpy_u_u:
    jmp _strcpy

global _floralid_libc#strncpy_u_u_u
_floralid_libc#strncpy_u_u_u:
    jmp _strncpy

global _floralid_libc#strcat_u_u
_floralid_libc#strcat_u_u:
    jmp _strcat

global _floralid_libc#strncat_u_u_u
_floralid_libc#strncat_u_u_u:
    jmp _strncat

global _floralid_libc#strcmp_u_u
_floralid_libc#strcmp_u_u:
    jmp _strcmp

global _floralid_libc#strncmp_u_u_u
_floralid_libc#strncmp_u_u_u:
    jmp _strncmp

global _floralid_libc#strchr_u_i32
_floralid_libc#strchr_u_i32:
    jmp _strchr;

global _floralid_libc#strcoll_u_u
_floralid_libc#strcoll_u_u:
    jmp _strcoll

global _floralid_libc#strcspn_u_u
_floralid_libc#strcspn_u_u:
    jmp _strcspn

global _floralid_libc#strerror_i32
_floralid_libc#strerror_i32:
    jmp _strerror

global _floralid_libc#strlen_u
_floralid_libc#strlen_u:
    jmp _strlen

global _floralid_libc#strpbrk_u_u
_floralid_libc#strpbrk_u_u:
    jmp _strpbrk

global _floralid_libc#strrchr_u_i32
_floralid_libc#strrchr_u_i32:
    jmp _strrchr

global _floralid_libc#strspn_u_u
_floralid_libc#strspn_u_u:
    jmp _strspn

global _floralid_libc#strstr_u_u
_floralid_libc#strstr_u_u:
    jmp _strstr

global _floralid_libc#strtok_u_u
_floralid_libc#strtok_u_u:
    jmp _strtok

global _floralid_libc#strxfrm_u_u_u
_floralid_libc#strxfrm_u_u_u:
    jmp _strxfrm

; I/O Functions

extern _putchar
extern _getchar
extern _fflush
extern _fdopen
extern _fgetc
extern _fputc
extern _fgets
extern _fputs
extern _gets
extern _puts

global _floralid_libc#putchar_ch
_floralid_libc#putchar_ch:
    jmp _putchar

global _floralid_libc#getchar
_floralid_libc#getchar:
    jmp _getchar

global _floralid_libc#fdopen_i
_floralid_libc#fdopen_i:
    jmp _fdopen

global _floralid_libc#fgetc_u
_floralid_libc#fgetc_u:
    jmp _fgetc

global _floralid_libc#fputc_i_u
_floralid_libc#fputc_i_u:
    jmp _fputc

global _floralid_libc#fgets_u_i_u
_floralid_libc#fgets_u_i_u:
    jmp _fgets

global _floralid_libc#fputs_u_u
_floralid_libc#fputs_u_u:
    jmp _fputs

global _floralid_libc#gets_u
_floralid_libc#gets_u:
    push rdi
    mov edi, 1
    lea rsi, [rel _floralid_#_GETS_UNSAFE_MSG]
    mov rdx, _floralid_#_GETS_UNSAFE_MSG.len
    mov eax, 0x2000004
    syscall
    pop rdi
    jmp _gets

global _floralid_libc#puts_u
_floralid_libc#puts_u:
    jmp _puts

global _floralid_libc#fflush_u
_floralid_libc#fflush_u:
;    lea rsi, [rel _floralid_libc##_FD_PERMS_MAP] ; get opening mode array
;    lea rsi, [rsi+rdi*2] ; compute address
;    sub rsp, 8 ; align stack
;    call _fdopen ; get file handle
;    add rsp, 8 ; restore stack
;    mov rdi, rax ; file handle as first arg
    jmp _fflush ; fflush(FILE*)

section .rodata
    _floralid_#_FD_PERMS_MAP:
        db "r\0" ; stdin
        db "w\0" ; stdout
        db "w\0" ; stderr

    _floralid_#_GETS_UNSAFE_MSG:
        db esc, "[33mWARNING:", esc, "[0;0m `gets(&Char)` is unsafe: use `fgets(&Char, Int, Int)` instead.", endl
    .len: equ $-_floralid_libc##_GETS_UNSAFE_MSG
