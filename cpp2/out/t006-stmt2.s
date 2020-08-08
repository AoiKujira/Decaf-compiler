.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 0
a1: .word 0
tempo1: .word 0
b1: .word 0
tempo3: .word 0
b0: .word 0
a0: .word 0
tempo4: .word 0
tempo5: .word 0
c2: .word 0
tempo6: .word 0
tempo7: .word 0
tempo8: .word 0

.text
main:
b ___main___
___main___:
la $ra,EndOfWorld
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
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, a1
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, b1
addi $sp, $sp, -4
sw $t9, ($sp)
jal abs_mult
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo3
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo3
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
abs_mult:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, b0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, a0
lw $t1, b0
lw $t2, a0
slt $t3, $t1, $t2
sw $t3, tempo4
lw $t9, tempo4
beqz $t9, l0
lw $t1, a0
lw $t2, b0
sub $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
sw $t9, c2
j l1
l0:
lw $t1, b0
lw $t2, a0
sub $t3, $t1, $t2
sw $t3, tempo6
lw $t9, tempo6
sw $t9, c2
l1:
lw $t1, c2
lw $t2, a0
mul $t3, $t1, $t2
sw $t3, tempo7
lw $t1, tempo7
lw $t2, b0
mul $t3, $t1, $t2
sw $t3, tempo8
lw $t9, tempo8
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
EndOfWorld:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
