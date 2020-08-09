.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 123
a1: .word 0
tempo1: .float 1.124
b1: .word 0
___tempo2___: .asciiz  " "
tempo2: .word 0
tempo3: .word 0
tempo4: .word 0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t9, tempo0
sw $t9, a1
lw $t9, tempo1
sw $t9, b1
la $t9, ___tempo2___
sw $t9, tempo2
lw $t9, a1
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo2
li	$v0, 4
move	$a0, $t9
syscall

l.s $f9, b1
li	$v0, 2
mov.s 	$f12, $f9
syscall
li	$v0, 11
li	$a0, 10
syscall
li	$v0, 5
syscall
move	$t9, $v0
sw $t9, tempo3
lw $t9, tempo3
sw $t9, a1
lw $t9, a1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
l.s $f9, a1
cvt.s.w $f9, $f9
s.s $f9, tempo4
lw $t9, tempo4
sw $t9, b1
l.s $f9, b1
li	$v0, 2
mov.s 	$f12, $f9
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
