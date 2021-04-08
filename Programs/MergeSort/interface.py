import merge_sort

set_of_numbers = [55, 11, 99, 33, 66, 88, 22, 77, 44]
length_of_set = len(set_of_numbers)

sorted_set_of_numbers = merge_sort.partition(set_of_numbers, length_of_set)

# Output the sorted set of numbers.
for nums in range(0, length_of_set):
    print(sorted_set_of_numbers[nums], end=" ")