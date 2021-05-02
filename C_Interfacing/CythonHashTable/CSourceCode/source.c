/**
 * @file source.c
 * @author Braiden Gole
 * @brief This file is filled of functions to interface with.
 * @version 0.1
 * @date 2021-05-01
 * @copyright Copyright (c) Braiden Gole 2021
 */
#include <stdio.h>

#include "source.h"

void prepareBuckets(struct HashNode* hashTable[], int size)
{
    for (int buckets = 0; buckets < size; buckets++)
    {
        hashTable[buckets] = NULL;
    }
}

struct HashNode* insertion(struct HashNode* hashTable[], struct HashNode* newNode, int hashValue)
{   
    if (hashTable[hashValue] == NULL)
    {   
        hashTable[hashValue] = newNode;
        return newNode;
    }
    else
    {   
        while (hashTable[hashValue] != NULL)
        {
            ++hashValue;

            // Wrap around.
            hashValue %= 16;
        }
        hashTable[hashValue] = newNode;
        return newNode;
    }
}

struct HashNode* lookup(struct HashNode* hashTable[], char* key, int hashValue)
{
    while (hashTable[hashValue] != NULL)
    {
        if ((strcmp(hashTable[hashValue]->key, key)) == 0)
        {
            return hashTable[hashValue];
        }
        
        ++hashValue;

        // Wrap around.
        hashValue %= 16;
    }
    return NULL;
}

struct HashNode* delete(struct HashNode* hashTable[], char* key, int hashValue)
{
    while (hashTable[hashValue] != NULL)
    {
        if ((strcmp(hashTable[hashValue]->key, key)) == 0)
        {
            struct HashNode* temp = hashTable[hashValue];
            hashTable[hashValue] = NULL;
            return temp;
        }
        ++hashValue;

        // Wrap around.
        hashValue %= 16;
    }
    return NULL;
}