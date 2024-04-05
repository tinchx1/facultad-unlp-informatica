    .data
X: .word 5
CANT: .word 0
TABLA: .word 4,2,5,7,9,4,8,9,1,6
RES: .word 0
    .code
    dadd r1, r0, r0     
    daddi r2, r0, 10
    dadd r3, r0, r0
    ld r5, X(r0)
loop:
    ld r4, TABLA(r1)
    slt r6, r5, r4
    beqz r6, esmenor
    daddi r3, r3, 1
    sd r6, RES(r1)
esmenor:
    daddi r1, r1, 8
    daddi r2, r2, -1
    bnez r2, loop
    sd r3, CANT(r0)
halt