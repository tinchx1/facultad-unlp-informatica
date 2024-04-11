.data ;CORTA CUANDO ENTRA EL 0
    CONTROL: .word 0x10000
    DATA: .word 0x10008
    CORTE: .ascii "0"
    CADENA: .ascii ; El mensaje a mostrar
.code
    ld $s0,DATA($0) ;S0 ES DATA
    ld $s1,CONTROL($0) ;S1 ES CONTROL
    dadd $s3,$0,$0      ;S3 ES EL DESP DE CAD
    lbu $s4,CORTE($0)   ;S4 ES "0"
    daddi $t1,$0,9 ;pido char
LOOP:
    sd $t1,0($s1)

    lbu $t2,0($s0) ;salvo DATA en $t2

    BEQ $t2,$s4,FIN
    sb $t2,CADENA($s3)
    daddi $s3,$s3,1
J LOOP
FIN:
    daddi $t0,$0,CADENA
    sd $t0,0($s0)

    daddi $t1,$0,4
    sd $t1,0($s1)
halt
