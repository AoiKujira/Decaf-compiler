.data
____true____: .asciiz "true"
____false____: .asciiz "false"
x0: .word 0
tempo0: .word 2
tempo1: .word 0
tempo2: .word 1
___tempo3___: .asciiz  "  "
tempo3: .word 0
tempo4: .word 1
tempo5: .word 0
tempo6: .word 0
tempo7: .word 2
tempo8: .word 0
tempo9: .word 0
tempo10: .word 1
tempo11: .word 0
tempo12: .word 0
tempo13: .word 2
tempo14: .word 0
tempo15: .word 0
tempo16: .word 0
tempo17: .word 3
tempo18: .word 0
tempo19: .word 6
tempo20: .word 0

.text
main:
b ___main___
f:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, x0
lw $t1, x0
lw $t2, tempo0
sle $t3, $t1, $t2
sw $t3, tempo1
lw $t9, tempo1
beqz $t9, l0
lw $t9, tempo2
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
l0:
la $t9, ___tempo3___
sw $t9, tempo3
lw $t9, x0
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo3
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, x0
lw $t2, tempo4
sub $t3, $t1, $t2
sw $t3, tempo5
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo5
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo6
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo6
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t1, x0
lw $t2, tempo7
sub $t3, $t1, $t2
sw $t3, tempo8
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo8
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo9
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo9
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t1, x0
lw $t2, tempo10
sub $t3, $t1, $t2
sw $t3, tempo11
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo11
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo12
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, x0
lw $t2, tempo13
sub $t3, $t1, $t2
sw $t3, tempo14
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo14
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo15
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, tempo12
lw $t2, tempo15
add $t3, $t1, $t2
sw $t3, tempo16
lw $t9, tempo16
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo17
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo18
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo18
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo19
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo20
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo20
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
