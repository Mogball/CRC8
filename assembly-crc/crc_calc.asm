global crc_calc:

;
; uint8_t crc_calc(uint8_t message[8], uint8_t table[256])
;
; [ebp+08H] = message + 0
; [ebp+0CH] = table + 0
;

crc_calc:
    push    ebp
    mov     ebp, esp
    
    mov     ebx, [ebp+8H]
    mov     eax, 0

    ; 8 loops
    ; for (byte = 0; byte < 8; ++byte)    
    call inner_loop
    call inner_loop
    call inner_loop
    call inner_loop
    call inner_loop
    call inner_loop
    call inner_loop
    call inner_loop

    leave
    ret

inner_loop:
    ; data = messages[i] ^ remainder
    movzx   edx, byte [ebx]
    xor     dl, al
    ; remainder = table[data]
    mov     eax, [ebp+0CH]
    add     eax, edx
    movzx   eax, byte [eax]
    ; ++i
    add     ebx, 1
    ret

