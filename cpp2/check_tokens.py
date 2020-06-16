import re
import sys

DOUBLE_REGEX = "\A[0-9]+\.[0-9]*"

DOUBLE_SCIENTIFIC = DOUBLE_REGEX + "[eE][-+][0-9]+"

DOUBLE_SCIENTIFIC_TWO = DOUBLE_REGEX + "[eE][0-9]+"

HEX_REGEX = "\A0[xX][0-9a-fA-F]+"

DECIMAL_REGEX = "\A[0-9]+"

ID_REGEX = "\A[a-zA-Z]([a-zA-Z0-9_]*)"

STRING_REGEX = "\A\".*\""

operators_single = ["+",
                    "-",
                    "*",
                    "/",
                    "%",
                    "<",
                    ">",
                    "=",
                    "!",
                    ";",
                    ",",
                    ".",
                    "[",
                    "]",
                    "(",
                    ")",
                    "{",
                    "}"]

operators_double = [
    "<=",
    ">=",
    "==",
    "!=",
    "&&",
    "||"
]

keywords = [
    "void",
    "int",
    "double",
    "bool",
    "string",
    "class",
    "interface",
    "null",
    "this",
    "extends",
    "implements",
    "for",
    "while",
    "if",
    "else",
    "return",
    "break",
    "new",
    "NewArray",
    "write_to_output",
    "ReadInteger",
    "ReadLine",
    "Print"
]


def check(input_file, output_file):
    def write_to_output(*strings):
        final = ""
        for s in strings:
            final = final + s + " "
        final = final.strip(" ") + "\n"
        output_file.writelines(final)

    ignore_comment2 = False
    for line in input_file:
        args = line.strip("\n").split()
        string_bool = False
        ignore_comment = False
        for part1 in args:
            part = part1
            if string_bool:
                if part.count("\"") == 0:
                    continue
                part = part[(part.find("\"") + 1):]
                string_bool = False
            if ignore_comment:
                break

            next_part = part
            while True:
                if ignore_comment2 and next_part.count("*/"):
                    part = next_part[next_part.find("*/") + 2:]
                    ignore_comment2 = False
                elif ignore_comment2:
                    break
                elif part == "":
                    break

                matched = False
                next_part = part

                if part.count("//"):
                    if part.startswith("//"):
                        ignore_comment = True
                        break
                    part = part[:part.find("//")]
                    next_part = part[part.find("//"):]
                if part.count("/*"):
                    if part.count("*/"):
                        next_part = part[part.find("*/"):]
                    ignore_comment2 = True
                    part = part[:part.find("/*")]

                if part == "":
                    part = next_part
                    continue

                # write_to_output(part, "sag")
                for m in operators_double + operators_single:
                    if part.startswith(m):
                        write_to_output(m)
                        part = part[len(m):]
                        matched = True
                        break
                if matched:
                    continue

                if part.startswith("\"") and line.count("\"") > 1:
                    this_part = line
                    this_part = this_part[(this_part.index("\"") + 1):]
                    this_part = this_part[:this_part.index("\"")]
                    output_file.write("T_STRINGLITERAL \"" + this_part + "\"\n")
                    if part.count("\"") != 0:
                        if part.count("\"") == 1:
                            string_bool = True
                            part = ""
                        else:
                            part = part[(part.index("\"") + 1):]
                            part = part[(part.index("\"") + 1):]
                    line = line[(line.index("\"") + 1):]
                    line = line[(line.index("\"") + 1):]
                    continue

                if re.search("\A[a-zA-Z]", part):
                    identifier = re.search(ID_REGEX, part).group()
                    for key in keywords:
                        if key == identifier:
                            write_to_output(identifier)
                            break
                    else:
                        if identifier == "true" or identifier == "false":
                            write_to_output("T_BOOLEANLITERAL", identifier)
                        elif len(identifier) <= 31:
                            write_to_output("T_ID", identifier)
                        else:
                            write_to_output("UNIDENTIFIED_TOKEN")
                    part = part[len(identifier):]
                    continue

                if re.search("\A[0-9]", part):
                    match = re.search(DOUBLE_SCIENTIFIC_TWO, part)
                    if match:
                        write_to_output("T_DOUBLELITERAL", match.group())
                        part = part[len(match.group()):]
                        continue
                    match = re.search(DOUBLE_SCIENTIFIC, part)
                    if match:
                        write_to_output("T_DOUBLELITERAL", match.group())
                        part = part[len(match.group()):]
                        continue
                    match = re.search(DOUBLE_REGEX, part)
                    if match:
                        write_to_output("T_DOUBLELITERAL", match.group())
                        part = part[len(match.group()):]
                        continue
                    match = re.search(HEX_REGEX, part)
                    if match:
                        write_to_output("T_INTLITERAL", match.group())
                        part = part[len(match.group()):]
                        continue
                    match = re.search(DECIMAL_REGEX, part)
                    if match:
                        write_to_output("T_INTLITERAL", str(int(match.group())))
                        part = part[len(match.group()):]
                        continue
                write_to_output("UNIDENTIFIED_TOKEN")
                sys.exit()
