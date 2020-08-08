import lark_test
from lark import Lark

from transformer import Test
from mipsGen import mipsGen
from Symbols import SymbolTable

if __name__ == "__main__":
    # t031
    input_file = open("tests2/t003-expr1.d", "r")
    # input_file = open("tests/t092while4.in", "r")
    # output_file = open("outputfile.txt", "w")
    text = input_file.read()
    # lark_test.check_errors(text, output_file)
    open_file = open("grammar.txt", "r")
    grammar = open_file.read()
    parser = Lark(grammar, parser='lalr', debug=False)
    tree = parser.parse(text)
    # print(tree.pretty())
    sym = SymbolTable()
    while not (sym.has_finished):
        # print("doing the thing")
        sym.prep()
        sym.transform(tree)
    #print(sym.classes["Sag"].var_offsets)
    trans = Test(sym)
    trans.transform(tree)
    # print(trans.var_types)
    for k, v in trans.var_types.items():
        print(k, v)
    print(trans.code)
    #print(mipsGen(trans.code))
    # print(mipsGen(trans.code))
    # print(sym.classes["A"].var_offsets)
