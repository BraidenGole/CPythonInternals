"""
    [DESCRIPTION]: CPython (struct) Doubly linked list implementation.
"""
__title__ = "Doubly Linked List"
__author__ = "Braiden Gole"
__version__ = "1.0.0"
__copyright__ = "Copyright 2021, Braiden Gole"
__date__ = "2021-05-01"

from libc.stdio cimport printf
from libc.stdlib cimport malloc, free

cdef struct Node
cdef struct Node:
    char* word
    Node* prev
    Node* next

cdef class DoublyLinkedList:

    cdef Node* head
    cdef Node* tail
    cdef Node* last_node
    cdef Node* next_node

    def __cinit__(self):
        self.head = NULL
        self.tail = NULL
        self.last_node = NULL
        self.next_node = NULL

    def create(self, word):
        cdef Node* new_node = <Node*>malloc(sizeof(Node))
        if not new_node:
            raise MemoryError()

        new_node.word = word
        new_node.prev = NULL
        new_node.next = NULL

        if (self.head == NULL):
            self.head = new_node
            self.tail = new_node
        elif (self.head.word >= new_node.word):
            new_node.next = self.head
            self.head.prev = new_node
            self.head = new_node
        else:
            last_node = self.head
            next_node = self.head.next
            while (next_node != NULL):
                if (next_node.word >= new_node.word):
                    break
                last_node = next_node
                next_node = next_node.next

            new_node.prev = last_node
            new_node.next = next_node
            last_node.next = new_node

        if (next_node == NULL):
            self.tail = new_node
        else:
            next_node.prev = new_node
    
    def update(self, word_to_update, new_word):
        cdef Node* head_ref = NULL
        head_ref = self.head

        while (head_ref != NULL):
            if (head_ref.word == word_to_update):
                head_ref.word = new_word
                return
            head_ref = head_ref.next

    def delete(self, word_to_delete):
        cdef Node* this_node = NULL
        cdef Node* node_previous = NULL
        cdef Node* node_ahead = NULL
        cdef Node* before = NULL
        cdef Node* after = NULL

        this_node = self.head

        while (this_node != NULL):
            if (this_node.word == word_to_delete):
                if (this_node == self.head and this_node == self.tail):
                    self.head = NULL
                    self.tail = NULL
                    free(this_node)
                    return
                if (this_node == self.head):
                    node_ahead = this_node.next
                    self.head = this_node.next
                    node_ahead.prev = NULL
                else:
                    if (this_node == self.tail):
                        node_previous = this_node.prev
                        self.tail = this_node.prev
                        node_previous.next = NULL
                    else:
                        

                        before = this_node.prev
                        after = this_node.next

                        after.prev = before
                        before.next = after
                free(this_node)
            this_node = this_node.next
    
    def free_allocated_mem(self):
        while (self.head != NULL):
            free(self.head)
            self.head = self.head.next

    def show_all(self):
        while (self.head != NULL):
            printf("%s\n", self.head.word)
            self.head = self.head.next
