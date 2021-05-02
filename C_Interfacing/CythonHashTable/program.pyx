# distutils: sources = CSourceCode/source.c
"""
    [DESCRIPTION]: CPython Hash Table Algorithm.

    NOTE: I do not recommend printing inside of functions that are not
          entirely dedicated to just printing output but an exception has been
          made here.

    NOTE: This was not built off of existing C code but built around CPython and C.
"""
__title__ = "Hash Table Algorithm (closed addressed)"
__author__ = "Braiden Gole"
__version__ = "1.0.0"
__copyright__ = "Copyright 2021, Braiden Gole"
__date__ = "2021-05-02"

from libc.stdio cimport printf
from libc.stdlib cimport malloc, free
cimport cprogram

cdef class HashTableAlgorithm:

    cdef cprogram.HashNode* hash_table[16]
    cdef int count

    def __cinit__(self):
        self.count = 0
        cprogram.prepareBuckets(self.hash_table, 16)

    cdef hash_function(self, key):
        cdef unsigned long long hash_value = 0
        for letters in range(0, len(key)):
            hash_value += key[letters]
            hash_value *= key[letters]
        return hash_value % 16
    
    def insertion(self, key):
        if (self.count == 15):
            print("Table full !")
            return

        cdef int hash_value = 0

        cdef cprogram.HashNode* new_hash_node = NULL
        new_hash_node = <cprogram.HashNode*>malloc(sizeof(cprogram.HashNode))
        if not new_hash_node:
            raise MemoryError()

        # Call the hash function to calculate the hash value.
        hash_value = self.hash_function(key)

        new_hash_node.key = key
        new_hash_node.value = hash_value
        
        inserted_node = cprogram.insertion(self.hash_table, new_hash_node, hash_value)
        printf("Inserted: %s %i\n", inserted_node.key, inserted_node.value)
        self.count += 1

    def lookup(self, key):
        cdef int index = self.hash_function(key)
        node = cprogram.lookup(self.hash_table, key, index)
        if (node != NULL):
            printf("Found: %s\n", node.key)
    
    def delete(self, key):
        cdef int index = self.hash_function(key)
        deleted_node = cprogram.delete(self.hash_table, key, index)
        printf("deleted: %s", deleted_node.key)

    def free_table(self):
        cdef int buckets
        for buckets in range(0, 16):
            free(self.hash_table[buckets])