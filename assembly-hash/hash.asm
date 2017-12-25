global hash_string:

hash_string:
    push    ebp
    mov     ebp, esp

    ; h = 0
    mov     edx, 0
    ; ebx = s
    mov     ebx, dword [ebp+8H]
    jmp     loop_end

loop:
    ; MUL_127
    ; (h << 7) - h
    mov     eax, edx
    shl     eax, 7
    sub     eax, edx
    ; ecx = *s
    movzx   ecx, byte [ebx]
    ; MUL_127(h) + *s
    add     eax, ecx
    mov     edx, eax
    add     ebx, 1

loop_end:
    movzx   eax, byte [ebx]
    test    al, al
    jnz     loop
    mov     eax, edx
    leave
    ret

