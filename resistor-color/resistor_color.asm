section .data
c_black: db "black", 0, 0, 0
c_brown: db "brown", 0, 0, 0
c_red: db "red", 0, 0, 0, 0, 0
c_orange: db "orange", 0, 0
c_yellow: db "yellow", 0, 0
c_green: db "green", 0, 0, 0
c_blue: db "blue", 0, 0, 0, 0
c_violet: db "violet", 0, 0
c_grey: db "grey", 0, 0, 0, 0
c_white: db "white", 0
c_all: dq c_black, c_brown, c_red, c_orange, c_yellow, c_green, c_blue, c_violet, c_grey, c_white
  
section .text
global color_code
color_code:
    mov       rax, 0
    lea       rbx, [rel c_black]

cmp_color:
    mov       r8, rbx
    mov       r9, rdi

cmp_char:
    mov       cl, [r8]
    mov       dl, [r9]
    cmp       cl, dl
    jne       next_color
    cmp       cl, 0
    je        done
    inc       r8
    inc       r9
    jmp       cmp_char
    
next_color:
    inc       rax
    add       rbx, 8
    cmp       rax, 10
    je        done
    jmp       cmp_color
done:
    ret

global colors
colors:
    lea      rax, [rel c_all]
    ret
