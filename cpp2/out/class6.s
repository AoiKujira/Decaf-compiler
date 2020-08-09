.data
____true____: .asciiz "true"
____false____: .asciiz "false"
Deck_this: .word 0
___tempo0___: .asciiz  "Shuffle"
tempo0: .word 0
Player_this: .word 0
dj0: .word 0
tempo1: .word 0
_____0_____: .word 0
tempo2: .word 0
tempo3: .word 0
___tempo3___: .word 0
p4: .word 0
tempo4: .word 0
___tempo4___: .word 0

.text
main:
b ___main___
Deck_Shuffle:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Deck_this
la $t9, ___tempo0___
sw $t9, tempo0
lw $t9, tempo0
li	$v0, 4
move	$a0, $t9
syscall

li	$v0, 11
li	$a0, 10
syscall
jr $ra
Player_Init:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Player_this
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, dj0
lw $t1, Player_this
lw $t2, _____0_____
add $t3, $t1, $t2
sw $t3, tempo1
lw $t9, tempo1
lw $t8, dj0
sw $t8, ($t9)
jr $ra
Player_GetDeck:
lw $t9, ($sp)
addi $sp, $sp, 4
sw $t9, Player_this
lw $t1, Player_this
lw $t2, _____0_____
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
lw	$t9, ___tempo3___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo3
lw $t9, tempo3
sw $t9, p4
lw	$t9, ___tempo4___
li	$v0, 9
move	$a0, $t9
syscall
sw $v0, tempo4
addi $sp, $sp, -4
sw $ra, ($sp)
lw $t9, tempo4
addi $sp, $sp, -4
sw $t9, ($sp)
lw $t9, p4
addi $sp, $sp, -4
sw $t9, ($sp)
jal Player_Init
lw $ra, ($sp)
addi $sp, $sp, 4
jr $ra
_____EndOfWorld_____:
li	$v0, 10
syscall
li	$v0, 8
li	$v0, 8
li	$v0, 8
