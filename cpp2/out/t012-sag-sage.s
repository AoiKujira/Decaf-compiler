.data
____true____: .asciiz "true"
____false____: .asciiz "false"
Dog_this: .word 0
ind0: .word 0
tempo0: .word 0
_____0_____: .word 0
tempo1: .word 0
_____4_____: .word 4
tempo2: .word 0
c2: .word 0
tempo3: .word 0
___tempo3___: .word 4
a2: .word 0
tempo4: .word 0
___tempo4___: .word 4
b2: .word 0
tempo5: .word 5
tempo6: .word 0
tempo7: .word 0
tempo8: .word 2
tempo10: .word 0
tempo9: .word 0
tempo11: .word 10
tempo12: .word 0
tempo13: .word 0
tempo14: .word 2
tempo15: .word 0
tempo16: .word 89
tempo18: .word 0
tempo17: .word 0
tempo19: .word 2
tempo21: .word 0
tempo20: .word 0
tempo23: .word 0
tempo22: .word 0

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
lw $t1, Dog_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo0
lw $t9, tempo0
lw $t9, ($t9)
sw $t9, tempo0
lw $t1, _____4_____
lw $t2, ind0
mul $t3, $t1, $t2
sw $t3, tempo1
lw $t1, tempo0
lw $t2, tempo1
add $t3, $t1, $t2
sw $t3, tempo1
lw $t9, tempo1
lw $t9, ($t9)
sw $t9, tempo1
lw $t9, tempo1
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo2
lw $t9, tempo2
sw $t9, c2
lw	$t9, ___tempo3___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo3
lw $t9, tempo3
sw $t9, a2
lw	$t9, ___tempo4___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo4
lw $t9, tempo4
sw $t9, b2
lw $t1, tempo5
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo6
lw $t1, tempo6
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo6
lw	$t9, tempo6
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo6
lw $t9, tempo6
lw $t8, tempo5
sw $t8, ($t9)
lw $t1, tempo6
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo6
lw $t1, a2
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo7
lw $t9, tempo7
lw $t8, tempo6
sw $t8, ($t9)
lw $t1, a2
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo10
lw $t9, tempo10
lw $t9, ($t9)
sw $t9, tempo9
lw $t1, _____4_____
lw $t2, tempo8
mul $t3, $t1, $t2
sw $t3, tempo10
lw $t1, tempo9
lw $t2, tempo10
add $t3, $t1, $t2
sw $t3, tempo9
lw $t9, tempo9
lw $t8, c2
sw $t8, ($t9)
lw $t1, tempo11
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo12
lw $t1, tempo12
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo12
lw	$t9, tempo12
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo12
lw $t9, tempo12
lw $t8, tempo11
sw $t8, ($t9)
lw $t1, tempo12
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo12
lw $t1, b2
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo13
lw $t9, tempo13
lw $t8, tempo12
sw $t8, ($t9)
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo14
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, a2
addi $sp, $sp, -4
sw $t9, ($sp)
jal Dog_return_thing
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo15
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, b2
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo18
lw $t9, tempo18
lw $t9, ($t9)
sw $t9, tempo17
lw $t1, _____4_____
lw $t2, tempo15
mul $t3, $t1, $t2
sw $t3, tempo18
lw $t1, tempo17
lw $t2, tempo18
add $t3, $t1, $t2
sw $t3, tempo17
lw $t9, tempo17
lw $t8, tempo16
sw $t8, ($t9)
lw $t1, a2
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo21
lw $t9, tempo21
lw $t9, ($t9)
sw $t9, tempo20
lw $t1, _____4_____
lw $t2, tempo19
mul $t3, $t1, $t2
sw $t3, tempo21
lw $t1, tempo20
lw $t2, tempo21
add $t3, $t1, $t2
sw $t3, tempo20
lw $t9, tempo20
lw $t9, ($t9)
sw $t9, tempo20
lw $t1, b2
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo23
lw $t9, tempo23
lw $t9, ($t9)
sw $t9, tempo22
lw $t1, _____4_____
lw $t2, tempo20
mul $t3, $t1, $t2
sw $t3, tempo23
lw $t1, tempo22
lw $t2, tempo23
add $t3, $t1, $t2
sw $t3, tempo22
lw $t9, tempo22
lw $t9, ($t9)
sw $t9, tempo22
lw $t9, tempo22
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
