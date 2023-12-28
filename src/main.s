extern printf, malloc, free, scanf

section .bss
    in1 resd 1

section .data
    string db "Run Code", 0xA, 0
    i32 db "%d",    0xA, 0
    char db "%s",   0xA, 0
    f32 db "%f",  0xA, 0
    real dd 3.14

section .text

main:
    
    push ebp
    mov ebp, esp
    sub esp, 8

    mov eax, 90
    mov DWORD[esp], i32
    mov DWORD[esp+4], eax

    call printf    

    cmp eax, 45
    je ok
    jmp else

        ok:
            mov eax, 50
            jmp end
        else:
            mov eax, 25
            jmp end
        end:

    mov DWORD[esp], i32
    mov DWORD[esp+4], eax
    call printf

    add esp, 8
    pop ebp  
    ret