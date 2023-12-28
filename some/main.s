extern printf, malloc, free


section .data
    srting db "Run"
section .text

main:
    push ebp
    mov esp, ebp
    sub esp, 12


    push eax, 8
    call malloc
    mov DWORD PTR [eax+4], 
    

    add esp, 12
    pop ebp
