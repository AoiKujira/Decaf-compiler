.data
____true____: .asciiz "true"
____false____: .asciiz "false"
x0: .word 0
tempo0: .word 2
tempo1: .word 0
tempo2: .word 1
___tempo3___: .asciiz  "  "
tempo3: .word 0
tempo4: .word 1
tempo5: .word 0
tempo7: .word 0
tempo8: .word 2
tempo9: .word 0
tempo11: .word 0
tempo12: .word 1
tempo13: .word 0
tempo15: .word 0
tempo16: .word 2
tempo17: .word 0
tempo19: .word 0
tempo20: .word 0
tempo21: .word 3
tempo23: .word 0
tempo24: .word 6
tempo26: .word 0

.text
main:
b ___main___
f:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, x0
lw $t1, x0
lw $t2, tempo0
sle $t3, $t1, $t2
sw $t3, tempo1
lw $t9, tempo1
beqz $t9, l0
lw $t9, tempo2
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
l0:
la $t9, ___tempo3___
sw $t9, tempo3
lw $t9, x0
li	$v0, 1
move 	$a0, $t9
syscall
lw $t9, tempo3
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t1, x0
lw $t2, tempo4
sub $t3, $t1, $t2
sw $t3, tempo5
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo5
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo7
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo7
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t1, x0
lw $t2, tempo8
sub $t3, $t1, $t2
sw $t3, tempo9
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo9
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo11
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo11
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
lw $t1, x0
lw $t2, tempo12
sub $t3, $t1, $t2
sw $t3, tempo13
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo13
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo15
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, x0
lw $t2, tempo16
sub $t3, $t1, $t2
sw $t3, tempo17
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo17
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo19
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t1, tempo15
lw $t2, tempo19
add $t3, $t1, $t2
sw $t3, tempo20
lw $t9, tempo20
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo21
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo23
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo23
li	$v0, 1
move 	$a0, $t9
syscall
li	$v0, 11
li	$a0, 10
syscall
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo24
addi $sp, $sp, -4
sw $t9, ($sp)
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo26
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo26
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
