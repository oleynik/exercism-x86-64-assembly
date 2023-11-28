section .text
global square_root
square_root:
    mov rax, rdi
    mul rdi     ; rax := rad * rad
    xor rdx, rdx; rdx := i
    xor rcx, rcx; rcx := i * i

sqrt_loop:
    lea rcx, [rcx + rdx * 2] ; dx/dy(x*x) = 2x
    cmp rcx, rdi
    jge sqrt_ret
    inc rdx
    jmp sqrt_loop

sqrt_ret:
    mov rax, rdx
    ret
