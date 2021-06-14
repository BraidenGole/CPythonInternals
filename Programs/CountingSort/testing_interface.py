import counting

array_input = [-40, 60, -10, -10, 30, 20, 70, 70]
sorted_array = counting.counting_sort(array_input)

for nums in range(0, len(sorted_array)):
    print(sorted_array[nums], end=" ")