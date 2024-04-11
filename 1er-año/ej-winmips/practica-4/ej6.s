    .data
A: .word 3
B: .word 3
C: .word 3
D: .word 0
    .code
    ld r1, A(r0)
    ld r2, B(r0)
    ld r3, C(r0)
    dadd r4, r0, r0
    bne r1,r2, distintos1
    daddi r4, r4, 1
distintos1:
    bne r2, r3, distintos2
    daddi r4, r4, 1
distintos2:
    bne r3, r1, distintos3
    daddi r4, r4, 1
distintos3:
    daddi r5, r0, 1
    bne r4,r5, nodos
    daddi r4, r4,1
nodos:
    sd r4, D(r0)
halt