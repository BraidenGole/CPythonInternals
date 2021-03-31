"""
    [DESCRIPTION]: Python 3 Symbol table.
"""
__title__ = "Symbol table"
__author__ = "Braiden Gole"
__version__ = "1.0.0"
__copyright__ = "Copyright 2021, Braiden Gole"

import tabulate
import symtable

# Input
code = """
class Human:

    def __init__(self, name, last_name, email, phoneNumber):
        self.name = name
        self.last_name = last_name
        self.email = email
        self.phoneNumber = phoneNumber

    def __str__(self):
        return self.name + self.last_name

human = Human("Braiden", "Gole", "randomEmail@gmail.com", "519-743-9948")
"""

symbol_table = symtable.symtable(code, "symbols.py", "exec")

def show_symbol_table(table):
    print("Symtable {0} ({1})".format(table.get_name(), table.get_type()))
    print(tabulate.tabulate 
        (
            [
                (
                    symbol.get_name(),
                    symbol.is_global(),
                    symbol.is_local(),
                    symbol.get_namespaces(),
                    
                )
                # Loop through all of the symbol data.
                for symbol in table.get_symbols()
            ],
            headers = ["Name", "Global", "Local", "Namespaces"],
            tablefmt = "grid",
        )
    )
    # Does the table have any children?
    if table.has_children():
        for child in table.get_children():
            show_symbol_table(child)

show_symbol_table(symbol_table)
