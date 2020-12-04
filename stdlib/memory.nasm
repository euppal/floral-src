section .text

%define alloc _floralid_std#alloc_i_i
%define free _floralid_std#free_u
%define reverse _floralid_std#reverse_u_i
%define exchange _floralid_std#exchange_u_u_i
%define insert _floralid_std#insert_u_u_i
%define erase _floralid_std#insert_u_i_i

extern _malloc
extern _free
extern _memmove

global alloc
alloc:
  imul rdi, rsi
  jmp _malloc

global free
free:
  jmp _free

; // Reverse the `length` bytes of `buffer`
; void reverse(char* buffer, int64_t length);
global reverse
reverse:
    cmp esi, 0              ; if (!length)
    je reverse.end          ;     return;
    xor ecx, ecx            ; int64_t i = 0;
    lea rdx, [rsi-1]        ; int64_t j = length - 1;
reverse.while:
    cmp rcx, rdx            ; #define cond i < j
    jge reverse.end         ; while (cond)
    mov al, [rdi+rcx]       ;     char original = buffer[i];
    mov sil, [rdi+rdx]      ;     char toSwap = buffer[j];
    mov [rdi+rdx], al       ;     buffer[j] = original;
    mov [rdi+rcx], sil      ;     buffer[i] = toSwap;
    inc rcx                 ;     ++i;
    dec rdx                 ;     --j;
    jmp reverse.while
reverse.end:
    ret

; // Swaps `length` bytes between `first_buffer` and `second_buffer`
; void exchange(char* first_buffer, char* second_buffer, int64_t length);
global exchange
exchange:                   ; exchange:
    mov al, [rdi]           ; char first_char = *first_buffer;
    mov cl, [rsi]           ; char second_char = *second_buffer;
    mov [rdi], cl           ; *first_buffer = second_char;
    mov [rsi], al           ; *second_buffer = first_char;
    inc rsi                 ; first_buffer++;
    inc rdi                 ; second_buffer++;
    lea rax, [rdx-1]        ; int64_t temp = length - 1;
    test rdx, rdx           ; _Bool perform_goto = (rdx & rdx == 0);
    mov rdx, rax            ; length = temp;
    jnz exchange            ; if (perform_goto) goto exchange;
    ret                     ; return;

; // Insert `source_length` bytes from `source_buffer` to `destination_buffer` at `insertion_pos`
; void insert(char* destination_buffer, char* source_buffer, int64_t insertion_pos, int64_t source_length);
global insert
insert:
    sub rsp, 8              ;
    push rcx                ;
    push rdx                ;
    push rsi                ;
    push rdi                ;
    mov r8, rcx             ; int64_t offset = source_length;
    add r8, rdx             ; offset += insertion_pos;
    mov rsi, [rdi+r8]       ; char* to_move = destination_buffer + offset;
    lea rdi, [rdi+rdx]      ; char* after_insertion = destination_buffer + insertion_pos;
    call _memmove           ; memmove(after_insertion, to_move, source_length);
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    mov rdi, [rdi+rdx]      ; char* where_to_insert = destination_buffer + insertion_pos;
    mov rdx, rcx
    call _memcpy
    add rsp, 8
    ret
