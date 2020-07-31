
#from lark.visitors import CollapseAmbiguities
from lark import *


def check_errors(text, output_file):
    open_file = open("grammar.txt", "r")
    grammar = open_file.read()
    parser = Lark(grammar, parser='lalr', debug=False)

    try:
        parser.parse(text)
        output_file.write("YES")
    except:
        output_file.write("NO")
    #parser.parse(text)
