global crc_calc:

crc_calc:
    push    ebp
    mov     ebp, esp
    sub     esp, 8
    mov     byte [ebp-1H], 0
    mov     ecx, 0
    jmp     ?_exit

?_loop:
    mov     eax, dword [ebp+8H]
    add     eax, ecx
    movzx   eax, byte [eax]
    xor     al, byte [ebp-1H]
    movzx   edx, al
    mov     eax, dword [ebp+0CH]
    add     eax, edx
    movzx   edx, byte [eax]
    movzx   ax, byte [ebp-1H]
    shl     ax, 8
    xor     ax, dx
    mov     byte [ebp-1H], al
    add     cl, 1

?_exit:
    cmp     cl, 7
    jbe     ?_loop
    movzx   eax, byte [ebp-1H]
    leave
    ret

