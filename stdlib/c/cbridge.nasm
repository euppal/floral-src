%define esc 0x1B
%define endl 0x0A

; Memory functions

extern _malloc
extern _free

global _floralid_malloc_i
_floralid_malloc_i:
    jmp _malloc

global _floralid_free_u
_floralid_free_u:
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

global _floralid_memset_u_i32_i
_floralid_memset_u_i32_i:
    jmp _memset

global _floralid_memchr_u_i32_i
_floralid_memchr_u_i32_i:
    jmp _memchr

global _floralid_memcmp_u_u_i
_floralid_memcmp_u_u_i:
    jmp _memcmp

global _floralid_memcpy_u_u_i
_floralid_memcpy_u_u_i:
    jmp _memcpy

global _floralid_memmove_u_u_i
_floralid_memmove_u_u_i:
    jmp _memmove

global _floralid_strcpy_u_u
_floralid_strcpy_u_u:
    jmp _strcpy

global _floralid_strncpy_u_u_u
_floralid_strncpy_u_u_u:
    jmp _strncpy

global _floralid_strcat_u_u
_floralid_strcat_u_u:
    jmp _strcat

global _floralid_strncat_u_u_u
_floralid_strncat_u_u_u:
    jmp _strncat

global _floralid_strcmp_u_u
_floralid_strcmp_u_u:
    jmp _strcmp

global _floralid_strncmp_u_u_u
_floralid_strncmp_u_u_u:
    jmp _strncmp

global _floralid_strchr_u_i32
_floralid_strchr_u_i32:
    jmp _strchr;

global _floralid_strcoll_u_u
_floralid_strcoll_u_u:
    jmp _strcoll

global _floralid_strcspn_u_u
_floralid_strcspn_u_u:
    jmp _strcspn

global _floralid_strerror_i32
_floralid_strerror_i32:
    jmp _strerror

global _floralid_strlen_u
_floralid_strlen_u:
    jmp _strlen

global _floralid_strpbrk_u_u
_floralid_strpbrk_u_u:
    jmp _strpbrk

global _floralid_strrchr_u_i32
_floralid_strrchr_u_i32:
    jmp _strrchr

global _floralid_strspn_u_u
_floralid_strspn_u_u:
    jmp _strspn

global _floralid_strstr_u_u
_floralid_strstr_u_u:
    jmp _strstr

global _floralid_strtok_u_u
_floralid_strtok_u_u:
    jmp _strtok

global _floralid_strxfrm_u_u_u
_floralid_strxfrm_u_u_u:
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

global _floralid_putchar_ch
_floralid_putchar_ch:
    jmp _putchar

global _floralid_getchar
_floralid_getchar:
    jmp _getchar

global _floralid_fdopen_i
_floralid_fdopen_i:
    jmp _fdopen

global _floralid_fgetc_i
_floralid_fgetc_i:
    jmp _fgetc

global _floralid_fputc_i_u
_floralid_fputc_i:
    jmp _fputc

global _floralid_fgets_u_i_i
_floralid_fgets_u_i_i:
    jmp _fgets

global _floralid_fputs_u_i
_floralid_fputs_u_i:
    jmp _fputs

global _floralid_gets_u
_floralid_gets_u:
    push rdi
    mov edi, 1
    lea rsi, [rel _floralid_#_GETS_UNSAFE_MSG]
    mov rdx, _floralid_#_GETS_UNSAFE_MSG.len
    mov eax, 0x2000004
    syscall
    pop rdi
    jmp _gets

global _floralid_puts_u
_floralid_puts_u:
    jmp _puts

global _floralid_fflush_i
_floralid_fflush_i:
    lea rsi, [rel _floralid_#_FD_PERMS_MAP] ; get opening mode array
    lea rsi, [rsi+rdi*2] ; compute address
    sub rsp, 8 ; align stack
    call _fdopen ; get file handle
    add rsp, 8 ; restore stack
    mov rdi, rax ; file handle as first arg
    jmp _fflush ; fflush(FILE*)

section .rodata
    _floralid_#_FD_PERMS_MAP:
        db "r\0" ; stdin
        db "w\0" ; stdout
        db "w\0" ; stderr

    _floralid_#_GETS_UNSAFE_MSG:
        db esc, "[33mWARNING:", esc, "[0;0m `gets(&Char)` is unsafe: use `fgets(&Char, Int, Int)` instead.", endl
    .len: equ $-_floralid_#_GETS_UNSAFE_MSG
