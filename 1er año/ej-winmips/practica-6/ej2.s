.data
numeros: .asciiz "cero"
.asciiz "dos"
.asciiz "tres"
.asciiz "cuatro"
.asciiz "cinco"
.asciiz "SEIS"
.asciiz "SIETE"
.asciiz "OCHO"
.asciiz "NUEVE"
.asciiz "diez"
.asciiz "invalido"
control: .word32 0x10000
data: .word32 0x10008

.code
lwu $s0, control($zero)
lwu $s1, data($zero)
jal ingreso
dadd $a0, $zero, $v0
daddi $a1, $0, numeros
jal muestra
halt

ingreso:
daddi $t0, $zero, 8
sd $t0, 0($s0)
ld $v0, 0($s1)
daddi $t3, $0, 0
daddi $t4, $0, 9
slt $t2, $t4, $v0
BNEZ $t2, invalido
slt $t7, $v0, $t3
BNEZ $t7, invalido
J valido
invalido:
daddi $v0, $zero, 10
valido: jr $ra
muestra:
daddi $t5, $zero, 4
daddi $t9, $0, 8
dmul $t4, $a0, $t9
dadd $t6, $t4, $a1
sd $t6, 0($s1)
sd $t5, 0($s0)
jr $ra