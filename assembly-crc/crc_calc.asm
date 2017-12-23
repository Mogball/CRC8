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
    mov     ecx, 0

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
    movzx   eax, byte [ebx]
    xor     al, cl
    movzx   edx, al 
    mov     eax, [ebp+0CH]
    add     eax, edx
    movzx   edx, byte [eax]
    movzx   eax, cl
    shl     ax, 8
    xor     ax, dx
    mov     cl, al
    add     ebx, 1
    ret

