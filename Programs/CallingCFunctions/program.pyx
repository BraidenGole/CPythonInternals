#Braiden Gole
from libc.stdio cimport printf
from libc.string cimport strcmp, strlen

cpdef int upTo(int number):
    cdef int nums
    for nums in range(0, number):
        printf("%i ", nums)
    return nums

cpdef compare_words(char* word_one, char* word_two):
    cdef int match = strcmp(word_one, word_two)
    if match == 0:
        return True
    return False

def bubbleSort(array):
    cdef int sort = 0
    cdef int nums = 0
    cdef int length = len(array)
    cdef int temp = 0

    for sort in range(0, length - 1):
        for nums in range(0, length - 1):
            if (array[nums] > array[nums + 1]):
                temp = array[nums]
                array[nums] = array[nums + 1]
                array[nums + 1] = temp
    
    cdef int test = 0
    for test in range(0, length):
        print(array[test])
    
