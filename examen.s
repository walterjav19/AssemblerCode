.data
string: .ascii "aeiou"  

.text
.global _start

_start:
    LDR X0, =string        
    
    LDRB X1, [X0, #0]     
    LDRB X2, [X0, #1]     
    LDRB X3, [X0, #2]      
    LDRB X4, [X0, #3]      
    LDRB X5, [X0, #4]     
    
    SUB X0, X2, X3      

    MOV X0,R0   
    
    MOV X8, #93           
    SVC 0                  
