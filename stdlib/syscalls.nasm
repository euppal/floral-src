; Floral syscalls
; syscalls.asm

section .text

; void exit(int rval)
global _floralid_syscall#exit_i
_floralid_syscall#exit_i:
    mov eax, 0x2000001
    syscall
    ret

; int fork(void)
global _floralid_syscall#fork
_floralid_syscall#fork:
    mov eax, 0x2000002
    syscall
    ret

; user_ssize_t read(int fd, user_addr_t cbuf, user_size_t nbyte)
global _floralid_syscall#read_i_u_i
_floralid_syscall#read_i_u_i:
    mov eax, 0x2000003
    syscall
    retq

; user_ssize_t write(int fd, user_addr_t cbuf, user_size_t nbyte)
global _floralid_syscall#write_i_u_i
_floralid_syscall#write_i_u_i:
    mov eax, 0x2000004
    syscall
    ret

; int open(user_addr_t path, int flags, int mode)
global _floralid_syscall#open_u_si_i
_floralid_syscall#open_u_i_i:
    mov eax, 0x2000005
    syscall
    ret

; int close(int fd)
global _floralid_syscall#close_i
_floralid_close_i:
    mov eax, 0x2000006
    syscall
    ret
