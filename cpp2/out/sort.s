.data
____true____: .asciiz "true"
____false____: .asciiz "false"
___tempo0___: .asciiz  "How many scores? "
tempo0: .word 0
tempo1: .word 0
numScores1: .word 0
tempo2: .word 0
_____4_____: .word 4
arr1: .word 0
tempo3: .word 0
i1: .word 0
tempo4: .word 0
______4_____: .word -4
tempo5: .word 0
___tempo6___: .asciiz  "Enter next number: "
tempo6: .word 0
tempo7: .word 0
num1: .word 0
tempo8: .word 0
tempo9: .word 1
tempo10: .word 0
arr0: .word 0
tempo11: .word 1
i3: .word 0
tempo12: .word 0
tempo13: .word 0
tempo14: .word 1
tempo15: .word 0
j3: .word 0
tempo16: .word 0
val3: .word 0
tempo17: .word 0
tempo18: .word 0
tempo19: .word 0
tempo20: .word 0
tempo21: .word 1
tempo22: .word 0
tempo23: .word 0
tempo24: .word 0
tempo25: .word 1
tempo26: .word 0
tempo27: .word 1
tempo28: .word 0
tempo29: .word 0
tempo30: .word 1
tempo31: .word 0
tempo32: .word 0
i6: .word 0
___tempo33___: .asciiz  "Sorted results: "
tempo33: .word 0
tempo34: .word 0
tempo35: .word 0
tempo36: .word 0
___tempo37___: .asciiz  " "
tempo37: .word 0
tempo38: .word 1
tempo39: .word 0
___tempo40___: .asciiz  "\n"
tempo40: .word 0
___tempo41___: .asciiz  "\nThis program will read in a bunch of numbers and print them\n"
tempo41: .word 0
___tempo42___: .asciiz  "back out in sorted order.\n\n"
tempo42: .word 0
tempo43: .word 0
arr8: .word 0

