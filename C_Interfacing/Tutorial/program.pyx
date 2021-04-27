# distutils: sources = CSourceCode/source.c
"""
"""

cimport cprogram

def say_hello():
    cprogram.hello()