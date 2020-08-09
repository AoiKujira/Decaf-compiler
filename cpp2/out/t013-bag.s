.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 0
count1: .word 0
tempo1: .word 5
tempo2: .word 0
tempo3: .word 0
d1: .word 0
tempo4: .word 2
tempo5: .word 0
______1_____: .word -1
tempo6: .word 0
___tempo7___: .asciiz  "sag"
tempo7: .word 0
tempo8: .word 1
tempo9: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo0
lw $t9, tempo0
sw $t9, count1
lw $t1, tempo1
lw $t2, count1
mul $t3, $t1, $t2
sw $t3, tempo2
l.s $f9, tempo2
cvt.s.w $f9, $f9
s.s $f9, tempo3
lw $t9, tempo3
sw $t9, d1
l0:
lw $t1, ______1_____
lw $t2, tempo4
mul $t3, $t1, $t2
sw $t3, tempo5
lw $t1, tempo5
lw $t2, count1
slt $t3, $t1, $t2
sw $t3, tempo6
lw $t9, tempo6
beqz $t9, l1
la $t9, ___tempo7___
sw $t9, tempo7
lw $t9, tempo7
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, count1
lw $t2, tempo8
sub $t3, $t1, $t2
sw $t3, tempo9
lw $t9, tempo9
sw $t9, count1
j l0
l1:
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
