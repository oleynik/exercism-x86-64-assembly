section .rodata
prefix:   db "One for ", 0
defolt:  db "you", 0
postfix:  db ", one for me.", 0

section .text
global two_fer

two_fer:
    mov rcx, rdi
    mov rdi, rsi
    lea rsi, [rel prefix]
    call copy_str
    mov rsi, rcx
    test rsi, rsi
    jnz no_default
    lea rsi, [rel defolt]

no_default:
    call copy_str
    lea rsi, [rel postfix]
    call copy_str
    ret

next_char:
    inc rsi
    inc rdi

copy_str:
    mov al, [rsi]
    mov [rdi], al
    test al, al
    jnz next_char
    ret
