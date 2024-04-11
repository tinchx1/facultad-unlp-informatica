.data 
letra: .asciiz 'l'
vocales: .asciiz 'aeiouAEIOU'
result: .word 0
.code
lbu $a0, letra($0)
jal es_vocal
sd $v0, result($zero)
halt
es_vocal:
dadd $v0, $zero, $zero
dadd $t0, $zero, $zero
loop:
lbu $t1, vocales($t0)
beqz $t1, fin
beq $a0, $t1, es
daddi $t0, $t0,1
j loop
es: daddi $v0, $v0, 1
fin: jr $ra
