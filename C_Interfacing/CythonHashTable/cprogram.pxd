cdef extern from "CSourceCode/source.h":
    cdef struct HashNode:
        char* key
        int value

    void prepareBuckets(HashNode* hash_table[], int size)
    HashNode* insertion(HashNode* hashTable[], HashNode* newNode, int hashValue)
    HashNode* lookup(HashNode* hashTable[], char* key, int hashValue)
    HashNode* delete(HashNode* hashTable[], char* key, int hashValue)
    void showTable(HashNode* hashTable[], int size)