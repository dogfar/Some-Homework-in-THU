addiu $2, $0, 0x1
addiu $3, $0, 0x1
addiu $4, $0, 0
addiu $5, $0, 10
addiu $6, $6, 0x8040
sll $6, $6, 16
sw $2, 0($6)
addiu $6, $6, 4
sw $3, 0($6)
addu $4, $3, $2
addiu $6, $6, 4
sw $4, 0($6)
addiu $2, $3, 0
addiu $3, $4, 0
addiu $5, 0xffff
bgtz $5, -28
nop
jr $31
nop