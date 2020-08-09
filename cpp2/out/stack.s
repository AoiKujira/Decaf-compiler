.data
____true____: .asciiz "true"
____false____: .asciiz "false"
Stack_this: .word 0
tempo0: .word 100
tempo1: .word 0
_____4_____: .word 4
tempo13: .word 0
tempo2: .word 0
tempo14: .word 0
_____0_____: .word 0
tempo3: .word 3
i0: .word 0
tempo15: .word 0
tempo5: .word 0
tempo16: .word 0
tempo6: .word 1
tempo17: .word 0
tempo7: .word 0
tempo18: .word 0
tempo8: .word 1
tempo19: .word 0
tempo9: .word 0
tempo10: .word 0
tempo20: .word 0
val3: .word 0
tempo11: .word 1
tempo21: .word 0
tempo12: .word 0
tempo22: .word 0
tempo23: .word 0
tempo24: .word 0
___tempo24___: .word 8
s5: .word 0
tempo26: .word 3
tempo28: .word 7
tempo30: .word 4
tempo32: .word 0
___tempo33___: .asciiz  " "
tempo33: .word 0
tempo34: .word 0
___tempo35___: .asciiz  " "
tempo35: .word 0
tempo36: .word 0
___tempo37___: .asciiz  " "
tempo37: .word 0
tempo38: .word 0
___tempo39___: .asciiz  " "
tempo39: .word 0
tempo40: .word 0

.text
main:
b ___main___
Stack_Init:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Stack_this
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
lw $t1, Stack_this
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo13
lw $t9, tempo13
lw $t8, tempo1
sw $t8, ($t9)
lw $t1, Stack_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo14
lw $t9, tempo14
lw $t8, tempo2
sw $t8, ($t9)
lw $t9, tempo3
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
Stack_Push:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Stack_this
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, i0
lw $t1, Stack_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo15
lw $t9, tempo15
lw $t9, ($t9)
sw $t9, tempo15
lw $t1, _____4_____
lw $t2, tempo15
mul $t3, $t1, $t2
sw $t3, tempo5
lw $t1, Stack_this
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo16
lw $t9, tempo16
lw $t9, ($t9)
sw $t9, tempo16
lw $t1, tempo16
lw $t2, tempo5
add $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
lw $t8, i0
sw $t8, ($t9)
lw $t1, Stack_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo17
lw $t9, tempo17
lw $t9, ($t9)
sw $t9, tempo17
lw $t1, tempo17
lw $t2, tempo6
add $t3, $t1, $t2
sw $t3, tempo7
lw $t1, Stack_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo18
lw $t9, tempo18
lw $t8, tempo7
sw $t8, ($t9)
jr $ra
Stack_Pop:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Stack_this
lw $t1, Stack_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo19
lw $t1, *(tempo19)
lw $t2, tempo8
sub $t3, $t1, $t2
sw $t3, tempo9
lw $t1, _____4_____
lw $t2, tempo9
mul $t3, $t1, $t2
sw $t3, tempo10
lw $t1, Stack_this
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo20
lw $t9, tempo20
lw $t9, ($t9)
sw $t9, tempo20
lw $t1, tempo20
lw $t2, tempo10
add $t3, $t1, $t2
sw $t3, tempo10
lw $t9, tempo10
lw $t9, ($t9)
sw $t9, tempo10
lw $t9, tempo10
sw $t9, val3
lw $t1, Stack_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo21
lw $t1, *(tempo21)
lw $t2, tempo11
sub $t3, $t1, $t2
sw $t3, tempo12
lw $t1, Stack_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo22
lw $t9, tempo22
lw $t8, tempo12
sw $t8, ($t9)
lw $t9, val3
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
Stack_NumElems:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Stack_this
lw $t1, Stack_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo23
lw $t9, tempo23
lw $t9, ($t9)
sw $t9, tempo23
lw $t9, tempo23
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
lw	$t9, ___tempo24___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo24
lw $t9, tempo24
sw $t9, s5
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, s5
addi $sp, $sp, -4
sw $t9, ($sp)
jal Stack_Init
lw $ra, ($sp)
addi $sp, $sp, 4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo26
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, s5
addi $sp, $sp, -4
sw $t9, ($sp)
jal Stack_Push
lw $ra, ($sp)
addi $sp, $sp, 4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo28
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, s5
addi $sp, $sp, -4
sw $t9, ($sp)
jal Stack_Push
lw $ra, ($sp)
addi $sp, $sp, 4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo30
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, s5
addi $sp, $sp, -4
sw $t9, ($sp)
jal Stack_Push
lw $ra, ($sp)
addi $sp, $sp, 4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, s5
addi $sp, $sp, -4
sw $t9, ($sp)
jal Stack_NumElems
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo32
lw $ra, ($sp)
addi $sp, $sp, 4
la $t9, ___tempo33___
sw $t9, tempo33
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, s5
addi $sp, $sp, -4
sw $t9, ($sp)
jal Stack_Pop
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo34
lw $ra, ($sp)
addi $sp, $sp, 4
la $t9, ___tempo35___
sw $t9, tempo35
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, s5
addi $sp, $sp, -4
sw $t9, ($sp)
jal Stack_Pop
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo36
lw $ra, ($sp)
addi $sp, $sp, 4
la $t9, ___tempo37___
sw $t9, tempo37
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, s5
addi $sp, $sp, -4
sw $t9, ($sp)
jal Stack_Pop
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo38
lw $ra, ($sp)
addi $sp, $sp, 4
la $t9, ___tempo39___
sw $t9, tempo39
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, s5
addi $sp, $sp, -4
sw $t9, ($sp)
jal Stack_NumElems
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo40
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo32
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo33
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, tempo34
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo35
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, tempo36
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo37
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, tempo38
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo39
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, tempo40
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
