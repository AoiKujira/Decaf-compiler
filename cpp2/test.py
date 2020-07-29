import lark_test
from lark import Lark

from transformer import Test

from Symbols import SymbolTable

if __name__ == "__main__":
    input_file = open("tests/t002-class2.in", "r")
    # input_file = open("tests/t014-stmt1.in", "r")
    # output_file = open("outputfile.txt", "w")
    text = input_file.read()
    # lark_test.check_errors(text, output_file)
    open_file = open("grammar.txt", "r")
    grammar = open_file.read()
    parser = Lark(grammar, parser='lalr', debug=False)
    tree = parser.parse(text)
    trans = Test()
    sym = SymbolTable()
    trans.transform(tree)
    print(trans.code)
    while not (sym.has_finished):
        print("doing the thing")
        sym.prep()
        sym.transform(tree)
    print(sym.classes["A"].var_offsets)
    # print(tree.pretty())
