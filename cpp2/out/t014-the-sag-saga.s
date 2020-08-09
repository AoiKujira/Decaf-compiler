.data
____true____: .asciiz "true"
____false____: .asciiz "false"
Dog_this: .word 0
ind0: .word 0
tempo0: .word 0
_____0_____: .word 0
tempo1: .word 0
_____4_____: .word 4
Wet_this: .word 0
tempo2: .word 0
_____8_____: .word 8
tempo3: .word 0
c3: .word 0
tempo4: .word 0
___tempo4___: .word 8
a3: .word 0
tempo5: .word 0
___tempo5___: .word 12
b3: .word 0
tempo6: .word 5
tempo7: .word 0
tempo8: .word 0
tempo9: .word 56
tempo10: .word 0
tempo11: .word 5
tempo13: .word 0
tempo12: .word 0
tempo14: .word 10
tempo15: .word 0
tempo16: .word 0
tempo17: .word 2
tempo18: .word 0
tempo19: .word 5
tempo21: .word 0
tempo20: .word 0
tempo22: .word 0
tempo23: .word 0
tempo25: .word 0
tempo24: .word 0

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
Wet_getwetdog:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Wet_this
lw $t1, Wet_this
lw $t2, _____8_____
add $t3, $t1, $t2
sw $t3, tempo2
lw $t9, tempo2
lw $t9, ($t9)
sw $t9, tempo2
lw $t9, tempo2
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo3
lw $t9, tempo3
sw $t9, c3
lw	$t9, ___tempo4___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo4
lw $t9, tempo4
sw $t9, a3
lw	$t9, ___tempo5___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo5
lw $t9, tempo5
sw $t9, b3
lw $t1, tempo6
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo7
lw $t1, tempo7
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo7
lw	$t9, tempo7
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo7
lw $t9, tempo7
lw $t8, tempo6
sw $t8, ($t9)
lw $t1, tempo7
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo7
lw $t1, a3
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo8
lw $t9, tempo8
lw $t8, tempo7
sw $t8, ($t9)
lw $t1, a3
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo10
lw $t9, tempo10
lw $t8, tempo9
sw $t8, ($t9)
lw $t1, a3
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo13
lw $t9, tempo13
lw $t9, ($t9)
sw $t9, tempo12
lw $t1, _____4_____
lw $t2, c3
mul $t3, $t1, $t2
sw $t3, tempo13
lw $t1, tempo12
lw $t2, tempo13
add $t3, $t1, $t2
sw $t3, tempo12
lw $t9, tempo12
lw $t8, tempo11
sw $t8, ($t9)
lw $t1, tempo14
lw $t2, _____8_____
mul $t3, $t1, $t2
sw $t3, tempo15
lw $t1, tempo15
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo15
lw	$t9, tempo15
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo15
lw $t9, tempo15
lw $t8, tempo14
sw $t8, ($t9)
lw $t1, tempo15
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo15
lw $t1, b3
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo16
lw $t9, tempo16
lw $t8, tempo15
sw $t8, ($t9)
lw $t1, b3
lw $t2, _____8_____
add $t3, $t1, $t2
sw $t3, tempo18
lw $t9, tempo18
lw $t8, tempo17
sw $t8, ($t9)
lw $t1, b3
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo21
lw $t9, tempo21
lw $t9, ($t9)
sw $t9, tempo20
lw $t1, _____8_____
lw $t2, tempo19
mul $t3, $t1, $t2
sw $t3, tempo21
lw $t1, tempo20
lw $t2, tempo21
add $t3, $t1, $t2
sw $t3, tempo20
lw $t9, tempo20
lw $t8, a3
sw $t8, ($t9)
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, b3
addi $sp, $sp, -4
sw $t9, ($sp)
jal Wet_getwetdog
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo22
lw $ra, ($sp)
addi $sp, $sp, 4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo22
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, a3
addi $sp, $sp, -4
sw $t9, ($sp)
jal Dog_return_thing
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo23
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, b3
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo25
lw $t9, tempo25
lw $t9, ($t9)
sw $t9, tempo24
lw $t1, _____8_____
lw $t2, tempo23
mul $t3, $t1, $t2
sw $t3, tempo25
lw $t1, tempo24
lw $t2, tempo25
add $t3, $t1, $t2
sw $t3, tempo24
lw $t9, tempo24
lw $t9, ($t9)
sw $t9, tempo24
lw $t9, tempo24
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
