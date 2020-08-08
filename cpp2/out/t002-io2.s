.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 0
b1: .word 0
tempo1: .word 1
i1: .word 0
tempo2: .word 1
tempo3: .word 1
tempo4: .word 0
___tempo5___: .asciiz  "Please enter the #"
tempo5: .word 0
___tempo6___: .asciiz  " number:"
tempo6: .word 0
tempo7: .word 0
a1: .word 0
tempo8: .word 0
tempo9: .word 0
tempo10: .word 0
___tempo11___: .asciiz  "Sum of "
tempo11: .word 0
___tempo12___: .asciiz  " items is: "
tempo12: .word 0

.text
main:
j ___main___
___main___:
la $ra, _______End_Of_The_World_______
lw $t9, tempo0
sw $t9, b1
lw $t9, tempo1
sw $t9, i1
l0:
lw $t9, tempo2
beqz $t9, l2
j l1
l3:
lw $t1, i1
lw $t2, tempo3
add $t3, $t1, $t2
sw $t3, tempo4
lw $t9, tempo4
sw $t9, i1
j l0
l1:
la $t9, ___tempo5___
sw $t9, tempo5
la $t9, ___tempo6___
sw $t9, tempo6
lw $t9, tempo5
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, i1
li	$v0, 1
move 	$a0, $t9
syscall
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
sw $t9, a1
lw $t1, a1
lw $t2, tempo8
slt $t3, $t1, $t2
sw $t3, tempo9
lw $t9, tempo9
beqz $t9, l4
j l2
l4:
lw $t1, b1
lw $t2, a1
add $t3, $t1, $t2
sw $t3, tempo10
lw $t9, tempo10
sw $t9, b1
j l3
l2:
la $t9, ___tempo11___
sw $t9, tempo11
la $t9, ___tempo12___
sw $t9, tempo12
lw $t9, tempo11
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, i1
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo12
li	$v0, 4
move	$a0, $t9
syscall

lw $t9, b1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
jr $ra
_______End_Of_The_World_______:
li	$v0, 10
syscall
