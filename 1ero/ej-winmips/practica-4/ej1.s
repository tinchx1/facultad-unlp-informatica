 .data 
A: .word 0 
B: .word 0 
c: .word 0 
d: .word 0 
 .code 
 ld r1, A(r0) 
 ld r2, B(r0) 
loop: dsll r1, r1, 1 
 daddi r2, r2, -1 
 bnez r2, loop 
halt
