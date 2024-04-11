.data
cad1: .asciiz "helo"
cad2: .asciiz "helo"
result: .word 0

.code
daddi $a0, $zero, cad1
daddi $a1, $zero, cad2
jal comparar
sd $v0, result($zero)
halt

comparar: dadd $v0, $zero, $zero
loop:
lbu $t0, 0($a0)
lbu $t1, 0($a1)
beqz $t0, fin_1
beqz $t1, fin
bne $t1, $t2, fin
daddi $v0, $v0, 1
daddi $a0, $a0, 1
daddi $a1, $a1, 1
j loop
fin_1:
bnez $t1, fin
daddi $v0, $zero, 1
fin:
jr $ra






