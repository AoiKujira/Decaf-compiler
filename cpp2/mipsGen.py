#gets a TAC like string input and outputs a MIPS code
'''
u better go to page 54 of SPIM_Manual.pdf contains mips manual too
there are also instructions for double and single
================================================================================
-----------assign----------
//constant
assign a f= b
assign a i= b
assign a s= b
assign a b= b
//regular
assign a = b
assign a = allocate 6
assign a = allocate t [panics]
----------arith-------------
arith a = b f+ c
arith a = b + c
arith a = b f* c
arith a = b * c
arith a = b f/ c
arith a = b / c
arith a = b f- c
arith a = b - c
arith a = b % c
arith a = b == c
arith a = b != c
arith a = b <= c
arith a = b < c
----------------------
push lable
pop lable
Lcall lable
Lable lable:
return
print lable
readInt()
readLine()
---------------------

'''
def mipsGen(input_code):
    instructions = input_code.split('\n')
    mipsDataCode = '.data\n'
    mipsTextCode = '.text\nglobl main\n'
    mipsTextCode += '.macro read_int($dReg)\nli	$v0, 5\nsyscall\nmove	$dReg, $v0\n.end_macro\n'
    mipsTextCode += '.macro read_string($string_address)\nli	$v0, 8\nli	$a1, 1000\nmove	$a0, $string_address\nsyscall\n.end_macro\n'
    mipsTextCode += '.macro print_int($reg)\nli	$v0, 1\nmove 	$a0, $reg\nsyscall\n.end_macro\n'
    mipsTextCode += '.macro print_double($reg)\nli	$v0, 3\nmove 	$f12, $reg\nsyscall\n.end_macro\n'
    mipsTextCode += '.macro	print_string($string_address)\nli	$v0, 4\nmove	$a0, $string_address\nsyscall\n.end_macro\n'
    for instruction in instructions:
        if instruction == '':
            continue
        mipsTextCode += '#' + instruction + '\n'
        instruction = instruction.split()
        if instruction[0] == 'arith':#arith a = b Xop c
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
        if instruction[0] == 'assign':#assign a f= b
            if instruction[2] == 'f=':
                mipsDataCode += instruction[1] + ': ' + '.double\n'
            if instruction[2] == 'i=':
                mipsDataCode += instruction[1] + ': ' + '.word\n'
            if instruction[2] == 's=':
                pass
                # mipsDataCode += instruction[1] + ': ' + '.asciiz\n'
                # mipsTextCode += instruction[1] + ': ' + '.asciiz \"' + instruction[3] + '\"\n'
            if instruction[2] == 'b=':
                mipsDataCode += instruction[1] + ': ' + '.byte\n'
            if instruction[2] == '=':
                if instruction[1][0] == '*':
                    pass
                else:
                    pass
        if instruction[0] == 'getAddress':
            pass
        if instruction[0] == 'return':
            pass
        if instruction[0] == 'Allocate':
            pass
        if instruction[0] == '':
            pass
    return '=============mipsGen under construction===============\n' + mipsDataCode + '\n' + mipsTextCode
