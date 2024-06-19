.global _start

.section .data
filename:
    .asciz "archivo.txt"     // Nombre del archivo null-terminated
buffer:
    .byte 0                  // Buffer para almacenar el primer carácter leído

.section .text
_start:
    // sys_open (llamada al sistema 56)
    mov x0, filename         // Primer argumento: nombre del archivo
    mov x1, 0                // Segundo argumento: O_RDONLY
    mov x8, 56               // Número de llamada al sistema: sys_open
    svc 0                    // Llamada al sistema
    mov x19, x0              // Guardar el file descriptor en x19

    // sys_read (llamada al sistema 63)
    mov x0, x19              // Primer argumento: file descriptor
    ldr x1, =buffer          // Segundo argumento: buffer para el carácter
    mov x2, 1                // Tercer argumento: número de bytes a leer
    mov x8, 63               // Número de llamada al sistema: sys_read
    svc 0                    // Llamada al sistema

    // sys_write (llamada al sistema 64)
    mov x0, 1                // Primer argumento: file descriptor (stdout)
    ldr x1, =buffer          // Segundo argumento: buffer con el carácter
    mov x2, 1                // Tercer argumento: número de bytes a escribir
    mov x8, 64               // Número de llamada al sistema: sys_write
    svc 0                    // Llamada al sistema

    // sys_close (llamada al sistema 57)
    mov x0, x19              // Primer argumento: file descriptor
    mov x8, 57               // Número de llamada al sistema: sys_close
    svc 0                    // Llamada al sistema

    // sys_exit (llamada al sistema 93)
    mov x0, 0                // Código de salida
    mov x8, 93               // Número de llamada al sistema: sys_exit
    svc 0                    // Llamada al sistema
