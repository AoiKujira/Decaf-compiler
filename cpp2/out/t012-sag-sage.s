.data
____true____: .asciiz "true"
____false____: .asciiz "false"
Dog_this: .word 0
ind0: .word 0
tempo0: .word 0
c2: .word 0
tempo1: .word 0
___tempo1___: .word 4
a2: .word 0
tempo2: .word 0
___tempo2___: .word 4
b2: .word 0
tempo3: .word 5
tempo4: .word 0
_____4_____: .word 4
tempo5: .word 0
_____0_____: .word 0
tempo6: .word 2
tempo8: .word 0
tempo7: .word 0
tempo9: .word 10
tempo10: .word 0
tempo11: .word 0
tempo12: .word 2
tempo13: .word 0
tempo14: .word 89
tempo16: .word 0
tempo15: .word 0
tempo17: .word 2

.text
main:
b ___main___
Dog_return_thing:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Dog_this
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, ind0
lw $t9, Dog_this
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo0
lw $t9, tempo0
sw $t9, c2
lw	$t9, ___tempo1___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo1
lw $t9, tempo1
sw $t9, a2
lw	$t9, ___tempo2___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo2
lw $t9, tempo2
sw $t9, b2
lw $t1, tempo3
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo4
lw $t1, tempo4
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo4
lw	$t9, tempo4
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo4
lw $t9, tempo4
lw $t8, tempo3
sw $t8, ($t9)
lw $t1, tempo4
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo4
lw $t1, a2
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
lw $t8, tempo4
sw $t8, ($t9)
lw $t1, a2
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo8
lw $t9, tempo8
lw $t9, ($t9)
sw $t9, tempo7
lw $t1, _____4_____
lw $t2, tempo6
mul $t3, $t1, $t2
sw $t3, tempo8
lw $t1, tempo7
lw $t2, tempo8
add $t3, $t1, $t2
sw $t3, tempo7
lw $t9, tempo7
lw $t8, c2
sw $t8, ($t9)
lw $t1, tempo9
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo10
lw $t1, tempo10
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo10
lw	$t9, tempo10
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo10
lw $t9, tempo10
lw $t8, tempo9
sw $t8, ($t9)
lw $t1, tempo10
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo10
lw $t1, b2
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo11
lw $t9, tempo11
lw $t8, tempo10
sw $t8, ($t9)
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo12
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, a2
addi $sp, $sp, -4
sw $t9, ($sp)
jal Dog_return_thing
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo13
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, b2
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo16
lw $t9, tempo16
lw $t9, ($t9)
sw $t9, tempo15
lw $t1, _____4_____
lw $t2, tempo13
mul $t3, $t1, $t2
sw $t3, tempo16
lw $t1, tempo15
lw $t2, tempo16
add $t3, $t1, $t2
sw $t3, tempo15
lw $t9, tempo15
lw $t8, tempo14
sw $t8, ($t9)
lw $t9, b2
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
