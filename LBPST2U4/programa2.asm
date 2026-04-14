%include "macros.asm"

org 100h

jmp start

; ========================
; DATOS
; ========================
titulo db "=== Macros y Control de Flujo ===", 0Dh, 0Ah, '$'
linea_a db "[Linea A] Primera impresion", 0Dh, 0Ah, '$'
linea_b db "[Linea B] Segunda impresion", 0Dh, 0Ah, '$'
msg_mayor db "El valor mayor es: $"
msg_iguales db "Los valores son iguales.", 0Dh, 0Ah, '$'
msg_fin db "Fin del programa.", 0Dh, 0Ah, '$'

; ========================
; CODIGO
; ========================
start:

    print_str titulo

    repetir_str linea_a, 3

    mov cx, 3
    call sumar_serie
    print_str msg_mayor
    print_digito
    nueva_linea

    mov ax, 9
    mov bx, 4
    call comparar_e_imprimir

    mov ax, 5
    mov bx, 5
    call comparar_e_imprimir

    print_str msg_fin
    fin_dos

; ========================
sumar_serie:
    push cx
    xor ax, ax

.paso:
    add ax, cx
    loop .paso

    pop cx
    ret

; ========================
comparar_e_imprimir:
    push ax
    push bx

    cmp ax, bx
    je .iguales
    jg .ax_mayor

    print_str msg_mayor
    mov al, bl
    print_digito
    nueva_linea
    jmp .fin

.ax_mayor:
    print_str msg_mayor
    print_digito
    nueva_linea
    jmp .fin

.iguales:
    print_str msg_iguales

.fin:
    pop bx
    pop ax
    ret