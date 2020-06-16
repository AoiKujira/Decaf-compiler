import lark_test

if __name__ == "__main__":
    input_file = open("inputfile.txt", "r")
    output_file = open("outputfile.txt", "w")
    text = input_file.read()
    lark_test.check_errors(text, output_file)
