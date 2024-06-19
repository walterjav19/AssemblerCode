.section .data
message:
    .ascii "Hola Mundo!\n"
len = . - message

.section .text
.global _start

_start:
    // Escribir el mensaje
    mov x0, 1          // File descriptor 1: stdout
    ldr x1, =message   // Dirección del mensaje
    ldr x2, =len       // Longitud del mensaje
    mov x8, 64         // Número de llamada del sistema para sys_write (en AArch64)
    svc 0              // Llamada al sistema

    // Salir del programa
    mov x0, 0          // Estado de salida
    mov x8, 93         // Número de llamada del sistema para sys_exit (en AArch64)
    svc 0              // Llamada al sistema
