.data
____true____: .asciiz "true"
____false____: .asciiz "false"
___tempo0___: .asciiz  "h"
tempo0: .word 0
tempo1: .word 1
___tempo2___: .asciiz  "g"
tempo2: .word 0
tempo3: .word 0
tempo4: .word 1
___tempo5___: .asciiz  "f"
tempo5: .word 0
tempo6: .word 0
tempo7: .word 0
tempo8: .word 3
tempo9: .word 0
tempo10: .word 0
tempo11: .word 0

.text
main:
b ___main___
h:
la $t9, ___tempo0___
sw $t9, tempo0
lw $t9, tempo0
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
lw $t9, tempo1
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
g:
la $t9, ___tempo2___
sw $t9, tempo2
lw $t9, tempo2
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
jal h
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo3
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo4
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
f:
la $t9, ___tempo5___
sw $t9, tempo5
lw $t9, tempo5
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
jal g
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo6
lw $ra, ($sp)
addi $sp, $sp, 4
jal h
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo7
lw $ra, ($sp)
addi $sp, $sp, 4
lw $t9, tempo8
addi $sp, $sp, -4
sw $t9, ($sp)
jr $ra
jr $ra
___main___:
la $ra, _____EndOfWorld_____
jal f
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo9
lw $ra, ($sp)
addi $sp, $sp, 4
jal g
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo10
lw $ra, ($sp)
addi $sp, $sp, 4
jal h
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, tempo11
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
