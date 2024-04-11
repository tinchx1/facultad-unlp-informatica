.data ;48 al 57
    DATA: .word 0x10008
    CONTROL:    .word 0x10000
    CERO: .asciiz "CERO"
    UNO: .asciiz "UNO"
    DOS: .asciiz "DOS"
    TRES: .asciiz "TRES"
    CUATRO: .asciiz "CUATRO"
    CINCO: .asciiz "CINCO"
    SEIS: .asciiz "SEIS"
    SIETE: .asciiz "SIETE"
    OCHO: .asciiz "OCHO"
    NUEVE: .asciiz "NUEVE"
.code
    ld $s1,CONTROL($0) ;$s1 es CONTROL
    ld $s0,DATA($0) ;$s0 es DATA
    daddi $s2,$0,9
    daddi $s4,$0,4
    daddui $s5,$0,8
    dadd $v0,$0,$0
    daddui $s3,$0,48
    JAL ingreso
    BEQZ $v0,FIN
    JAL muestra
FIN: halt

ingreso:
    sd $s2,0($s1)
    lbu $t2,0($s0)
    slti $t3,$t2,58
    BEQZ $t3, NO_digito
    slti $t4,$t2,47
    BNEZ $t4,NO_digito
    daddi $v0,$0,1
NO_digito: jr $ra

muestra:
    dsub $t3,$t2,$s3
    dmul $t3,$t3,$s5
    daddi $t4,$t3,CERO
    sd $t4,0($s0)
    sd $s4,0($s1)
jr $ra
