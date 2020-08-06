from lark import Transformer


class Func:
    def __init__(self, name, ret_type, vars):
        self.name = name
        self.ret_type = ret_type
        self.vars = {}
        if vars is not None:
            for var in self.vars:
                self.vars[var[1]] = var[0]


class Class:
    def __init__(self, name):
        self.name = name
        self.size = 4
        self.vtable = "here be pointer to vtable"
        self.var_offsets = {}
        self.var_types = {}
        self.functions = {}
        self.parents = []
        self.is_finished = False


class SymbolTable(Transformer):
    def __init__(self):
        super().__init__()
        self.primitives = ["int", "bool", "double", "string"]
        self.classes = {}
        self.function_vars = {}
        self.has_finished = False

    def prep(self):
        self.has_finished = True

    def variable(self, args):
        return args

    def variable_decl(self, args):
        return args[0]

    def var_field(self, args):
        return args[0]

    def class_decl(self, args):
        # print(args[1])
        new_function_vars = {}
        for x in self.function_vars:
            if str(x).count("init_"):
                new_function_vars[args[1] + "_" + str(x)[str(x).find("_") + 1:]] = self.function_vars[x]
            else:
                new_function_vars[x] = self.function_vars[x]
        self.function_vars = new_function_vars
        class_name = args[1]
        if not (self.classes.keys().__contains__(class_name)):
            self.classes[class_name] = Class(class_name)
            self.has_finished = False
        the_class: Class = self.classes[class_name]
        fields = []
        for arg in args[1:]:
            if isinstance(arg, list):
                fields.append(arg)
            elif isinstance(arg, Func):
                the_class.functions[arg.name] = arg
            else:
                if not the_class.parents.__contains__(arg):
                    the_class.parents.append(arg)
        for field in fields:
            if not (the_class.var_offsets.keys().__contains__(field[1])):
                if self.primitives.__contains__(field[0].strip("[]")):
                    # print(field[1], the_class.name)
                    the_class.var_offsets[field[1]] = the_class.size
                    the_class.var_types[the_class.name + "." + field[1]] = field[0]
                    the_class.size += 4
                    the_class.var_types[field[1]] = field[0]
                    self.has_finished = False
                elif self.classes.keys().__contains__(field[0].strip("[]")) and self.classes[
                    field[0].strip("[]")].is_finished:
                    # print(field[1], the_class.name)
                    the_class.var_offsets[field[1]] = the_class.size
                    the_class.var_types[the_class.name + "." + field[1]] = field[0]
                    the_class.size += self.classes[field[0].strip("[]")].size
                    the_class.var_types[field[1]] = field[0]
                    self.has_finished = False
                else:
                    break
        else:
            the_class.is_finished = True

    def type(self, args):
        if len(args) == 1:
            (args,) = args
        else:
            args = args[0].strip("\"") + "[]"
        return args.strip("\"")

    def formals(self, args):
        if len(args) > 0:
            return args[0].children

    def func_field(self, args):
        lee = args[0].children
        if lee[2] is not None:
            if isinstance(lee[1], str):
                name = lee[1]
                ls = lee[3]
            else:
                name = lee[0]
                ls = lee[2]
            self.function_vars["init_" + name] = ls
        # print(self.function_vars)
        if len(lee) == 3:
            # print(lee, lee[0])
            return Func(lee[0], "void", lee[1])
        else:
            # print(lee, lee[1])
            return Func(lee[1], lee[0], lee[0])

    def IDENT(self, iden):
        # print(iden)
        return str(iden)

    int = lambda self, _: "int"
    double = lambda self, _: "double"
    str = lambda self, _: "string"
    bool = lambda self, _: "bool"
