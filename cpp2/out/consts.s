.data
____true____: .asciiz "true"
____false____: .asciiz "false"
tempo0: .word 41637
tempo1: .word 4853
tempo2: .word 2730
tempo3: .word 0
______1_____: .word -1
tempo4: .word 1234
tempo5: .float 12.0
tempo6: .float 1220.0
tempo7: .float 0.122
tempo8: .float 1200.0
tempo9: .float 1220.0
tempo10: .float 1200.0

.text
main:
b ___main___
___main___:
la $ra, _____EndOfWorld_____
lw $t9, tempo0
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo1
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t1, ______1_____
lw $t2, tempo2
mul $t3, $t1, $t2
sw $t3, tempo3
lw $t9, tempo3
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo4
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
l.s $f9, tempo5
li	$v0, 2
mov.s 	$f12, $f9
syscall
li	$v0, 11
li	$a0, 10
syscall
l.s $f9, tempo6
li	$v0, 2
mov.s 	$f12, $f9
syscall
li	$v0, 11
li	$a0, 10
syscall
l.s $f9, tempo7
li	$v0, 2
mov.s 	$f12, $f9
syscall
li	$v0, 11
li	$a0, 10
syscall
l.s $f9, tempo8
li	$v0, 2
mov.s 	$f12, $f9
syscall
li	$v0, 11
li	$a0, 10
syscall
l.s $f9, tempo9
li	$v0, 2
mov.s 	$f12, $f9
syscall
li	$v0, 11
li	$a0, 10
syscall
l.s $f9, tempo10
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
