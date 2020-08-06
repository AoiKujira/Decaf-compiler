#gets a TAC like string input and outputs a MIPS code
'''
u better go to page 54 of SPIM_Manual.pdf contains mips manual too
there are also instructions for double and single
================================================================================
-----------assign----------
//constant
assign a f= 1.2
assign a i= 12
assign a s= "fwrefwerf"
assign a b= false
//regular
assign a = b
assign *(a) = b
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
ReadInt t = ReadInt()
ReadLine t = ReadLine()
---------------------

'''
def mipsGen(input_code):
    vars = {}
    instructions = input_code.split('\n')
    mipsDataCode = '.data\n'
    mipsTextCode = '.text\nglobl main\n'
    mipsTextCode += '################ MACROS ################\n'
    mipsTextCode += '.macro read_int($dReg)\nli	$v0, 5\nsyscall\nmove	$dReg, $v0\n.end_macro\n'
    mipsTextCode += '.macro read_string($string_address)\nli	$v0, 8\nli	$a1, 1000  #MAX_SIZE==999\nmove	$a0, $string_address\nsyscall\n.end_macro\n'
    mipsTextCode += '.macro print_int($reg)\nli	$v0, 1\nmove 	$a0, $reg\nsyscall\n.end_macro\n'
    mipsTextCode += '.macro print_double($reg)\nli	$v0, 3\nmove 	$f12, $reg\nsyscall\n.end_macro\n'
    mipsTextCode += '.macro	print_string($string_address)\nli	$v0, 4\nmove	$a0, $string_address\nsyscall\n.end_macro\n'
    mipsTextCode += '########################################\n'
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
        if instruction[0] == 'assign':#assign a f= 1.2
            if instruction[2] == 'f=':
                if instruction[1] in vars.keys():
                    vars[instruction[1]] += 1
                    instruction[1] += '___' + vars[instruction[1]]
                mipsDataCode += instruction[1] + ': ' + '.double ' + instruction[3] + '\n'
                vars[instruction[1]] = 0
            if instruction[2] == 'i=':#assign a i= 12
                if instruction[1] in vars.keys():
                    vars[instruction[1]] += 1
                    instruction[1] += '___' + vars[instruction[1]]
                mipsDataCode += instruction[1] + ': ' + '.word ' + instruction[3] + '\n'
                vars[instruction[1]] = 0
            if instruction[2] == 's=':#assign a s= "fwrefwerf"
                if instruction[1] in vars.keys():
                    vars[instruction[1]] += 1
                    instruction[1] += '___' + vars[instruction[1]]
                mipsDataCode += instruction[1] + ': ' + '.asciiz ' + instruction[3] + '\n'
                vars[instruction[1]] = 0
            if instruction[2] == 'b=':#assign a b= false
                mipsDataCode += instruction[1] + ': ' + '.word\n'
            if instruction[2] == '=':#assign t1 = t2
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
        if instruction[0] == 'ReadInt':#ReadInt t = ReadInt()
            mipsDataCode += instruction[1] + ': ' + '.word\n'
            mipsTextCode += 'read_int($t9)\n'
            mipsTextCode += 'sw $t9, ' + instruction[1] + '\n'
        if instruction[0] == 'ReadLine':#ReadLine t = ReadLine()
            mipsDataCode += instruction[1] + ': ' + '.asciiz\n'
            mipsTextCode += 'la $t9, ' + instruction[1] + '\n'
            mipsTextCode += 'read_string($t9)\n'
        if instruction[0] == '':
            pass
        if instruction[0] == '':
            pass

    return '=============mipsGen under construction===============\n' + mipsDataCode + '\n' + mipsTextCode
