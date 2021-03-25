"""
    [DESCRIPTION]: Python 3 Quick Sort.
"""
__title__ = "Quick sort"
__author__ = "Braiden Gole"
__version__ = "1.0.0"
__copyright__ = "Copyright 2021, Braiden Gole"


class QuickSort:
    """
    Name        :   QuickSort
    Purpose     :   This class will hold method that will assist in the
                    quicksort operations.
    """

    cpdef partition(self, numbers, start, end):
        cdef int low_point = start - 1
        cdef int pivot = numbers[end]

        cdef int temp = 0
        cdef int nums = 0
        for nums in range(start, end):
            if numbers[nums] <= pivot:
                low_point = low_point + 1
                temp = numbers[nums]
                numbers[nums] = numbers[low_point]
                numbers[low_point] = temp
        temp = numbers[low_point + 1]
        numbers[low_point + 1] = numbers[end]
        numbers[end] = temp
        return low_point + 1

    def qsort(self, numbers, start, end):
        if start < end:
            pivot = self.partition(numbers, start, end)
            self.qsort(numbers, start, pivot - 1)
            self.qsort(numbers, pivot + 1, end)

    def show(self, array):
        for spots in range(0, self.size):
            print(array[spots], end=" ")
