.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 3
i1: .word 0
tempo1: .word 0
tempo2: .word 10
tempo3: .word 0
tempo4: .word 2
tempo5: .word 0
tempo6: .word 1
tempo7: .word 0
___tempo8___: .asciiz  "done\n"
tempo8: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t9, tempo0
sw $t9, i1
lw $t9, tempo1
sw $t9, i1
l0:
lw $t1, i1
lw $t2, tempo2
slt $t3, $t1, $t2
sw $t3, tempo3
lw $t9, tempo3
beqz $t9, l2
j l1
l3:
lw $t1, i1
lw $t2, tempo4
mul $t3, $t1, $t2
sw $t3, tempo5
lw $t9, tempo5
sw $t9, i1
j l0
l1:
lw $t9, i1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t1, i1
lw $t2, tempo6
add $t3, $t1, $t2
sw $t3, tempo7
lw $t9, tempo7
sw $t9, i1
j l3
l2:
la $t9, ___tempo8___
sw $t9, tempo8
lw $t9, tempo8
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t9, i1
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
