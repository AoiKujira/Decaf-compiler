import getopt
import sys

from lark_test import *


def main(argv):
    inputfile = ''
    outputfile = ''
    try:
        opts, args = getopt.getopt(argv, "hi:o:", ["ifile=", "ofile="])
    except getopt.GetoptError:
        print('main.py -i <inputfile> -o <outputfile>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print('test.py -i <inputfile> -o <outputfile>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg

    with open("tests2/" + inputfile, "r") as input_fil:
        text = input_fil.read()
        pass

    with open("out/" + outputfile, "w") as output_fil:
        check_errors(text, output_fil)


if __name__ == "__main__":
    main(sys.argv[1:])
