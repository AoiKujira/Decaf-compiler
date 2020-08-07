.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 0
tempo1: .word 0
a2: .word 0
tempo2: .word 0
b2: .word 0
tempo4: .word 0

.text
test:
lw $t1, a0
lw $t2, b0
mul $t3, $t1, $t2
sw $t3, tempo0
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo0
subi $sp, $sp, 4
sw $t9, ($sp)
jr $ra
main:
la $ra, _______End_Of_The_World_______
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo1
lw $t9, tempo1
sw $t9, a2
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo2
lw $t9, tempo2
sw $t9, b2
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, father_this
subi $sp, $sp, 4
sw $t9, ($sp)
jal init_test
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo4
lw $ra, ($sp)
addi $sp, $sp, 4
li	$v0, 11
li	$a0, 10
syscall
jr $ra
_______End_Of_The_World_______:
li	$v0, 10
syscall
