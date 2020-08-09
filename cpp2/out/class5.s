.data
____true____: .asciiz "true"
____false____: .asciiz "false"
Cow_this: .word 0
___tempo0___: .asciiz  "Moo"
tempo0: .word 0
Barn_this: .word 0
tempo1: .word 0
___tempo1___: .word 0
tempo2: .word 0
b2: .word 0
tempo3: .word 0
___tempo3___: .word 0

.text
main:
b ___main___
Cow_Init:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Cow_this
la $t9, ___tempo0___
sw $t9, tempo0
lw $t9, tempo0
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t9, null
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
Barn_Init:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Barn_this
lw	$t9, ___tempo1___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo1
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo1
addi $sp, $sp, -4
sw $t9, ($sp)
jal Cow_Init
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo2
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo2
sw $t9, b2
jr $ra
___main___:
la $ra, _____EndOfWorld_____
lw	$t9, ___tempo3___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo3
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo3
addi $sp, $sp, -4
sw $t9, ($sp)
jal int_Init
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
