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
        self.size = 0
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
        self.function_types = {}
        self.function_types_specific = {}
        self.has_finished = False
        self.var_types = {}
        # self.class_numbers = {}
        # self.counter = 0

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
        # self.class_numbers
        # self.counter += 1
        new_function_types = {}
        for x in self.function_types:
            if str(x).__contains__("init_"):
                # print(args[1], x, x[(x.find["_"] + 1):])
                new_function_types[args[1] + x[x.find("_"):]] = self.function_types[x]
            new_function_types[x] = self.function_types[x]
        self.function_types = new_function_types
        new_function_types = {}
        for x in self.function_types_specific:
            if str(x).__contains__("init_"):
                # print(args[1], x, x[(x.find["_"] + 1):])
                new_function_types[args[1] + x[x.find("_"):]] = self.function_types_specific[x]
            new_function_types[x] = self.function_types_specific[x]
        self.function_types_specific = new_function_types
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
        #print(args)
        for arg in args[2:-1]:
            if isinstance(arg, list):
                fields.append(arg)
            elif isinstance(arg, Func):
                the_class.functions[arg.name] = arg
            else:
                if not the_class.parents.__contains__(arg):
                    if self.classes.keys().__contains__(arg):
                        parent: Class = self.classes[arg]
                    else:
                        return
                    if not parent.is_finished:
                        return
                    for v in parent.var_offsets.keys():
                        the_class.var_offsets[v] = parent.var_offsets[v]
                        the_class.var_types[v] = parent.var_types[v]
                    the_class.size = parent.size
                    for f in parent.functions.keys():
                        the_class.functions[f] = parent.functions[f]
                    for p in parent.parents:
                        the_class.parents.append(p)
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

    def function(self, args):
        child = args[0].children
        # print(child)
        if child[1] is not None and isinstance(child[1], str):
            self.function_types_specific[child[1]] = child[0]
        if isinstance(child[1], str):
            add_to_code = child[1]
            self.function_types[add_to_code] = 'return'
            if child[3] is not None:
                self.function_vars[add_to_code] = child[3]
            else:
                self.function_vars[add_to_code] = []
        else:
            add_to_code = child[0]
            self.function_types[add_to_code] = 'no_return'
            if child[2] is not None:
                self.function_vars[add_to_code] = child[2]
            else:
                self.function_vars[add_to_code] = []
        return args

    def func_field(self, args):
        lee = args[0].children
        child = lee
        # print("function", child)
        if child[1] is not None and isinstance(child[1], str):
            self.function_types_specific["init_" + child[1]] = child[0]
        if isinstance(child[1], str):
            add_to_code = child[1]
            self.function_types["init_" + add_to_code] = 'return'
        else:
            add_to_code = child[0]
            self.function_types["init_" + add_to_code] = 'no_return'

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

    def global_type(self, args):
        print("global", args)
        self.var_types[args[0][1]] = args[0][0]