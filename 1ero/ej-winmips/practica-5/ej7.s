    .data
M: .double 5.2
TABLA: .double 2.5,5.3,7.4,3.2,6.4,74.1,3.3,2.3,2.7,2.75
CANT: .word 10
RESUL: .word 0
    .code
l.d $a0,TABLA(0)
l.d $s1,M(0)
ld $a2,CANT($zero)
ld $a3,RESUL($zero)
Jal mayores
halt
mayores: 
daddi $sp,$sp,-8
sd $ra,0($sp)   
ld $t5,0 
ld $t1,$s1
ld $t2,$a2
ld $t3,$a3
loop:
beqz $t2,retornar
ld $t0,$t5($a0)
c.le.d $t1,$t0
bc1t noesmayor
daddi $t3,$t3,1
noesmayor:
daddi $t2,$t2,-1
daddi $t5,$t5,1
j mayores
retornar:
sd $t3,$v0 
ld $ra,0($sp)
jr $ra