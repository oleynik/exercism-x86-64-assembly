section .text
global leap_year

leap_year:
    xor eax, eax
    test dil, 3
    jne non_leap
    
    imul rcx, rdi, 0x51EB851F
    shr rcx, 37
    imul ecx, ecx, 100
    cmp edi, ecx
    jne leap

    test dil, 15
    jne non_leap

leap:
    mov eax, 1
    ret

non_leap:
    mov eax, 0
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
