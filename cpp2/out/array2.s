.data
____true____: .asciiz "true"
____false____: .asciiz "false"
x0: .word 0
tempo0: .word 4
tempo1: .word 0
_____4_____: .word 4
tempo2: .word 5
tempo3: .word 0
tempo4: .word 0
______4_____: .word -4
size0: .word 0
tempo5: .word 0
b2: .word 0
tempo6: .word 0
tempo7: .word 5
tempo8: .word 0
tempo9: .word 10
tempo10: .word 0
y3: .word 0
tempo11: .word 4
tempo12: .word 3
tempo13: .word 0
tempo14: .word 5
tempo15: .word 4
tempo16: .word 0
tempo18: .word 10
tempo19: .word 0
b3: .word 0
tempo20: .word 0
tempo21: .word 0
tempo22: .word 0
tempo23: .word 5
tempo26: .word 0
tempo25: .word 0

.text
main:
b ___main___
TakeArray:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, x0
lw $t1, _____4_____
lw $t2, tempo0
mul $t3, $t1, $t2
sw $t3, tempo1
lw $t1, x0
lw $t2, tempo1
add $t3, $t1, $t2
sw $t3, tempo1
lw $t9, tempo1
lw $t9, ($t9)
sw $t9, tempo1
lw $t1, _____4_____
lw $t2, tempo2
mul $t3, $t1, $t2
sw $t3, tempo3
lw $t1, x0
lw $t2, tempo3
add $t3, $t1, $t2
sw $t3, tempo3
lw $t9, tempo3
lw $t9, ($t9)
sw $t9, tempo3
lw $t9, x0
sw $t9, tempo4
lw $t1, tempo4
lw $t2, ______4_____
add $t3, $t1, $t2
sw $t3, tempo4
lw $t9, tempo4
lw $t9, ($t9)
sw $t9, tempo4
lw $t9, tempo1
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo3
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo4
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
MakeArray:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, size0
lw $t1, size0
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo5
lw $t1, tempo5
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo5
lw	$t9, tempo5
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo5
lw $t9, tempo5
lw $t8, size0
sw $t8, ($t9)
lw $t1, tempo5
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
sw $t9, b2
lw $t1, _____4_____
lw $t2, tempo6
mul $t3, $t1, $t2
sw $t3, tempo8
lw $t1, b2
lw $t2, tempo8
add $t3, $t1, $t2
sw $t3, tempo8
lw $t9, tempo8
lw $t8, tempo7
sw $t8, ($t9)
lw $t9, b2
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
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
lw $t9, tempo10
sw $t9, y3
lw $t1, _____4_____
lw $t2, tempo11
mul $t3, $t1, $t2
sw $t3, tempo13
lw $t1, y3
lw $t2, tempo13
add $t3, $t1, $t2
sw $t3, tempo13
lw $t9, tempo13
lw $t8, tempo12
sw $t8, ($t9)
lw $t1, _____4_____
lw $t2, tempo14
mul $t3, $t1, $t2
sw $t3, tempo16
lw $t1, y3
lw $t2, tempo16
add $t3, $t1, $t2
sw $t3, tempo16
lw $t9, tempo16
lw $t8, tempo15
sw $t8, ($t9)
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, y3
addi $sp, $sp, -4
sw $t9, ($sp)
jal TakeArray
lw $ra, ($sp)
addi $sp, $sp, 4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo18
addi $sp, $sp, -4
sw $t9, ($sp)
jal MakeArray
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo19
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo19
sw $t9, b3
lw $t1, _____4_____
lw $t2, tempo20
mul $t3, $t1, $t2
sw $t3, tempo21
lw $t1, b3
lw $t2, tempo21
add $t3, $t1, $t2
sw $t3, tempo21
lw $t9, tempo21
lw $t9, ($t9)
sw $t9, tempo21
lw $t9, b3
sw $t9, tempo22
lw $t1, tempo22
lw $t2, ______4_____
add $t3, $t1, $t2
sw $t3, tempo22
lw $t9, tempo22
lw $t9, ($t9)
sw $t9, tempo22
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo23
addi $sp, $sp, -4
sw $t9, ($sp)
jal MakeArray
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo26
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo26
sw $t9, tempo25
lw $t1, tempo25
lw $t2, ______4_____
add $t3, $t1, $t2
sw $t3, tempo25
lw $t9, tempo25
lw $t9, ($t9)
sw $t9, tempo25
lw $t9, tempo21
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo22
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo25
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
