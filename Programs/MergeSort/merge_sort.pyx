"""
    [DESCRIPTION]: CPython Merge sort.
"""
__title__ = "Merge Sort"
__author__ = "Braiden Gole"
__version__ = "1.0.0"
__copyright__ = "Copyright 2021, Braiden Gole"
__date__ = "2021-04-08"

from libc.stdlib cimport malloc, free

# This function will merge each halfs into one whole.
def merge(half, other_half, full_size, half_size, other_half_size):
    
    cdef int *sorted_set = <int*> malloc(full_size * sizeof(int))
    if not sorted_set:
        raise MemoryError()

    cdef int half_iter = 0
    cdef int other_half_iter = 0
    cdef int size_of_final = 0
    
    while ((half_iter < half_size) and (other_half_iter < other_half_size)):
        if (half[half_iter] <= other_half[other_half_iter]):
            sorted_set[size_of_final] = half[half_iter]
            half_iter = half_iter + 1
        else:
            sorted_set[size_of_final] = other_half[other_half_iter]
            other_half_iter = other_half_iter + 1
        size_of_final = size_of_final + 1

    while (half_iter < half_size):
        sorted_set[size_of_final] = half[half_iter]
        half_iter = half_iter + 1
        size_of_final = size_of_final + 1

    while (other_half_iter < other_half_size):
        sorted_set[size_of_final] = other_half[other_half_iter]
        other_half_iter = other_half_iter + 1
        size_of_final = size_of_final + 1
    sorted_data = convert_c_object_to_python(sorted_set, full_size)

    free(sorted_set)
    return sorted_data

# This function will take in a C pointer and convert it back to a python object.
cdef convert_c_object_to_python(int *set_of_data, int size):
    cdef int nums
    python_list = []
    for nums in range(0, size):
        python_list.insert(nums, set_of_data[nums])
    return python_list

# This function will partition the full array into two separate halves.
def partition(data_set, int size):
    cdef int *half
    cdef int *other_half

    try:
        half = <int*> malloc(size * sizeof(int))
        other_half = <int*> malloc(size * sizeof(int))
    except MemoryError:
        print("Out of memory !")
        return None
    
    # Transfer the numbers to each half.
    middle_point = size // 2

    cdef int size_of_half = 0
    cdef int size_of_other_half = 0

    # Split each half based on the middle point.
    cdef int nums
    for nums in range(0, size):
        if (nums <= middle_point):
            half[size_of_half] = data_set[nums]
            size_of_half = size_of_half + 1
        else:
            other_half[size_of_other_half] = data_set[nums]
            size_of_other_half = size_of_other_half + 1

    # Convert to a python object so we can use sort().
    new_half = convert_c_object_to_python(half, size_of_half)
    new_other_half = convert_c_object_to_python(other_half, size_of_other_half)

    free(half)
    free(other_half)

    new_half.sort()
    new_other_half.sort()

    sorted_list = merge(new_half, new_other_half, size, size_of_half, size_of_other_half)
    return sorted_list