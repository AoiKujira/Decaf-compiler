.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 10
tempo1: .word 0
_____4_____: .word 4
b1: .word 0
tempo2: .word 20
tempo3: .word 0
c1: .word 0
tempo4: .word 3
tempo5: .word 0
s1: .word 0
tempo6: .word 3
tempo7: .word 5
tempo8: .word 0
tempo9: .word 6
tempo10: .word 1
tempo11: .word 0
d1: .word 0
tempo12: .word 2
___tempo13___: .asciiz  "hello"
tempo13: .word 0
tempo14: .word 0
tempo15: .word 3
tempo16: .word 0
tempo17: .word 0
______4_____: .word -4
___tempo18___: .asciiz  "\n"
tempo18: .word 0
tempo19: .word 6
tempo20: .word 0
tempo21: .word 0
___tempo22___: .asciiz  "\n"
tempo22: .word 0
tempo23: .word 3
tempo24: .word 0
tempo25: .word 0
___tempo26___: .asciiz  "\n"
tempo26: .word 0
tempo27: .word 2
tempo28: .word 0
tempo29: .word 0
___tempo30___: .asciiz  "\n"
tempo30: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t1, tempo0
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo1
lw $t1, tempo1
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo1
lw	$t9, tempo1
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo1
lw $t9, tempo1
lw $t8, tempo0
sw $t8, ($t9)
lw $t1, tempo1
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo1
lw $t9, tempo1
sw $t9, b1
lw $t1, tempo2
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo3
lw $t1, tempo3
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo3
lw	$t9, tempo3
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo3
lw $t9, tempo3
lw $t8, tempo2
sw $t8, ($t9)
lw $t1, tempo3
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo3
lw $t9, tempo3
sw $t9, c1
lw $t1, tempo4
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
lw $t8, tempo4
sw $t8, ($t9)
lw $t1, tempo5
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
sw $t9, s1
lw $t1, _____4_____
lw $t2, tempo6
mul $t3, $t1, $t2
sw $t3, tempo8
lw $t1, b1
lw $t2, tempo8
add $t3, $t1, $t2
sw $t3, tempo8
lw $t9, tempo8
lw $t8, tempo7
sw $t8, ($t9)
lw $t1, _____4_____
lw $t2, tempo9
mul $t3, $t1, $t2
sw $t3, tempo11
lw $t1, c1
lw $t2, tempo11
add $t3, $t1, $t2
sw $t3, tempo11
lw $t9, tempo11
lw $t8, tempo10
sw $t8, ($t9)
lw $t9, b1
sw $t9, d1
la $t9, ___tempo13___
sw $t9, tempo13
lw $t1, _____4_____
lw $t2, tempo12
mul $t3, $t1, $t2
sw $t3, tempo14
lw $t1, s1
lw $t2, tempo14
add $t3, $t1, $t2
sw $t3, tempo14
lw $t9, tempo14
lw $t8, tempo13
sw $t8, ($t9)
lw $t1, _____4_____
lw $t2, tempo15
mul $t3, $t1, $t2
sw $t3, tempo16
lw $t1, b1
lw $t2, tempo16
add $t3, $t1, $t2
sw $t3, tempo16
lw $t9, tempo16
lw $t9, ($t9)
sw $t9, tempo16
lw $t9, b1
sw $t9, tempo17
lw $t1, tempo17
lw $t2, ______4_____
add $t3, $t1, $t2
sw $t3, tempo17
lw $t9, tempo17
lw $t9, ($t9)
sw $t9, tempo17
la $t9, ___tempo18___
sw $t9, tempo18
lw $t9, tempo16
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo17
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo18
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, _____4_____
lw $t2, tempo19
mul $t3, $t1, $t2
sw $t3, tempo20
lw $t1, c1
lw $t2, tempo20
add $t3, $t1, $t2
sw $t3, tempo20
lw $t9, tempo20
lw $t9, ($t9)
sw $t9, tempo20
lw $t9, c1
sw $t9, tempo21
lw $t1, tempo21
lw $t2, ______4_____
add $t3, $t1, $t2
sw $t3, tempo21
lw $t9, tempo21
lw $t9, ($t9)
sw $t9, tempo21
la $t9, ___tempo22___
sw $t9, tempo22
lw $t9, tempo20
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
lw $t9, tempo21
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo22
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, _____4_____
lw $t2, tempo23
mul $t3, $t1, $t2
sw $t3, tempo24
lw $t1, d1
lw $t2, tempo24
add $t3, $t1, $t2
sw $t3, tempo24
lw $t9, tempo24
lw $t9, ($t9)
sw $t9, tempo24
lw $t9, d1
sw $t9, tempo25
lw $t1, tempo25
lw $t2, ______4_____
add $t3, $t1, $t2
sw $t3, tempo25
lw $t9, tempo25
lw $t9, ($t9)
sw $t9, tempo25
la $t9, ___tempo26___
sw $t9, tempo26
lw $t9, tempo24
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo25
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo26
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, _____4_____
lw $t2, tempo27
mul $t3, $t1, $t2
sw $t3, tempo28
lw $t1, s1
lw $t2, tempo28
add $t3, $t1, $t2
sw $t3, tempo28
lw $t9, tempo28
lw $t9, ($t9)
sw $t9, tempo28
lw $t9, s1
sw $t9, tempo29
lw $t1, tempo29
lw $t2, ______4_____
add $t3, $t1, $t2
sw $t3, tempo29
lw $t9, tempo29
lw $t9, ($t9)
sw $t9, tempo29
la $t9, ___tempo30___
sw $t9, tempo30
lw $t9, tempo28
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, tempo29
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo30
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
