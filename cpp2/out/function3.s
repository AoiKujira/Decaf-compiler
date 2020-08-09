.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 1
tempo1: .word 2
tempo2: .word 1
tempo3: .word 3
tempo4: .word 5
tempo5: .word 4
tempo7: .word 0
tempo8: .word 0
tempo9: .word 5

.text
main:
b ___main___
f:
lw $t9, tempo0
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
lw $t9, tempo1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
g:
l0:
lw $t9, tempo2
beqz $t9, l1
lw $t9, tempo3
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo4
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
lw $t9, tempo5
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
j l0
l1:
jr $ra
___main___:
la $ra, _____EndOfWorld_____
jal f
lw $ra, ($sp)
addi $sp, $sp, 4
jal g
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo7
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo8
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
lw $t9, tempo9
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