.text
main:
b ___main___
ReadArray:
la $t9, ___tempo0___
sw $t9, tempo0
lw $t9, tempo0
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo1
lw $t9, tempo1
sw $t9, numScores1
lw $t1, numScores1
lw $t2, _____4_____
mul $t3, $t1, $t2
sw $t3, tempo2
lw $t1, tempo2
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo2
lw	$t9, tempo2
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo2
lw $t9, tempo2
lw $t8, numScores1
sw $t8, ($t9)
lw $t1, tempo2
lw $t2, _____4_____
add $t3, $t1, $t2
sw $t3, tempo2
lw $t9, tempo2
sw $t9, arr1
lw $t9, tempo3
sw $t9, i1
l0:
lw $t9, arr1
sw $t9, tempo4
lw $t1, tempo4
lw $t2, ______4_____
add $t3, $t1, $t2
sw $t3, tempo4
lw $t9, tempo4
lw $t9, ($t9)
sw $t9, tempo4
lw $t1, i1
lw $t2, tempo4
slt $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
beqz $t9, l1
la $t9, ___tempo6___
sw $t9, tempo6
lw $t9, tempo6
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo7
lw $t9, tempo7
sw $t9, num1
lw $t1, _____4_____
lw $t2, i1
mul $t3, $t1, $t2
sw $t3, tempo8
lw $t1, arr1
lw $t2, tempo8
add $t3, $t1, $t2
sw $t3, tempo8
lw $t9, tempo8
lw $t8, num1
sw $t8, ($t9)
lw $t1, i1
lw $t2, tempo9
add $t3, $t1, $t2
sw $t3, tempo10
lw $t9, tempo10
sw $t9, i1
j l0
l1:
lw $t9, arr1
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
Sort:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, arr0
lw $t9, tempo11
sw $t9, i3
l2:
lw $t9, arr0
sw $t9, tempo12
lw $t1, tempo12
lw $t2, ______4_____
add $t3, $t1, $t2
sw $t3, tempo12
lw $t9, tempo12
lw $t9, ($t9)
sw $t9, tempo12
lw $t1, i3
lw $t2, tempo12
slt $t3, $t1, $t2
sw $t3, tempo13
lw $t9, tempo13
beqz $t9, l3
lw $t1, i3
lw $t2, tempo14
sub $t3, $t1, $t2
sw $t3, tempo15
lw $t9, tempo15
sw $t9, j3
lw $t1, _____4_____
lw $t2, i3
mul $t3, $t1, $t2
sw $t3, tempo16
lw $t1, arr0
lw $t2, tempo16
add $t3, $t1, $t2
sw $t3, tempo16
lw $t9, tempo16
lw $t9, ($t9)
sw $t9, tempo16
lw $t9, tempo16
sw $t9, val3
l4:
lw $t1, tempo17
lw $t2, j3
sle $t3, $t1, $t2
sw $t3, tempo18
lw $t9, tempo18
beqz $t9, l5
lw $t1, _____4_____
lw $t2, j3
mul $t3, $t1, $t2
sw $t3, tempo19
lw $t1, arr0
lw $t2, tempo19
add $t3, $t1, $t2
sw $t3, tempo19
lw $t9, tempo19
lw $t9, ($t9)
sw $t9, tempo19
lw $t1, tempo19
lw $t2, val3
sle $t3, $t1, $t2
sw $t3, tempo20
lw $t9, tempo20
beqz $t9, l6
j l5
l6:
lw $t1, j3
lw $t2, tempo21
add $t3, $t1, $t2
sw $t3, tempo22
lw $t1, _____4_____
lw $t2, j3
mul $t3, $t1, $t2
sw $t3, tempo23
lw $t1, arr0
lw $t2, tempo23
add $t3, $t1, $t2
sw $t3, tempo23
lw $t9, tempo23
lw $t9, ($t9)
sw $t9, tempo23
lw $t1, _____4_____
lw $t2, tempo22
mul $t3, $t1, $t2
sw $t3, tempo24
lw $t1, arr0
lw $t2, tempo24
add $t3, $t1, $t2
sw $t3, tempo24
lw $t9, tempo24
lw $t8, tempo23
sw $t8, ($t9)
lw $t1, j3
lw $t2, tempo25
sub $t3, $t1, $t2
sw $t3, tempo26
lw $t9, tempo26
sw $t9, j3
j l4
l5:
lw $t1, j3
lw $t2, tempo27
add $t3, $t1, $t2
sw $t3, tempo28
lw $t1, _____4_____
lw $t2, tempo28
mul $t3, $t1, $t2
sw $t3, tempo29
lw $t1, arr0
lw $t2, tempo29
add $t3, $t1, $t2
sw $t3, tempo29
lw $t9, tempo29
lw $t8, val3
sw $t8, ($t9)
lw $t1, i3
lw $t2, tempo30
add $t3, $t1, $t2
sw $t3, tempo31
lw $t9, tempo31
sw $t9, i3
j l2
l3:
jr $ra
PrintArray:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, arr0
lw $t9, tempo32
sw $t9, i6
la $t9, ___tempo33___
sw $t9, tempo33
lw $t9, tempo33
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
l7:
lw $t9, arr0
sw $t9, tempo34
lw $t1, tempo34
lw $t2, ______4_____
add $t3, $t1, $t2
sw $t3, tempo34
lw $t9, tempo34
lw $t9, ($t9)
sw $t9, tempo34
lw $t1, i6
lw $t2, tempo34
slt $t3, $t1, $t2
sw $t3, tempo35
lw $t9, tempo35
beqz $t9, l8
lw $t1, _____4_____
lw $t2, i6
mul $t3, $t1, $t2
sw $t3, tempo36
lw $t1, arr0
lw $t2, tempo36
add $t3, $t1, $t2
sw $t3, tempo36
lw $t9, tempo36
lw $t9, ($t9)
sw $t9, tempo36
la $t9, ___tempo37___
sw $t9, tempo37
lw $t9, tempo36
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo37
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, i6
lw $t2, tempo38
add $t3, $t1, $t2
sw $t3, tempo39
lw $t9, tempo39
sw $t9, i6
j l7
l8:
la $t9, ___tempo40___
sw $t9, tempo40
lw $t9, tempo40
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
jr $ra
___main___:
la $ra, _____EndOfWorld_____
la $t9, ___tempo41___
sw $t9, tempo41
lw $t9, tempo41
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
la $t9, ___tempo42___
sw $t9, tempo42
lw $t9, tempo42
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
jal ReadArray
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo43
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo43
sw $t9, arr8
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, arr8
addi $sp, $sp, -4
sw $t9, ($sp)
jal Sort
lw $ra, ($sp)
addi $sp, $sp, 4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, arr8
addi $sp, $sp, -4
sw $t9, ($sp)
jal PrintArray
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
