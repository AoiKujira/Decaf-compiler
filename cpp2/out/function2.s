.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 5
tempo1: .word 10
tempo2: .word 0
tempo3: .word 4
tempo4: .word 0
a0: .word 0
tempo5: .word 5
tempo6: .word 0
___tempo7___: .asciiz  "hello"
tempo7: .word 0
___tempo8___: .asciiz  "world"
tempo8: .word 0
tempo9: .word 0
tempo10: .word 4
tempo11: .word 5
tempo12: .word 0
tempo13: .word 2
tempo14: .word 0
tempo15: .word 0
s3: .word 0

.text
main:
b ___main___
f:
lw $t1, tempo0
lw $t2, tempo1
mul $t3, $t1, $t2
sw $t3, tempo2
lw $t1, tempo2
lw $t2, tempo3
add $t3, $t1, $t2
sw $t3, tempo4
lw $t9, tempo4
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
g:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, a0
lw $t1, a0
lw $t2, tempo5
seq $t3, $t1, $t2
sw $t3, tempo6
lw $t9, tempo6
beqz $t9, l0
la $t9, ___tempo7___
sw $t9, tempo7
lw $t9, tempo7
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
j l1
l0:
la $t9, ___tempo8___
sw $t9, tempo8
lw $t9, tempo8
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
l1:
jr $ra
___main___:
la $ra, _____EndOfWorld_____
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
lw $t1, tempo10
lw $t2, tempo11
mul $t3, $t1, $t2
sw $t3, tempo12
lw $t1, tempo12
lw $t2, tempo13
div $t3, $t1, $t2
sw $t3, tempo14
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo14
addi $sp, $sp, -4
sw $t9, ($sp)
jal g
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo15
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo15
sw $t9, s3
lw $t9, s3
li	$v0, 4
move	$a0, $t9
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
