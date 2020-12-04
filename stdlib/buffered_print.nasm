section .text

; Rather than immeditely request the operating system to flush these characters, they are buffered for 512 characters.

%define buffered_print _floralid_std#print_u
%define buffered_printch _floralid_std#print_ch
%define buffered_println _floralid_std#println_u
%define flush _floralid_std#flush
%define _printbuffer _floralid_#_printbuffer
%define _length _floralid_#_length

global buffered_print
buffered_print:
    lea rsi, [rel _printbuffer] ; char* source = _printbuffer;
buffered_print.start:
    mov al, [rdi]               ; char c = *str;
    inc rdi                     ; str++;
    cmp al, 0                   ; if (c == '\0')
    jz buffered_print.end       ;     break;
    mov ecx, [rel _length]      ; int offset = _length;
    mov [rsi+rcx], al           ; source[offset] = c;
    inc dword [rel _length]     ; _length++;
    cmp ecx, 512                ; #define cond1 _length >= 512
    jge buffered_print.flush    ; if (cond1) flush();
    cmp al, 10                  ; #define cond2 c == '\n'
    je buffered_print.flush     ; if (cond2) flush();
    jmp buffered_print.start
buffered_print.flush:
    push rdi
    call flush                  ; flush();
    pop rdi
    jmp buffered_print.start
buffered_print.end:
    ret

global buffered_printch
buffered_printch:
    cmp dil, 0                  ; if (c == 0)
    jz buffered_printch.end     ;     break;
    mov ecx, [rel _length]      ; int offset = _length;
    mov [rsi+rcx], dil          ; source[offset] = c;
    inc dword [rel _length]     ; _length++;
    cmp ecx, 512                ; if (offset >= 512)
    jge buffered_printch.flush    ;     flush();
    cmp dil, 10                 ; if (c == '\n')
    je buffered_printch.flush     ;     flush();
    jmp buffered_printch.end
buffered_printch.flush:
    call flush                  ; flush();
buffered_printch.end:
    ret

global buffered_println
buffered_println:
    call buffered_print
    mov edi, 10
    jmp buffered_printch

global flush
flush:
    mov edx, [rel _length]
    cmp edx, 0
    jz flush.end
    mov edi, 1
    lea rsi, [rel _printbuffer]
    mov eax, 0x2000004
    syscall
    mov dword [rel _length], 0
flush.end:
    ret

section .bss
    ; char _printbuffer[512];
    _printbuffer: resb 512
    ; int _length = 0;
    _length: resd 1
