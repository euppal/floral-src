section .text

%define clength _floralid_std#clength_u
%define syscall_write _floralid_syscall#write_i_u_i
%define unbuffered_print _floralid_std#print_unbuffered_u
%define unbuffered_printch _floralid_std#print_unbuffered_ch
%define unbuffered_println _floralid_std#println_unbuffered_u

extern clength
extern syscall_write

global unbuffered_print
unbuffered_print:
  push rdi          ; save str
  call clength      ; get length -> rax
  pop rsi           ; argument 2 (str)
  mov rcx, rdi      ; save str
  mov rdi, 1        ; argument 1 (1 = stdout)
  mov rdx, rax      ; argument 3 (str length)
  jmp syscall_write ; tail call function

global unbuffered_printch
unbuffered_printch:
  dec rsp
  mov byte [rsp], dil
  mov edi, 1
  mov rsi, rsp
  mov edx, 1
  mov eax, 0x2000004
  syscall
  inc rsp
  ret

global unbuffered_println
unbuffered_println:
  call unbuffered_print
  mov edi, 10
  jmp unbuffered_printch
