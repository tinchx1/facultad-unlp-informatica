.data
control: .word32 0x10000
data: .word32 0x10008
color: .byte
.code
lwu $s0, control($0)
lwu $s1, data($0)
daddi $t0, $0, 8
sb $t0, 0($s0)
lbu $t1, 0($s1)
sb $t0, 0($s0)
lbu $t2, 0($s1)
daddi $t2, $0, 0
daddi $t4, $0, 4
loop: 
sb $t0, 0($s0)
lbu $t3, 0($s1) 
sb $t3, color($t2)
daddi $t2, $t2, 1
beq $t4, $t2, mostrar
j loop
mostrar:
sb $t1, 5($s1)
sb $t2, 4($s1)
lwu $s1, color($0)
daddi $t7, $0, 5
sd $t7, 0($s1)
halt
