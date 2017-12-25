; Disassembly of file: hash.o
; Mon Dec 25 14:09:32 2017
; Mode: 32 bits
; Syntax: YASM/NASM
; Instruction set: 80386


global hash_string: function


SECTION .text   align=1 execute                         ; section number 1, code

hash_string:; Function begin
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 16                                 ; 0003 _ 83. EC, 10
        mov     dword [ebp-4H], 0                       ; 0006 _ C7. 45, FC, 00000000
        jmp     ?_002                                   ; 000D _ EB, 1D

?_001:  mov     eax, dword [ebp-4H]                     ; 000F _ 8B. 45, FC
        shl     eax, 7                                  ; 0012 _ C1. E0, 07
        sub     eax, dword [ebp-4H]                     ; 0015 _ 2B. 45, FC
        mov     edx, eax                                ; 0018 _ 89. C2
        mov     eax, dword [ebp+8H]                     ; 001A _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 001D _ 0F B6. 00
        movsx   eax, al                                 ; 0020 _ 0F BE. C0
        add     eax, edx                                ; 0023 _ 01. D0
        mov     dword [ebp-4H], eax                     ; 0025 _ 89. 45, FC
        add     dword [ebp+8H], 1                       ; 0028 _ 83. 45, 08, 01
?_002:  mov     eax, dword [ebp+8H]                     ; 002C _ 8B. 45, 08
        movzx   eax, byte [eax]                         ; 002F _ 0F B6. 00
        test    al, al                                  ; 0032 _ 84. C0
        jnz     ?_001                                   ; 0034 _ 75, D9
        mov     eax, dword [ebp-4H]                     ; 0036 _ 8B. 45, FC
        leave                                           ; 0039 _ C9
        ret                                             ; 003A _ C3
; hash_string End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .eh_frame align=4 noexecute                     ; section number 4, const

        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 7AH, 52H, 00H, 01H, 7CH, 08H, 01H       ; 0008 _ .zR..|..
        db 1BH, 0CH, 04H, 04H, 88H, 01H, 00H, 00H       ; 0010 _ ........
        db 1CH, 00H, 00H, 00H, 1CH, 00H, 00H, 00H       ; 0018 _ ........
        dd hash_string-$-20H                            ; 0020 _ 00000000 (rel)
        dd 0000003BH, 080E4100H                         ; 0024 _ 59 135151872 
        dd 0D420285H, 0CC57705H                         ; 002C _ 222429829 214267653 
        dd 00000404H                                    ; 0034 _ 1028 


