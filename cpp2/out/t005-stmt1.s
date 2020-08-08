.data
____true____: .asciiz "true"
____false____: .asciiz "false"
b0: .word 0
a0: .word 0
tempo0: .word 0
tempo1: .word 0
a2: .word 0
tempo2: .word 0
b2: .word 0
tempo4: .word 0
___tempo5___: .asciiz  "hi"
tempo5: .word 0

.text
test:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, b0
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, a0
lw $t1, a0
lw $t2, b0
mul $t3, $t1, $t2
sw $t3, tempo0
lw $t9, tempo0
subi $sp, $sp, 4
sw $t9, ($sp)
jr $ra
jr $ra
main:
la $ra, _______End_Of_The_World_______
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo1
lw $t9, tempo1
sw $t9, a2
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo2
lw $t9, tempo2
sw $t9, b2
subi $sp, $sp, 4
sw $ra, ($sp)
lw $t9, a2
subi $sp, $sp, 4
sw $t9, ($sp)
lw $t9, b2
subi $sp, $sp, 4
sw $t9, ($sp)
jal test
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo4
lw $ra, ($sp)
addi $sp, $sp, 4
la $t9, ___tempo5___
sw $t9, tempo5
lw $t9, tempo4
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo5
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
jr $ra
_______End_Of_The_World_______:
li	$v0, 10
syscall
