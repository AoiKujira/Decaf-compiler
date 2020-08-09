.data
____true____: .asciiz "true"
____false____: .asciiz "false"
fe0: .word 0
tempo0: .word 34
c0: .word 0
b0: .word 0
a0: .word 0
tempo2: .word 12
tempo5: .word 2
___tempo6___: .asciiz  " and "
tempo6: .word 0
tempo7: .word 1
tempo9: .word 10
tempo10: .word 3
tempo11: .word 2
tempo12: .word 0
tempo13: .word 0
tempo14: .word 5
tempo15: .word 0

.text
main:
b ___main___
f:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, fe0
lw $t9, fe0
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
ff:
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo0
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
g:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, c0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, b0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, a0
lw $t9, c0
beqz $t9, ____printFalse0____
____printTrue0____:
la $a0, ____true____
li $v0, 4
syscall
j ____printEnd0____
____printFalse0____:
la $a0, ____false____
li $v0, 4
syscall
____printEnd0____:
lw $t9, b0
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, a0
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
___main___:
la $ra, _____EndOfWorld_____
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo2
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $ra, ($sp)
addi $sp, $sp, 4
jal ff
lw $ra, ($sp)
addi $sp, $sp, 4
la $t9, ___tempo6___
sw $t9, tempo6
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo5
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, tempo6
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, tempo7
addi $sp, $sp, -4
sw $t9, ($sp)
jal g
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, tempo10
lw $t2, tempo11
rem $t3, $t1, $t2
sw $t3, tempo12
lw $t1, tempo9
lw $t2, tempo12
add $t3, $t1, $t2
sw $t3, tempo13
lw $t1, tempo13
lw $t2, tempo14
add $t3, $t1, $t2
sw $t3, tempo15
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo15
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
