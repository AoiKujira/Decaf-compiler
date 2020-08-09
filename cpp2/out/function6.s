.data
____true____: .asciiz "true"
____false____: .asciiz "false"
s0: .word 0
tempo0: .word 0
tempo1: .word 0
tempo2: .word 1
tempo3: .word 0
tempo4: .word 0
tempo5: .word 0
tempo6: .word 234
tempo7: .word 0

.text
main:
b ___main___
sum:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, s0
lw $t1, s0
lw $t2, tempo0
seq $t3, $t1, $t2
sw $t3, tempo1
lw $t9, tempo1
beqz $t9, l0
lw $t9, s0
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
l0:
lw $t1, s0
lw $t2, tempo2
sub $t3, $t1, $t2
sw $t3, tempo3
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo3
addi $sp, $sp, -4
sw $t9, ($sp)
jal sum
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo4
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, s0
lw $t2, tempo4
add $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo6
addi $sp, $sp, -4
sw $t9, ($sp)
jal sum
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo7
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo7
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
