.global _start

_start:
    // CARGAMOS EL MENSAJE EN PANTALLA
    mov x0, 1       // set stdout
    ldr x1, =msg    // load msg
    mov x2, 16      // size msg
    mov x8, 64      // write syscall_num
    svc 0           // generic syscall

    // CARGAMOS EL TEXTO
    mov x0, 0       // set stdin
    ldr x1, =input    // load buffer
    mov x2, 2      // size buffer
    mov x8, 63      // read syscall_num
    svc 0           // generic syscall

    ldr x0, =input  // load number
    ldrb w1, [x0]   // load 1st digit
    sub w1, w1, 48  // ascii to num
    and w2, w1, 1   // check parity

    cmp w2, 0
    bne ODD_NUMBER

    EVEN_NUMBER:
        mov x0, 1       // set stdout
        ldr x1,=par     // load msg
        mov x2, 8      // size msg
        mov x8, 64      // write syscall_num
        svc 0
        b CLOSE

    ODD_NUMBER:
        mov x0, 1       // set stdout
        ldr x1,=impar     // load msg
        mov x2, 7      // size msg
        mov x8, 64      // write syscall_num
        svc 0
    CLOSE:
        mov x0, 0       // set stdout
        mov x8, 93    // load msg
        svc 0
    


.data
msg:
   msg:   .ascii "Enter a Number: "
   impar:  .ascii "Is odd\n"
   par: .ascii "Is even\n"
buf:
  input:  .space 2
