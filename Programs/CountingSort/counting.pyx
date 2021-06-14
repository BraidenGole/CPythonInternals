"""
    [DESCRIPTION]: CPython Counting Sort Implementation.
"""
__title__ = "Counting Sort"
__author__ = "Braiden Gole"
__version__ = "1.0.0"
__copyright__ = "Copyright 2021, Braiden Gole"
__date__ = "2021-06-14"

def counting_sort(array):

    cdef int length_of_array = len(array)
    cdef int nums

    # Find the maximum number in the array.
    cdef int maximum = int(max(array))
    cdef int minimum = int(min(array))

    # Initialize the arrays with all 0's
    cdef int range_of_numbers = maximum - minimum + 1
    output = [0 for nums in range(length_of_array)]
    count = [0 for nums in range(range_of_numbers)]
    
    # Storing the count of each number at its index.
    cdef int number = 0
    for nums in range(0, length_of_array):
        number = array[nums] - minimum
        count[number] += 1
    
    # Storing a cumulative sum.
    for nums in range(1, len(count)):
        count[nums] += count[nums - 1]

    # Look for the index of each number in the main array
    cdef int index = 0
    for nums in range(length_of_array - 1, -1, -1):
        number = array[nums] - minimum
        index = count[number] - 1
        output[index] = array[nums]
        count[number] -= 1
 
    for nums in range(0, length_of_array):
        array[nums] = output[nums]
    return array
