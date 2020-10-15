# Floral syscalls
# sys.s

.text

.global _floralid_syscall_write_i_u_i
_floralid_syscall_write_i_u_i:
    movq $0x2000004, %rax # write
    syscall
    retq

.global _floralid_syscall_read_i_u_i
_floralid_syscall_read_i_u_i:
    movq $0x2000003, %rax # read
    syscall
    retq

.global _floralid_syscall_exit_i
_floralid_syscall_exit_i:
    movq $0x2000001, %rax # exit
    syscall
    retq
