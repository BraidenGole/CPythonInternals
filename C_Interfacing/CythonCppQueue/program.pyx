# distutils: language = c++
# distutils: sources = CSourceCode/source.cpp
__title__ = "Braidens C++ Queue"
__author__ = "Braiden Gole"
__version__ = "1.0.0"
__copyright__ = "Copyright 2021, Braiden Gole"
__date__ = "2021-05-05"

from libc.stdio cimport printf
cimport cprogram

cdef class BraidensCppQueue:

    cdef cprogram.Queue* queue

    # Dynamically allocate the Queue instance.
    def __cinit__(self, size):
        self.queue = new cprogram.Queue(size)
        
    def enqueue(self, data):
        self.queue = self.queue.EnQueue(self.queue, data)

    def dequeue(self):
        self.queue = self.queue.DeQueue(self.queue)

    def show_peek(self):
        printf("\nPeek of queue: %i", self.queue.GetPeek(self.queue))

    def show_queue(self):
        for index in range(0, self.queue.GetInitSize()):
            printf("%i ", self.queue[index].data)

    # Deallocate the class instance !
    def __dealloc__(self):
        del self.queue
