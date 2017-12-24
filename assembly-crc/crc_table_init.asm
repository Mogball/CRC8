global crc_table_init:

;
; void crc_table_init(uint8_t table[256]);
;
; [ebp+8H] = table + 0
;

crc_table_init:
    push    ebp
    mov     ebp, esp

    ; Store pointer to table start
    mov     ebx, [ebp+8H]
    ; Initialize dividend counter (0 <= dividend <= 255)
    mov     ecx, -1
    
loop:
    ; Increment dividend
    add     ecx, 1
    ; eax = remainder = dividend
    mov     al, cl
    ; do xor/shift eight times
    ; for (uint8_t bit = 0; bit < 8; ++bit);
    call perform_div
    call perform_div
    call perform_div
    call perform_div
    call perform_div
    call perform_div
    call perform_div
    call perform_div

    ; move pointer to table + dividend
    mov     edx, ebx
    add     edx, ecx
    ; store value table[dividend] = remainder
    mov     byte [edx], al
    
    ; check condition dividend != 0xff
    cmp     ecx, 0ffH
    jbe     loop

    ; return
    leave
    ret

; eax contains remainder
; if (remainder & 0x80)
;       remainder <<= 1
;       remainder ^= 0x97
; else
;       remainder <<= 1
perform_div:
    test    al, al
    jns     no_xor
    shl     al, 1
    xor     al, 97H
    jmp     finish
    
no_xor:
    shl     al, 1

finish:
    ret


