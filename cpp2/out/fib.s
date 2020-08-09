.data
____true____: .asciiz "true"
____false____: .asciiz "false"
x0: .word 0
tempo0: .word 2
tempo1: .word 0
tempo2: .word 1
tempo3: .word 1
tempo4: .word 0
tempo5: .word 0
tempo6: .word 2
tempo7: .word 0
tempo8: .word 0
tempo9: .word 0
tempo10: .word 3
tempo11: .word 0
tempo12: .word 6
tempo13: .word 0

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
lw $t1, x0
lw $t2, tempo3
sub $t3, $t1, $t2
sw $t3, tempo4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo4
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo5
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, x0
lw $t2, tempo6
sub $t3, $t1, $t2
sw $t3, tempo7
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo7
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo8
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, tempo5
lw $t2, tempo8
add $t3, $t1, $t2
sw $t3, tempo9
lw $t9, tempo9
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo10
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo11
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo11
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo12
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo13
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo13
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
