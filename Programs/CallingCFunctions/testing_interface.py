import program

value = program.upTo(5)
print()
print(program.compare_words("Braiden".encode(), "Braiden".encode())) # True
print(program.compare_words("Braiden".encode(), "Braid3en".encode())) # False
print()
program.bubbleSort([1, 5, 3, 9, 4, 8, 6, 7])