"""
    [DESCRIPTION]: CPython Shell Sort Implementation.
"""
__title__ = "Shell sort"
__author__ = "Braiden Gole"
__version__ = "1.0.0"
__copyright__ = "Copyright 2021, Braiden Gole"
__date__ = "2021-06-17"

def shell_sort(array, size):
    cdef int index = 0
    gap = len(array) // 2
    cdef int gapReference = 0

    cdef int temp = 0
    while gap > 0:
        index = 0
        gapReference = gap
        for nums in range(gapReference, size):
            if array[index] > array[gapReference]:
                temp = array[index]
                array[index] = array[gapReference]
                array[gapReference] = temp
            index += 1
            gapReference += 1

        while index - gap != -1:
            if array[index - gap] > array[index]:
                temp = array[index - gap]
                array[index - gap] = array[index]
                array[index] = temp
            index -= 1
        gap //= 2