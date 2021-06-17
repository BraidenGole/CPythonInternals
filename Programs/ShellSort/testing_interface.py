import shell

input_array = [11, -44, 22, 33, 66, 55, -99, 77, 88]
size_of_input_array = len(input_array)
shell.shell_sort(input_array, size_of_input_array)

for nums in range(0, size_of_input_array):
    print(input_array[nums], end=" ")