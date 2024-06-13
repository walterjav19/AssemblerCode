.data
string: .ascii "aeiou"

.text
.global _start

_start:
    LDR X0, =string

    LDRB W1, [X0, #0]
    LDRB W2, [X0, #1]
    LDRB W3, [X0, #2]
    LDRB W4, [X0, #3]
    LDRB W5, [X0, #4]
    SUB  W0, W1, W2


    MOV X8, #93
    SVC 0

