addiu $2, $0, 30
addiu $4, $0, 0x20
addiu $5, $0, 0x7f
addiu $4, $4, 0x1
syscall
bne $4, $5, -12
nop
jr $31
nop
