section .data
    c_black: db "black", 0
    c_brown: db "brown", 0
    c_red: db "red", 0
    c_orange: db "orange", 0
    c_yellow: db "yellow", 0
    c_green: db "green", 0
    c_blue: db "blue", 0
    c_violet: db "violet", 0
    c_grey: db "grey", 0
    c_white: db "white", 0
    c_all: dq c_black, c_brown, c_red, c_orange, c_yellow, c_green, c_blue, c_violet, c_grey, c_white

section .text
global value
value:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov [rsp], rsi
    call decode_color
    mov r11, 10
    imul r11, rax
    mov rdi, [rsp]
    call decode_color
    add rax, r11
    add rsp, 8
    mov rsp, rbp
    pop rbp
    ret

decode_color:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov [rsp], rdi
    lea rcx, [rel c_all]
    mov r10, 0

loop:
    cmp r10, 9
    jg exit
    mov rdi, [rsp]
    
    mov rsi, [rcx + 8*r10]
    call string_cmp
    cmp rax, 1
    je exit
    inc r10
    jmp loop

exit:
    mov rax, r10
    add rsp, 8
    mov rsp, rbp
    pop rbp
    ret

string_cmp:
string_cmp_loop:
    mov al, [rdi]
    mov bl, [rsi]
    cmp al, bl
    jne string_cmp_not_equal
    cmp al, 0
    je string_cmp_equal
    inc rdi
    inc rsi
    jmp string_cmp_loop

string_cmp_not_equal:
    mov rax, 0
    ret

string_cmp_equal:
    mov rax, 1
    ret
