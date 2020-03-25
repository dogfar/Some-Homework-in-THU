addiu $2, $0, 0x1
addiu $4, $0, 0x1
addiu $8, $0, 58
addiu $10, $10, 0x8040
sll $10, $10, 16
addu $6, $4, $2
addu $7, $5, $3
sltu $9, $2, $6
bgtz $9, 8
nop
addiu $7, $7, 0x1
addiu $2, $4, 0
addiu $3, $5, 0
addiu $4, $6, 0
addiu $5, $7, 0
addiu $8, 0xffff
bgtz $8, -48
nop
sw $6, 0($10)
sw $7, 4($10)
jr $31
nop
