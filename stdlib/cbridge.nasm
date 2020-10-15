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

extern _strcpy
extern _strncpy
extern _strcat
extern _strncat
extern _strcmp
extern _strncmp

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

; I/O Functions

extern _putchar
extern _fflush
extern _fdopen

global _floralid_putchar_ch
_floralid_putchar_ch:
    jmp _putchar

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
        db "w\0" ; stdin
        db "r\0" ; stdout
        db "r\0" ; stderr
