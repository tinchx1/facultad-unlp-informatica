.data
control: .word 0x10000
data: .word 0x10008
corte: .ascii "0"
msj: .asciiz
.code
ld $s0, control($zero)
ld $s1, data($zero)
dadd $t0, $zero, $zero
ld $s2, corte($zero)
daddi $t1, $zero, 9
loop:
    sd $t1, 0($s0)
    lbu $t2, 0($s1)
    beq $t2, $s2, FIN
    sb $t2, msj($t0)
    daddi $t0, $t0, 1
    j loop
FIN:
    daddi $t1, $zero, msj
    sd $t1, 0($s1)
    daddi $t2, $zero, 4
    sd $t2, 0($s0) 
halt
