.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 0
a1: .word 0
tempo1: .word 0
b1: .word 0
tempo3: .word 0
tempo4: .word 0
c2: .word 0
tempo5: .word 0
tempo6: .word 0
tempo7: .word 0

.text
main:
la $ra, _______End_Of_The_World_______
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo0
lw $t9, tempo0
sw $t9, a1
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo1
lw $t9, tempo1
sw $t9, b1
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, father_this
subi $sp, $sp, 4
sw $t9, ($sp)
jal init_abs_mult
li	$v0, 11
li	$a0, 10
syscall
jr $ra
abs_mult:
lw $t1, b0
lw $t2, a0
slt $t3, $t1, $t2
sw $t3, tempo3
lw $t9, tempo3
beqz $t9, l0
lw $t1, a0
lw $t2, b0
sub $t3, $t1, $t2
sw $t3, tempo4
lw $t9, tempo4
sw $t9, c2
l0:
lw $t1, b0
lw $t2, a0
sub $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
sw $t9, c2
lw $t1, a0
lw $t2, b0
mul $t3, $t1, $t2
sw $t3, tempo6
lw $t1, c2
lw $t2, tempo6
mul $t3, $t1, $t2
sw $t3, tempo7
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, tempo7
subi $sp, $sp, 4
sw $t9, ($sp)
jr $ra
_______End_Of_The_World_______:
li	$v0, 10
syscall
