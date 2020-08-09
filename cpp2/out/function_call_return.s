.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 1
tempo1: .word 2
tempo2: .float 5.1234
___tempo3___: .asciiz  "f"
tempo3: .word 0
tempo4: .word 0
tempo5: .word 0
tempo6: .word 0
tempo7: .word 0

.text
main:
b ___main___
k:
lw $t9, tempo0
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
h:
lw $t9, tempo1
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
g:
lw $t9, tempo2
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
f:
la $t9, ___tempo3___
sw $t9, tempo3
lw $t9, tempo3
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo4
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo4
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
jal g
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo5
lw $ra, ($sp)
addi $sp, $sp, 4
l.s $f9, tempo5
li	$v0, 2
mov.s 	$f12, $f9
syscall
li	$v0, 11
li	$a0, 10
syscall
jal h
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
jal k
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo7
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo7
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
