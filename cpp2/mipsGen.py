#gets a TAC like string input and outputs a MIPS code
'''
u better go to page 54 of SPIM_Manual.pdf
there are instructions for double and single
================================================================================
move       d, s1         d = s1;
add        d, s1, s2     d = s1 + s2; two's complement
sub        d, s1, s2     d = s1 - s2; two's complement
mul        d, s1, s2     d = s1 * s2; two's complement
div        d, s1, s2     d = s1 / s2;  gives quotient
rem        d, s1, s2     d = s1 % s2;  gives remainder
and        d, s1, s2     d = s1 & s2; bitwise AND
or         d, s1, s2     d = s1 | s2; bitwise OR
not        d, s1         d = ~s1;  bitwise complement
nand       d, s1, s2     d = s1 NAND s2; no C equivalent
nor        d, s1, s2     d = s1 NOR s2; no C equivalent
xor        d, s1, s2     d = s1 ^ s2; bitwise XOR
rol        d, s1, s2     d = rotate left of s1 by s2 places
ror        d, s1, s2     d = rotate right of s1 by s2 places
sll        d, s1, s2     d = logical left shift of s1 by s2 places
sra        d, s1, s2     d = arithmetic right shift of s1 by s2 places
srl        d, s1, s2     d = logical right shift of s1 by s2 places
----------------------
d is always a register.
s2 can be be a register or an immediate (a constant in the machine code)
================================================================================
lw         d, addr       a word is loaded from addr and placed into d;
                         the addr must be word aligned
lb         d, addr       a byte is loaded from addr and placed into
                         the rightmost byte of d;
                         sign extension defines the other bits of d
lbu        d, addr       a byte is loaded from addr and placed into
                         the rightmost byte of d;
                         zero extension defines the other bits of d
li         d, immed      the immediate value is placed into d
sw         d, addr       a word in d is stored to addr;
                         the addr must be word aligned
sb         d, addr       a byte in the rightmost byte of d is stored to addr
la         d, label      the address assigned to label is placed into d
-----------------------
addr is specified within the source code in one of 3 ways:
    1.displacement(reg)
        The immediate value (displacement) is added to the contents of the reg to form an effective address.
    2.(reg)
        The contents of the reg is the address.
    3.label
        The address is as assigned to label.
d must be a register specification
================================================================================
b          label           unconditional branch to label
beq        r1, r2, label   branch to label if (r1) == (r2)
bne        r1, r2, label   branch to label if (r1) != (r2)
bgt        r1, r2, label   branch to label if (r1) > (r2)
bge        r1, r2, label   branch to label if (r1) >= (r2)
blt        r1, r2, label   branch to label if (r1) < (r2)
ble        r1, r2, label   branch to label if (r1) <= (r2)
beqz       r1, label       branch to label if (r1) == 0
bnez       r1, label       branch to label if (r1) != 0
bgtz       r1, label       branch to label if (r1) > 0
bgez       r1, label       branch to label if (r1) >= 0
bltz       r1, label       branch to label if (r1) < 0
blez       r1, label       branch to label if (r1) <= 0

j          label           unconditional jump to label
jal        label           unconditional jump to label, return address in $31
================================================================================
'''
def mipsGen(input_code):
    instructions = input_code.split('\n')
    mipsCode = ''
    for instruction in instructions:
        if instruction == '':
            continue
        mipsCode += '#' + instruction + '\n'
        instruction = instruction.split()
        if instruction[0] == 'intArithmetic':#intArithmetic x = y op z
            if instruction[4] == '+':#add
                pass
            if instruction[4] == '-':#sub
                pass
            if instruction[4] == '*':#mul
                pass
            if instruction[4] == '/':#div
                pass
            if instruction[4] == '%':#rem
                pass
            if instruction[4] == '==':#seq
                pass
            if instruction[4] == '!=':#snq
                pass
            if instruction[4] == '<':#slt
                pass
            if instruction[4] == '<=':#sle
                pass
            if instruction[4] == '||':#
                pass
            if instruction[4] == '&&':#
                pass
        if instruction[0] == 'Lable':#lable a:
            pass
        #what options are there?
        if instruction[0] == 'push':#push a
            pass
        #what options are there?
        if instruction[0] == 'pop':#pop a
            pass
        if instruction[0] == 'Lcall':#Lcall lable
            pass
        #what options are there?
        if instruction[0] == 'Print':#Print a
            pass
        if instruction[0] == 'assignment':
            pass
        if instruction[0] == 'getAddress':
            pass
        if instruction[0] == 'return':
            pass
        if instruction[0] == 'Allocate':
            pass
        if instruction[0] == '':
            pass
    return '=============mipsGen under construction===============\n' + mipsCode
