import re

from lark import Token

from Symbols import *


class Scope:
    def __init__(self, parent, number):
        self.children = []
        self.table = {}
        self.parent = parent
        self.number = number


class Test(Transformer):
    def __init__(self, sym):
        super().__init__()
        self.afterdot = False
        self.is_converty = False
        self.is_printing = False
        self.root_scope = Scope(None, 0)
        self.current_scope = self.root_scope
        self.scope_counter = 0
        self.code = ''''''
        self.lcounter = 0
        self.tcounter = 0
        self.tstack = []
        self.lstack = []
        self.loop_stack = []
        self.is_funcy = False
        self.classes = sym.classes
        self.sym = sym
        self.var_types = sym.var_types
        self.mem_checker = False
        self.function_types = sym.function_types
        self.function_types_specific = sym.function_types_specific
        self.function_vars = sym.function_vars
        self.in_class = False
        self.last_code = ''''''
        self.new = False
        self.last_class = ""
        self.function_class = {}
        self.func_call = False
        self.left = False
        self.this_class_vars = {}
        self.this_function_vars = []
        self.correct_after_dot = False
        self.should_return = False
        self.take_care = {}
        self.add_code = {}

    def expr(self, args):
        # print("expr", args)
        if self.new and not isinstance(args[0], str):
            self.new = False
            self.last_class = ""
        return args[0]

    def after_dot(self, args):
        self.afterdot = True

    def make_start_label(self, args):
        lab = self.make_label()
        self.code += lab + ":\n"
        self.lstack.append(lab)

    def make_condition_jump(self, args):
        t = self.tstack.pop()
        end = self.make_label()
        self.loop_stack.append(end)
        self.code += "Ifz " + t + " goto " + end + "\n"
        self.lstack.append(end)

    def make_loop_jump(self, args):
        end = self.lstack.pop()
        start = self.lstack.pop()
        self.code += "jumpto " + start + "\n"
        self.code += end + ":" + "\n"
        self.loop_stack.pop()

    def for_jump(self, args):
        t = self.tstack.pop()
        start = self.lstack.pop()
        stmt_lab = self.make_label()
        end = self.make_label()
        self.loop_stack.append(end)
        step_lab = self.make_label()
        self.lstack.append(step_lab)
        self.lstack.append(end)
        self.lstack.append(stmt_lab)
        self.lstack.append(start)
        self.code += "Ifz " + t + " goto " + end + "\n"
        self.code += "jumpto " + stmt_lab + "\n"
        self.code += step_lab + ":\n"

    def step_jump(self, args):
        start = self.lstack.pop()
        stmt_lab = self.lstack.pop()
        self.code += "jumpto " + start + "\n"
        self.code += stmt_lab + ":\n"

    def return_jump(self, args):
        end = self.lstack.pop()
        step_lab = self.lstack.pop()
        self.code += "jumpto " + step_lab + "\n"
        self.code += end + ":\n"
        self.loop_stack.pop()

    def break_stmt(self, args):
        lab = self.loop_stack[-1]
        self.code += "jumpto " + lab + "\n"

    def if_cond(self, args):
        t = self.tstack.pop()
        lab = self.make_label()
        # print("lab", t)
        # print(self.code)
        self.code += "Ifz " + t + " goto " + lab + "\n"
        self.lstack.append(lab)

    def if_out_label(self, args):
        out = self.lstack.pop()
        self.code += out + ":\n"

    def if_middle(self, args):
        mid = self.lstack.pop()
        out = self.make_label()
        self.lstack.append(out)
        self.code += "jumpto " + out + "\n"
        self.code += mid + ":\n"

    def start_vars(self, args):
        self.is_varring = True

    def stop_vars(self, args):
        self.is_varring = False

    def exp_assign(self, args):
        print("exp assign", args, self.func_call)
        # print(self.code, "\n\nheheh\n\n")
        if not isinstance(args[1][0], str):
            args[1] = args[1][0][0]
        # print("exp assign", args)
        if str(args).__contains__('exp_this'):
            self.code += 'init_this.' + args[0][1] + " = " + args[1] + "\n"
            return 'init_this'
        if not isinstance(args[0], list):
            # print(args[0])
            if re.match(".*\[.*\]", args[0]):
                name = re.sub("\[.*\]", "", args[0])
                ty = self.var_types[name]
                if re.match(".*(\[.*\])", ty):
                    ty = ty.strip("[]")
                if ["int", "bool", "double", "string"].__contains__(ty):
                    size = 4
                else:
                    size = self.classes[ty].size
                ind = re.match(".*(\[.*\])", args[0]).group(1).strip("[").strip("]")
                tem = self.make_temp()
                self.code += "arith " + tem + " = " + str(size) + " * " + ind + "\n"
                self.code += "arith " + tem + " = " + name + " + " + tem + "\n"
                self.code += "assign " + "*(" + tem + ")" + " = " + args[1] + "\n"
                self.var_types[tem] = "int"
                return args[1]
            # print("self.code", self.code, "\n\nhehe\n\n")
            # print("var type", self.var_types)
            print(args)
            try:
                self.var_types[args[0]] = self.var_types[args[1]]
            except:
                self.var_types[args[1]] = self.var_types[args[0]]
            self.code += "assign " + args[0] + " = " + args[1] + "\n"
            return args[1]
        else:
            self.mem_checker = False
            temp = self.make_temp()
            lee = args[0]
            first = lee[0]
            for i in range(1, len(lee)):
                sec = lee[i]
                # print(self.this_class_vars)
                try:
                    t = self.var_types[first]
                    c: Class = self.classes[t]
                except:
                    t = self.this_class_vars[first]
                    c: Class = self.classes[t]
                # handle array members
                if re.match(".*\[.*\]", sec):
                    name = re.sub("\[.*\]", "", sec)
                    # print(c.name)
                    ty = re.sub("\[.*\]", "", c.var_types[name])
                    # print(name, ty)
                    if ["int", "bool", "double", "string"].__contains__(ty):
                        size = 4
                    else:
                        size = self.classes[ty].size
                    hold = re.match(".*(\[.*\])", sec)
                    # print(hold)
                    ind = hold.group(1).strip("[").strip("]")
                    o = c.var_offsets[name]
                    tem = self.make_temp()
                    self.code += "arith " + tem + " = " + first + " + " + str(o) + "\n"
                    self.code += "assign " + temp + " = " + "*(" + tem + ")" + "\n"
                    self.code += "arith " + tem + " = " + str(size) + " * " + ind + "\n"
                    self.code += "arith " + temp + " = " + temp + " + " + tem + "\n"
                    self.var_types[tem] = "int"
                    self.var_types[temp] = ty
                    first = temp
                    continue

                o = c.var_offsets[sec]
                self.code += "arith " + temp + " = " + first + " + " + str(o) + "\n"
                if i != len(lee) - 1:
                    self.code += "assign " + temp + " = " + "*(" + temp + ")\n"
                self.var_types[temp] = c.var_types[sec]
                first = temp
            self.code += "assign " + "*(" + temp + ")" + " = " + args[1] + "\n"
            return args[1]

    def new_class(self, args):
        print("new_class", self.classes, args)
        # self.last_class = args[0]
        size = self.classes[args[0]].size
        t = self.make_temp()
        self.code += "assign " + t + " = allocate " + str(size) + "\n"
        self.var_types[t] = args[0]
        self.new = True
        # print(self.code, "\n\nhehe\n\n")
        return [t, args[0]]

    def make_array(self, args):
        ty = args[1]
        if ["int", "bool", "double", "string"].__contains__(ty) or re.match(".*\[\]", ty):
            size = 4
        else:
            size = self.classes[ty].size
        t = self.make_temp()
        self.code += "arith " + t + " = " + args[0] + " * " + str(size) + "\n"
        self.code += "arith " + t + " = " + t + " + 4\n"
        self.code += "assign " + t + " = allocate " + t + "\n"
        self.code += "assign " + "*(" + t + ") = " + args[0] + "\n"
        self.code += "arith " + t + " = " + t + " + 4\n"
        self.var_types[t] = "int"
        return t

    def exp_ident(self, args):
        iden = args[0]
        cur = self.current_scope
        # noinspection PyBroadException
        try:
            if self.afterdot:
                raise Exception()
            while not (cur.table.keys().__contains__(iden)):
                cur = cur.parent
                # print(cur.table, "asdfasf", cur.number)
            self.var_types[iden + str(cur.number)] = cur.table[iden]
            return iden + str(cur.number)
        except:
            self.correct_after_dot = True
            return iden

    def exp_mem(self, args):
        lee = []
        for a in args:
            if a is not None:
                lee.append(a)
        print("exp_mem", lee)
        if str(lee).__contains__("correct_init_this"):
            self.func_call = True
        self.afterdot = False
        if self.func_call:
            if isinstance(lee[0], str) and len(lee[1]) == 4:
                self.func_call = False
                if str(lee).__contains__("length"):
                    temp = lee[1][3]
                    self.code += "assign " + temp + " = " + lee[0] + "\n"
                    self.code += "arith " + temp + " = " + temp + " + -4\n"
                    self.code += "assign " + temp + " = " + "*(" + temp + ")\n"
                    self.var_types[temp] = "int"
                    return temp
                if self.var_types.__contains__(lee[0]):
                    add = self.var_types[lee[0]] + "_" + lee[1][0]
                else:
                    try:
                        add = self.this_class_vars[lee[0]] + "_" + lee[1][0]
                    except:
                        return lee
                # if str(add).__contains__("["):

                self.code += "push " + lee[0] + "\n"
                if add.count("int_"):
                    add = add[len("int_"):]
                self.code += "Lcall " + add + "\n"
                print("Lcall1", add)
                # print(self.function_types)
                if (self.function_types.__contains__(add) and self.function_types[add] == 'return') \
                        or (self.function_types.__contains__("init_" + lee[1][0]) and
                            self.function_types["init_" + lee[1][0]] == 'return'):
                    if lee[1][3].count("["):
                        if self.function_types_specific.__contains__(add):
                            self.var_types[lee[1][3][:lee[1][3].find("[")]] = self.function_types_specific[add]
                        lee[1][3] = self.exp_nine([lee[1][3]])
                    self.code += "pop " + lee[1][3] + "\n"
                self.code += "popra\n"
                # print(self.function_types_specific, add)
                if self.function_types_specific.__contains__(add):
                    self.var_types[lee[1][3]] = self.function_types_specific[add]
                return lee[1][3]
            elif self.new:
                # print(3)
                # print(args)
                self.new = False
                self.func_call = False
                self.code += "push " + lee[0][0] + "\n"
                add = lee[0][1] + "_" + lee[1][0]
                self.code += "Lcall " + add + "\n"
                print("Lcall2", add)
                if self.function_types[add] == 'return':
                    self.var_types[lee[1][3]] = self.function_types_specific[add]
                    self.code += "pop " + lee[1][3] + "\n"
                self.code += "popra\n"
                return lee[1][3]
            return lee
        if isinstance(lee[0], list) and isinstance(lee[1], list):
            return lee
        if isinstance(lee[0], str) and dict(self.var_types).__contains__(lee[0]) and \
                dict(self.function_vars).__contains__(self.var_types[lee[0]] + "_" + str(lee[1])):
            self.code = self.last_code
            self.code = self.code[:self.code.find("Lcall " + lee[1])]
            self.code += "\npushAddressOf " + lee[0] + "\n"
            self.code += "Lcall " + self.var_types[lee[0]] + "_" + lee[1] + "\n"
            return lee
        self.mem_checker = True
        if isinstance(lee[1], list):
            new_lee = [lee[0]]
            for a in lee[1]:
                # print(a)
                if a is not None:
                    new_lee.append(a)
            # print(lee)
            return new_lee
        elif len(lee) == 3:
            # print([args[0], args[1]])
            return [lee[0], lee[2]]
        else:
            return [lee[0], lee[1]]

    def dec_const(self, args):
        t = self.make_temp()
        dec = args[0]
        self.var_types[t] = "int"
        self.code += "assign " + t + " i= " + str(int(dec)) + "\n"
        return t

    def hex_const(self, args):
        t = self.make_temp()
        dec = int(args[0], 16)
        self.var_types[t] = "int"
        self.code += "assign " + t + " i= " + str(dec) + "\n"
        return t

    def exp_not(self, args):
        t = self.make_temp()
        # typecheck here
        self.var_types[t] = "bool"
        self.code += "arith " + t + " = " + args[0] + " b!" + "\n"
        return t

    def exp_neg(self, args):
        t = self.make_temp()
        # typecheck here
        if self.var_types[args[0]] == "int":
            self.code += "arith " + t + " = -1 * " + args[0] + "\n"
            self.var_types[t] = "int"
        elif self.var_types[args[0]] == "double":
            self.var_types[t] = "double"
            self.code += "arith " + t + " = -1 f* " + args[0] + "\n"
        return t

    def exp_mul(self, args):
        t = self.make_temp()
        #
        # typecheck here
        if self.var_types[args[0]] == "double" or self.var_types[args[1]] == "double":
            self.code += "arith " + t + " = " + args[0] + " f* " + args[1] + "\n"
            self.var_types[t] = "double"
        else:
            self.code += "arith " + t + " = " + args[0] + " * " + args[1] + "\n"
            self.var_types[t] = "int"
        return t

    def exp_div(self, args):
        t = self.make_temp()
        # typecheck here
        if self.var_types[args[0]] == "double" or self.var_types[args[1]] == "double":
            self.code += "arith " + t + " = " + args[0] + " f/ " + args[1] + "\n"
            self.var_types[t] = "double"
        else:
            self.code += "arith " + t + " = " + args[0] + " / " + args[1] + "\n"
            self.var_types[t] = "int"
        return t

    def exp_rem(self, args):
        t = self.make_temp()
        # typecheck here
        self.code += "arith " + t + " = " + args[0] + " % " + args[1] + "\n"
        self.var_types[t] = "int"
        return t

    def exp_sum(self, args):
        t = self.make_temp()
        # typecheck here
        # print(self.code, "\n\nhehe")
        if self.var_types[args[0]] == "double" or self.var_types[args[1]] == "double":
            self.code += "arith " + t + " = " + args[0] + " f+ " + args[1] + "\n"
            self.var_types[t] = "double"
        else:
            self.code += "arith " + t + " = " + args[0] + " + " + args[1] + "\n"
            self.var_types[t] = "int"
        return t

    def exp_sub(self, args):
        t = self.make_temp()
        # typecheck here
        if self.var_types[args[0]] == "double" or self.var_types[args[1]] == "double":
            self.code += "arith " + t + " = " + args[0] + " f- " + args[1] + "\n"
            self.var_types[t] = "double"
        else:
            self.code += "arith " + t + " = " + args[0] + " - " + args[1] + "\n"
            self.var_types[t] = "int"
        return t

    def exp_lt(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.var_types[t] = "bool"
        if self.var_types[args[0]] == "double" or self.var_types[args[1]] == "double":
            self.code += "arith " + t + " = " + args[0] + " f< " + args[1] + "\n"
        else:
            self.code += "arith " + t + " = " + args[0] + " < " + args[1] + "\n"
        return t

    def exp_gt(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.var_types[t] = "bool"
        if self.var_types[args[0]] == "double" or self.var_types[args[1]] == "double":
            self.code += "arith " + t + " = " + args[1] + " f< " + args[0] + "\n"
        else:
            self.code += "arith " + t + " = " + args[1] + " < " + args[0] + "\n"
        return t

    def exp_ge(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.var_types[t] = "bool"
        if self.var_types[args[0]] == "double" or self.var_types[args[1]] == "double":
            self.code += "arith " + t + " = " + args[1] + " f<= " + args[0] + "\n"
        else:
            self.code += "arith " + t + " = " + args[1] + " <= " + args[0] + "\n"
        return t

    def exp_equal(self, args):
        # print("exp_equal", args)
        t = self.make_temp()
        #
        # typecheck here
        self.var_types[t] = "bool"
        if self.var_types[args[0]] == "double" or self.var_types[args[1]] == "double":
            self.code += "arith " + t + " = " + args[0] + " f== " + args[1] + "\n"
        elif self.var_types[args[0]] == "bool" or self.var_types[args[1]] == "bool":
            self.code += "arith " + t + " = " + args[0] + " b== " + args[1] + "\n"
        elif self.var_types[args[0]] == "string" or self.var_types[args[1]] == "string":
            self.code += "arith " + t + " = " + args[0] + " s== " + args[1] + "\n"
        else:
            self.code += "arith " + t + " = " + args[0] + " == " + args[1] + "\n"

        return t

    def exp_unequal(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.var_types[t] = "bool"
        if self.var_types[args[0]] == "double" or self.var_types[args[1]] == "double":
            self.code += "arith " + t + " = " + args[0] + " f!= " + args[1] + "\n"
        elif self.var_types[args[0]] == "bool" or self.var_types[args[1]] == "bool":
            self.code += "arith " + t + " = " + args[0] + " b!= " + args[1] + "\n"
        elif self.var_types[args[0]] == "string" or self.var_types[args[1]] == "string":
            self.code += "arith " + t + " = " + args[0] + " s!= " + args[1] + "\n"
        else:
            self.code += "arith " + t + " = " + args[0] + " != " + args[1] + "\n"
        return t

    def exp_and(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += "arith " + t + " = " + args[0] + " && " + args[1] + "\n"
        self.var_types[t] = "bool"
        return t

    def exp_or(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.code += "arith " + t + " = " + args[0] + " || " + args[1] + "\n"
        self.var_types[t] = "bool"
        return t

    def expr_const(self, args):
        if isinstance(args[0], str):
            return args[0]
        if not isinstance(args[0].children[0], Token):
            return args[0].children[0]
        ty = args[0].children[0].type
        # print(ty, print(args[0].children[0]))
        t = self.make_temp()
        if ty == "STRING_CONSTANT":
            self.var_types[t] = "string"
            self.code += "assign " + t + " s= " + args[0].children[0] + "\n"
        elif ty == "BOOL_CONSTANT":
            self.var_types[t] = "bool"
            self.code += "assign " + t + " b= " + args[0].children[0] + "\n"
        elif ty == "int_constant":
            self.var_types[t] = "int"
            self.code += "assign " + t + " i= " + str(int(args[0].children[0])) + "\n"
        elif ty == "DOUBLE_INT":
            self.var_types[t] = "double"
            doub = str(eval(args[0].children[0]))
            self.code += "assign " + t + " f= " + doub + "\n"
        return t

    def print_stmt(self, args):
        # print("printing", args, self.var_types)
        # exception = False
        code = ""
        for arg in args[1]:
            try:
                if self.var_types[arg] == "double":
                    code += "Printf " + arg + "\n"
                elif self.var_types[arg] == "string":
                    code += "Prints " + arg + "\n"
                elif self.var_types[arg] == "bool":
                    code += "Printb " + arg + "\n"
                else:
                    code += "Printi " + arg + "\n"
            except:
                exception = True
                if arg.count("init_this"):
                    code += "Print " + arg + "\n"
                elif self.in_class:
                    code += "Print init_this." + arg + "\n"
                else:
                    code += "Print " + arg + "\n"
        self.code += code + "Printe\n"
        return code

    def print_begin(self, args):
        self.is_printing = True

    def print_end(self, args):
        self.is_printing = False

    def exp_le(self, args):
        t = self.make_temp()
        #
        # typecheck here
        self.var_types[t] = "bool"
        if self.var_types[args[0]] == "double" or self.var_types[args[1]] == "double":
            self.code += "arith " + t + " = " + args[0] + " f<= " + args[1] + "\n"
        else:
            self.code += "arith " + t + " = " + args[0] + " <= " + args[1] + "\n"
        return t

    def exp_nine(self, args):
        # print("exp_nine", args, self.func_call)
        # print(self.code, "\n\nhehe\n\n")
        if isinstance(args[0], str) and not args[0].count("["):
            return args[0]
        if len(args) == 1 and isinstance(args[0], list) and len(args[0]) > 1 and\
                (self.new or str(args).__contains__("correct_init_this")):
            args = args[0]

        # if str(args).count("correct_init_this"):
        #     self.func_call = True
        if str(args).count("correct_init_this") and isinstance(args[0], list) and isinstance(args[0][1], list) \
                and isinstance(args[0][1][0], str):
            self.left = True
            new_lee = [args[0][0]]
            while isinstance(args[0][1][0], str):
                if args[0][1][1] == "correct_init_this":
                    args[0][1] = [args[0][1]]
                    break
                new_lee.append(args[0][1][0])
                args = [[args[0][0], args[0][1][1]]]
            self.func_call = False
            # print("1")
            self.mem_checker = True
            args = [self.exp_nine([new_lee]), args[0][1]]
            # print(1, args)
            self.func_call = False
            if len(args[1]) > 1:
                args = [self.exp_nine([args[0]]), args[1]]
            else:
                args = [self.exp_nine([args[0]]), args[1][0]]
            # print(2)
            args = [self.exp_mem(args)]
            # print("after_mem", args)
            if self.should_return:
                # print("should", args)
                return args
            # print("heyyyyyyyy2", args)
            # print(2, args)
            # print(self.var_types)
        # print(args)
        if self.new:
            print(1)
            self.new = False
            return args[0]
        if not isinstance(args[0], list) and str(args).__contains__("exp_this"):
            print(2)
            return "init_this"
        if isinstance(args[0], list) and isinstance(args[0][1], list) and self.func_call:
            print(3, args)
            self.func_call = False
            args = args[0]
            args = [args[0], args[1][0], args[1][1]]
            push = args[0]
            add = self.var_types[args[0]] + "_" + args[1][0]
            # lee = []
            # print(self.code, "\n\nhihhi\n\n")
            type = ""
            for i in range(1, str(args).count("correct_init_this") + 1):
                print("Lcall3", add)
                if str(add).__contains__("length"):
                    temp = args[1][3]
                    self.code += "assign " + temp + " = " + args[0] + "\n"
                    self.code += "arith " + temp + " = " + temp + " + -4\n"
                    self.code += "assign " + temp + " = " + "*(" + temp + ")\n"
                    self.var_types[temp] = "int"
                    return temp
                if add.count("["):
                    self.mem_checker = True
                    self.should_return = True
                    args = self.exp_nine([args])
                    self.should_return = False
                    if len(args) == 1 and isinstance(args[0], str):
                        return args[0]
                    args = args[0]
                    args = [args[0], args[1][0], args[1][1]]
                    push = args[0]
                    add = self.var_types[args[0]] + "_" + args[1][0]
                    continue
                    # print(add)
                self.code += "push " + push + "\n"
                self.code += "Lcall " + add + "\n"
                # if len(args) == 1:
                #     print(self.code)
                if len(args[1]) < 3:
                    # print(args[0], type)
                    self.var_types[args[0]] = type
                    return self.exp_nine([args])
                if not (isinstance(args[1][3], str) and args[1][3].count("[")):
                    # print(add, self.function_types)
                    if self.function_types[add] == 'return':
                        self.code += "pop " + args[1][3] + "\n"
                        self.var_types[args[1][3]] = self.function_types_specific[add]
                    self.code += "popra\n"
                else:
                    self.var_types[args[1][3][:args[1][3].find("[")]] = self.function_types_specific[add]
                    self.code += "pop " + args[1][3][:args[1][3].find("[")] + "\n"
                    self.code += "popra\n"
                    args[1][3] = self.exp_nine([args[1][3]])
                    # print("here", args)

                push = args[1][3]
                if self.function_types_specific.__contains__(add):
                    type = self.function_types_specific[add]
                    # self.var_types[args[1][3]] = type
                    # print("type", args[1][3], type)
                if len(args) > 2:
                    if isinstance(args[2][0], list):
                        args = [args[0], args[2][0], args[2][1]]
                    else:
                        self.mem_checker = True
                        args = [args[1][3], args[2]]
                # print(args, add)
                if self.function_types_specific.__contains__(add):
                    add = self.function_types_specific[add] + "_" + args[1][0]
            if isinstance(args[1], str):
                self.var_types[args[0]] = type
                args = [args]
            # elif isinstance(args)
            else:
                try:
                    # print(args)
                    args = [args[1][3]]
                except:
                    # print(type, args)
                    self.var_types[args[0]] = type
                    lee = [args[0]]
                    for arg in args[1]:
                        lee.append(arg)
                    args = [lee]
                    self.mem_checker = True
                    # print(args, type)
            # print(args, self.var_types)
            # args = [[args[1][3], args[2]]]
        if self.func_call and not self.left and not isinstance(args[0], str):
            print(4, args)
            # print("heyyy", args, self.function_types)
            self.func_call = False
            for arg in args:
                if arg[0].__contains__("length"):
                    tem = temp
                    temp = arg[3]
                    self.code += "assign " + temp + " = " + tem + "\n"
                    self.code += "arith " + temp + " = " + temp + " + -4\n"
                    self.code += "assign " + temp + " = " + "*(" + temp + ")\n"
                    self.var_types[temp] = "int"
                    return temp
                if str(args).__contains__("exp_this"):
                    self.code += "push init_this\n"
                    add = args[0][1]
                else:
                    add = args[0][0]
                    if self.function_types.__contains__("init_" + add):
                        self.code += "push init_this\n"
                    elif self.in_class:
                        self.code += "push father_this\n"
                if self.in_class and not self.function_types.__contains__(add):
                    self.code += "Lcall init_" + add + "\n"
                else:
                    self.code += "Lcall " + add + "\n"
                if str(arg).__contains__("correct_init_this"):
                    temp = arg[3]
                    if self.function_types_specific.__contains__(add):
                        temp = self.make_temp()
                        self.var_types[temp] = self.function_types_specific[add]
                        self.code += "pop " + temp + "\n"
                    self.code += "popra\n"
            return temp
        # print(args[0][1])
        if not isinstance(args[0], str) and self.var_types.__contains__(args[0][0]) and \
                not isinstance(args[0][1], list) and not self.function_types.__contains__(args[0][1]) \
                and self.classes[self.var_types[args[0][0]]].var_offsets.__contains__(args[0][1]):
            print(5)
            t = self.make_temp()
            # print(t)
            offset = self.classes[self.var_types[args[0][0]]].var_offsets[args[0][1]]
            type = self.var_types[args[0][0]] + "." + args[0][1]
            type = self.classes[self.var_types[args[0][0]]].var_types[type]
            self.var_types[t] = type
            self.code += "arith " + t + " = " + args[0][0] + " + " + str(offset) + "\n"
            self.code += "assign " + t + " = *(" + t + ")\n"
            if len(args[0]) == 2:
                self.mem_checker = False
                return t
            else:
                self.mem_checker = True
                lee = [t]
                count = 0
                for arg in args[0]:
                    if count > 1:
                        lee.append(arg)
                    count += 1
                return self.exp_nine([lee])
        if len(args[0]) == 3 and isinstance(args[0][2], list) and isinstance(args[0][2][1], list):
            return self.exp_nine([[args[0][0], args[0][1], [args[0][2][0], args[0][2][1][0], args[0][2][1][1]]]])
        if len(args[0]) == 3 and isinstance(args[0][2], list):
            return self.exp_nine([[args[0][0], args[0][1], args[0][2][0], args[0][2][1]]])
        if len(args[0]) == 3 and self.var_types.__contains__(args[0][2]) and self.function_types.__contains__(
                args[0][1]):
            print(6)
            # print("yaaaaaaaaay")
            self.code = self.last_code
            self.code += "push " + args[0][2] + "\n"
            self.code += "Lcall " + args[0][1] + "\n"
            print("Lcall5", args[0][1])
            t = ""
            if self.function_types[args[0][1]] == "return":
                t = self.make_temp()
                self.var_types[t] = self.function_types_specific[args[0][1]]
                self.code += "pop " + t + "\n"
            self.code += "popra\n"
            return t
        if str(args).__contains__('exp_this'):
            print(7)
            # print("here")
            return 'init_this.' + args[0][1]
        if isinstance(args[0], list) and (not self.mem_checker or str(args).__contains__("correct_init_this")):
            print(8)
            # print("here")
            return args
        # print("function types", self.function_types)
        if isinstance(args, list) and len(args) == 4 and str(args).__contains__("correct_init_this") \
                and (self.function_types.__contains__(args[0]) or self.function_types.__contains__("init_" + args[0])):
            print("new", args)
            if self.function_types.__contains__(args[0]):
                self.code += "Lcall " + args[0] + "\n"
            else:
                self.code += "Lcall init_" + args[0] + "\n"
            if (self.function_types.__contains__(args[0]) and self.function_types[args[0]] == "return")\
                    or (self.function_types.__contains__("init_" + args[0]) and
                        self.function_types["init_" + args[0]] == "return"):
                if self.function_types_specific.__contains__(args[0]):
                    self.var_types[args[3]] = self.function_types_specific[args[0]]
                else:
                    self.var_types[args[3]] = self.function_types_specific["init_" + args[0]]
                self.code += "pop " + args[3] + "\n"
                self.code += "popra\n"
                return args[3]
            self.code += "popra\n"
            return ""
        if not self.mem_checker:
            print(9)
            if not isinstance(args[0], str):
                ret = args[0].children[0]
                self.tstack.append(ret)
                return ret
            else:
                the_thing = args[0]
                if re.match(".*\[.*\]", the_thing):
                    name = re.sub("\[.*\]", "", the_thing)
                    ty = self.var_types[name].strip("[]")
                    if ["int", "bool", "double", "string"].__contains__(ty) or \
                            re.match(".*(\[.*\])+\[.*\]", the_thing):
                        size = 4
                    else:
                        size = self.classes[ty].size
                    ind = re.match(".*(\[.*\])", the_thing).group(1).strip("[").strip("]")
                    tem = self.make_temp()
                    self.code += "arith " + tem + " = " + str(size) + " * " + ind + "\n"
                    self.code += "arith " + tem + " = " + name + " + " + tem + "\n"
                    self.code += "assign " + tem + " = " + "*(" + tem + ")" + "\n"
                    self.var_types[tem] = ty
                    if str(args).__contains__("correct_init_this"):
                        self.take_care[tem] = args
                    return tem
                self.tstack.append(args[0])
                if str(args).__contains__("correct_init_this"):
                    self.take_care[args[0]] = args
                return args[0]
        else:
            print(10)
            # print("memmmmm", args)
            # args = [args]
            # print(self.code)
            self.left = False
            self.mem_checker = False
            if not isinstance(args[0], list):
                self.mem_checker = True
                return args[0]
            temp = self.make_temp()
            lee = args[0]
            first = lee[0]
            # print(self.code)
            for i in range(1, len(lee)):
                sec = lee[i]
                # print(self.var_types)
                try:
                    t = self.var_types[first]
                    c: Class = self.classes[t]
                except:
                    t = self.this_class_vars[first]
                    c: Class = self.classes[t]
                # handle array members
                # print("memmmm", lee)
                if re.match(".*\[.*\]", sec):
                    # print("matched", lee)
                    name = re.sub("\[.*\]", "", sec)
                    ty = re.sub("\[.*\]", "", c.var_types[name])
                    if ["int", "bool", "double", "string"].__contains__(ty):
                        size = 4
                    else:
                        size = self.classes[ty].size
                    hold = re.match(".*(\[.*\])", sec)
                    ind = hold.group(1).strip("[").strip("]")
                    o = c.var_offsets[name]
                    tem = self.make_temp()
                    code = ""
                    code += "arith " + tem + " = " + first + " + " + str(o) + "\n"
                    code += "assign " + temp + " = " + "*(" + tem + ")" + "\n"
                    code += "arith " + tem + " = " + str(size) + " * " + ind + "\n"
                    code += "arith " + temp + " = " + temp + " + " + tem + "\n"
                    # print("hold", sec, "\n", code, "\n\nheeeyyyy\n\n")
                    self.code += code
                    self.var_types[temp] = ty
                    self.var_types[tem] = "int"
                    first = temp
                    # print("shart", i, len(lee) - 1, "\n\n")
                    # if i == len(lee) - 1:
                    self.code += "assign " + temp + " = " + "*(" + temp + ")\n"
                    continue
                # print(c.var_offsets, sec)
                o = c.var_offsets[sec]
                # except:
                #     print(c.var_offsets, self.classes[self.var_types[first]].var_offsets)
                #     # o = c.var_offsets[self.var_types[first]]
                self.code += "arith " + temp + " = " + first + " + " + str(o) + "\n"
                if i != len(lee) - 1 or (
                        i == len(lee) - 1 and ["int", "bool", "double", "string"].__contains__(c.var_types[sec])):
                    self.code += "assign " + temp + " = " + "*(" + temp + ")\n"
                self.var_types[temp] = c.var_types[sec]
                first = temp
            if str(args).__contains__("correct_init_this"):
                self.take_care[temp] = args
            return temp

    def exp_arr(self, args):
        # print("exp_arr", args)
        # print("\n\nhehe\n\n", self.code)
        try:
            return args[0] + "[" + args[1] + "]"
        except:
            # print(args[0][:-2])
            return [args[0][0], args[0][1], args[0][2], args[0][3] + "[" + args[1] + "]"]

    def init_func(self, args):
        self.is_funcy = True
        self.code += "init_func\n"

    def exit_func(self, args):
        self.is_funcy = False

    def init_class(self, args):
        self.code += "init_class\n"
        self.in_class = True
        self.this_class_vars = {}

    def class_decl(self, args):
        # print("class_decl")
        # print(self.code, "\n\nhahah\n\n")
        # print("before", self.function_types)
        new_function_types = {}
        for x in self.function_types:
            if str(x).__contains__("init_"):
                # print(args[1], x, x[(x.find["_"] + 1):])
                new_function_types[args[1] + x[x.find("_"):]] = self.function_types[x]
            else:
                new_function_types[x] = self.function_types[x]
        self.function_types = new_function_types
        new_function_types = {}
        for x in self.function_types_specific:
            if str(x).__contains__("init_"):
                # print(args[1], x, x[(x.find["_"] + 1):])
                new_function_types[args[1] + x[x.find("_"):]] = self.function_types_specific[x]
            else:
                new_function_types[x] = self.function_types_specific[x]
        self.function_types_specific = new_function_types
        # print("after", self.function_vars)
        before_here = self.code[:self.code.find("init_class")]
        code = self.code[self.code.find("init_class") + len("init_class") + 1:]
        after_here = code[code.find("end_class") + len("end_class") + 1:]
        code = code[:code.find("end_class")]
        code = code.replace("init_", args[1] + "_")
        self.var_types[args[1] + "_this"] = args[1]
        for x in self.function_vars:
            before = code[:str(code).find(x)]
            after = code[str(code).find("return from " + x):]
            code = code[str(code).find(x):]
            code = code[:str(code).find("return from " + x)]
            # print(code, "\n hehe\n\n")
            # print("function vars", self.function_vars[x])
            if str(x).startswith(args[1] + "_") and self.function_vars[x] is not None:
                for obj in self.function_vars[x]:
                    object = obj[1] + str(self.current_scope.number)
                    code = code.replace(x + ":\n", x + ":\npop " + object + "\n")
                    self.var_types[object] = obj[0]
            code = before + code + after

        for x in self.function_types:
            code = code.replace(x + ":\n", x + ":\npop " + args[1] + "_this\n")
        self.code = before_here + code + after_here
        # print(self.code, "\n\nhehe\n\n")
        # print(args[1], self.classes[args[1]].var_offsets)
        for x in self.classes[args[1]].var_offsets:
            # print(x, self.code.count("\n" + x + " "), args[1] + "_this." + x)
            self.code = self.code.replace("\n" + x + " ", "\n" + args[1] + "_this." + x + " ")
            self.code = self.code.replace(" " + x + "\n", " " + args[1] + "_this." + x + "\n")
            self.code = self.code.replace(" " + x + " ", " " + args[1] + "_this." + x + " ")
            self.code = self.code.replace("\n" + x + "\n", "\n" + args[1] + "_this." + x + "\n")

        # print(self.code, "\n\nhehe\n\n\n")

        total_code = self.code
        new_code = ""
        while total_code.count("\n"):
            line = total_code[:total_code.find("\n") + len("\n")]

            boolean = line.__contains__("Lcall")
            cl = self.classes[args[1]].parents
            boolean = boolean and len(cl)
            boolean = boolean and line[len("Lcall "):].__contains__(cl[0] + "_")
            if boolean:
                # todo make sure
                # print(cl[0])
                new_code += "push " + args[1] + "_this\n"

            if len(cl) and line.__contains__("push father_this"):
                line = line.replace("father", args[1])
            elif line.__contains__("push father_this"):
                line = ""

            total_code = total_code[total_code.find("\n") + len("\n"):]
            if line.count(args[1] + "_this."):
                code = line[line.find(args[1] + "_this.") + len(args[1] + "_this."):]
                code = code[:code.find(" ")]
                if code.count("\n"):
                    code = code[:code.find("\n")]
                # print(args[1], code)
                key = code
                if code.count("["):
                    key = code[:code.find("[")]
                offset = self.classes[args[1]].var_offsets[key]
                ty = self.classes[args[1]].var_types[key]
                t = self.make_temp()
                add_code = "arith " + t + " = " + args[1] + "_this + " + str(offset) + "\n"
                self.var_types[t] = ty
                # print("take care", code, self.take_care)
                tempo = line[line.find("tempo"):]
                tempo = tempo[:tempo.find(" ")]
                # print(tempo)
                if self.take_care.__contains__(tempo):
                    self.take_care[tempo] = [tempo, self.take_care[tempo][1]]
                    if str(self.take_care[tempo]).__contains__("correct_init_this"):
                        self.func_call = True
                    length = len(self.code)
                    type = self.classes[args[1]].var_types[code]
                    if str(type).__contains__("["):
                        type = type[:type.find("[")]
                    self.var_types[tempo] = type
                    # print(self.var_types[tempo])
                    self.exp_mem(self.take_care[tempo])
                    self.exp_nine([self.take_care[tempo]])
                    # print(self.code[length:])
                    self.add_code[tempo] = self.code[length:]
                    # new_code += self.code[length:]
                if line.count("="):
                    add_code += line.replace(args[1] + "_this." + code, "*(" + t + ")")
                else:
                    add_code += "assign " + t + " = *(" + t + ")\n"
                    self.var_types[t] = ty
                    if line.count("push "):
                        if code.count("["):
                            self.func_call = False
                            self.mem_checker = False
                            t = self.exp_nine([t + code[code.find("["):]])
                            add_code += self.code[self.code.find(total_code) + len(total_code):]
                        add_code += "push " + t + "\n"
                    if line.count("Print") and line.count("."):
                        self.var_types[t] = self.classes[args[1]].var_types[code]
                        # print("Print", t)
                        add_code += self.print_stmt([None, [t], None])
                    # print(line.count("Print"))

                new_code += add_code
            else:
                if len(cl) and line.__contains__(":") and \
                        line.__contains__(self.classes[args[1]].parents[0]) and\
                    not self.code.__contains__(line.replace(self.classes[args[1]].parents[0], args[1])):
                    # print("class_decl", self.classes[args[1]].parents, args[1])
                    line += line.replace(self.classes[args[1]].parents[0], args[1])
                new_code += line

        self.code = new_code
        # print(self.)

        # print(self.code, "\n\nhehe\n\n")
        return args

    def end_class(self, args):
        self.code += "end_class\n"
        self.in_class = False

    def last_mission(self, args):
        # print(self.code, "\n\n\nhahaha\n\n")
        total_code = self.code
        new_code = ""
        line = total_code[:total_code.find("\n") + len("\n")]
        total_code = total_code[total_code.find("\n") + len("\n"):]
        while total_code.count("\n"):
            last_line = line
            line = total_code[:total_code.find("\n") + len("\n")]
            total_code = total_code[total_code.find("\n") + len("\n"):]
            new_code += last_line
            tempo = last_line[last_line.find("tempo"):]
            tempo = tempo[:tempo.find(" ")]
            if self.add_code.__contains__(tempo) and not total_code.__contains__(tempo) \
                    and not line.__contains__(tempo):
                # print(line, "heyyyy\n\n\n")
                new_code += self.add_code[tempo]
        new_code += line
        self.code = new_code

        total_code = self.code
        new_code = ""
        line = total_code[:total_code.find("\n") + len("\n")]
        total_code = total_code[total_code.find("\n") + len("\n"):]
        push_flag = False
        while total_code.count("\n"):
            last_line = line
            line = total_code[:total_code.find("\n") + len("\n")]
            total_code = total_code[total_code.find("\n") + len("\n"):]
            if last_line.count("Print "):
                # print("Print\n\n", last_line)
                t = last_line[len("Print"):]
                t = t[:t.find("\n")]
                last_line = self.print_stmt([None, [t], None])
            # if last_line.__contains__("push"):
            #     print(push_flag)
            if (not total_code.startswith("Print") or
                (total_code.find("Print") > total_code.find("Lcall ") and total_code.__contains__("Lcall "))
                or line.__contains__("Lcall ")) \
                    and not line.__contains__("return") and \
                    not push_flag and last_line.__contains__("push"):
                push_flag = True
                new_code += "pushra\n"
            if last_line.__contains__("push ") and total_code.startswith("Print") and \
                    (not total_code.__contains__("Lcall ") or total_code.find("Print") < total_code.find("Lcall ")) \
                    and not line.__contains__("return") and not line.__contains__("Lcall "):
                # print("ganddddddddd", last_line)
                last_line = ""
            if line.__contains__("Lcall "):
                push_flag = False
            if last_line.__contains__("*(") and (last_line.count("+") or last_line.count("*") > 1
                or last_line.count("-") or last_line.count("<") or last_line.count(">") or
                last_line.count("=") or last_line.count("&") or last_line.count("|") or
                last_line.count("%") or last_line.count("/")):
                # print("last_line", last_line)
                star = last_line[last_line.find("*("):]
                star = star[:star.find(")") + 1]
                in_star = last_line[last_line.find("*(") + len("*("):]
                in_star = in_star[:in_star.find(")")]
                new_code += "assign " + in_star + " = " + star + "\n"
                last_line = last_line.replace(star, in_star)
            new_code += last_line
        new_code += line
        self.code = new_code

    def function(self, args):
        # print("function", self.function_vars)
        self.function_class[args[0].children[0]] = "global"
        child = args[0].children
        pop_args = ""
        # print(child[3].children)
        if isinstance(child[1], str):
            add_to_code = child[1]
        else:
            add_to_code = child[0]
        # print(add_to_code)
        self.this_function_vars = self.function_vars[add_to_code]
        for var in self.function_vars[add_to_code][::-1]:
            pop_args += "pop " + var[1] + str(self.current_scope.number) + "\n"
            self.var_types[var[1] + str(self.current_scope.number)] = var[0]
        self.code += "return from " + add_to_code + "\n\n"
        before = self.code[:self.code.find("init_func")]
        after = self.code[(self.code.find("init_func") + 10):]
        self.code = before + add_to_code + ":\n" + pop_args + after
        return args[0]

    def var_field(self, args):
        # print("variable", args[0].children[0])
        self.this_class_vars[args[0].children[0][1]] = args[0].children[0][0]
        # print("this class", self.this_class_vars)
        for x in self.this_class_vars:
            self.var_types[x] = self.this_class_vars[x]
        return args

    def func_field(self, args):
        child = args[0].children
        # print("function", child)
        if child[1] is not None:
            self.function_types_specific["init_" + child[1]] = child[0]
        if isinstance(child[1], str):
            add_to_code = child[1]
            self.function_types["init_" + add_to_code] = 'return'
        else:
            add_to_code = child[0]
            self.function_types["init_" + add_to_code] = 'no_return'
        self.code += "return from init_" + add_to_code + "\n\n"
        before = self.code[:self.code.find("init_func")]
        after = self.code[(self.code.find("init_func") + 10):]
        self.code = before + "init_" + add_to_code + ":\n" + after
        return args

    def return_func(self, args):
        # print("return_func", args)
        if len(args):
            self.code += "push " + args[0] + " \n"
            self.code += "return \n"
            # print("return...\n\n", self.code, "\n\nre\n\n")
            return args[0]
        self.code += "return \n"
        return args

    def function_call(self, args):
        name = args[0]
        if name == "itod":
            t = self.make_temp()
            self.var_types[t] = "double"
            arg = self.tstack.pop()
            # print(arg)
            self.code = self.code[:-(7 + len(arg))]
            self.code += "arith " + t + " c= itod " + arg + "\n"
            return t
        elif name == "dtoi":
            t = self.make_temp()
            self.var_types[t] = "int"
            arg = self.tstack.pop()
            self.code = self.code[:-(7 + len(arg))]
            # print(arg)
            self.code += "arith " + t + " c= dtoi " + arg + "\n"
            return t
        elif name == "btoi":
            t = self.make_temp()
            self.var_types[t] = "int"
            arg = self.tstack.pop()
            self.code = self.code[:-(7 + len(arg))]
            self.code += "arith " + t + " c= btoi " + arg + "\n"
            return t
        elif name == "itob":
            t = self.make_temp()
            self.var_types[t] = "bool"
            arg = self.tstack.pop()
            self.code = self.code[:-(7 + len(arg))]
            # print(arg)
            self.code += "arith " + t + " c= itob " + arg + "\n"
            return t
        # print("function call", args, self.last_class)
        try:
            self.func_call = True
            self.last_code = self.code
            add = args[0]
            length = len(self.code)
            t = self.make_temp()
            t = [add, "correct_init_this", length, t]
            # print(t)
            # print("pop", self.code, "\n\npop\n\n")
        except:
            t = args[0]
        return t

    def print(self, args):
        # print(args)
        count = args
        # print("print", count)
        while len(count) and isinstance(count[0], list):
            count = count[0]
        count = len(count)
        self.code += "Lcall Print " + str(count) + "\n"
        # print(self.code, "\n\nhehe\n\n")

    def actuals(self, args):
        count = 0
        # self.code += "pushra\n"
        print(args, self.correct_after_dot)
        if len(args) > 1:
            for x in args[1]:
                if not isinstance(x, list):
                    count += 1
                    # if not str(x).__contains__("this"):
                    self.code += "push " + x + " \n"

    def tof(self, args):
        self.afterdot = False

    def end_of_after_dot_correction(self, args):
        self.correct_after_dot = False

    def push_args(self, args):
        # print("push_args", args)
        count = 0
        lee = []
        # self.push_args_later = ""
        # print("pushshhhh", self.code)
        for x in args:
            if not isinstance(x, list):
                lee.append(x)
        # print(self.code, "\n\nhaha\n\n")
        return lee

    def pop_scope(self, args):
        self.current_scope = self.current_scope.parent

    def push_scope(self, args):
        self.start_vars = True
        self.scope_counter += 1
        new_scope = Scope(self.current_scope, self.scope_counter)
        self.current_scope.children.append(new_scope)
        self.current_scope = new_scope

    def variable(self, args):
        ident = args[1]
        if self.is_funcy:
            self.current_scope.table[ident] = args[0]
        # print(self.current_scope.table, self.current_scope.number)
        return args

    def IDENT(self, iden):
        return str(iden)

    def exp_normal(self, args):
        # print("normal", args)
        self.afterdot = False
        try:
            # print(args[0].children)
            ret = args[0].children[0]
            self.tstack.append(ret)
            return ret
        except:
            #
            self.tstack.append(args[0])
            return args[0]

    def str_const(self, args):
        # print("strrrring")
        (str_con,) = args
        # print(str_con)
        return str_con

    def read_line(self, args):
        t = self.make_temp()
        self.var_types[t] = "string"
        self.code += "ReadLine " + t + " = ReadLine()" + "\n"
        return t

    def read_int(self, args):
        t = self.make_temp()
        self.var_types[t] = "int"
        self.code += "ReadInt " + t + " = ReadInt()" + "\n"
        return t

    def type(self, type):
        if len(type) == 1:
            (type,) = type
        else:
            type = type[0].strip("\"") + "[]"
        return type.strip("\"")

    int = lambda self, _: "int"
    double = lambda self, _: "double"
    str = lambda self, _: "string"
    bool = lambda self, _: "bool"
    null = lambda self, _: "null"

    def make_label(self):
        lab = "l" + str(self.lcounter)
        self.lcounter += 1
        return lab

    def make_temp(self):
        t = "tempo" + str(self.tcounter)
        while self.var_types.keys().__contains__(t):
            self.tcounter += 1
            t = "tempo" + str(self.tcounter)
        self.tcounter += 1
        return t
