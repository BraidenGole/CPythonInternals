/**
 * @file source.h
 * @author Braiden Gole
 * @brief This file is used to hold our struct definitions and function prototypes.
 * @version 0.1
 * @date 2021-04-27
 * @copyright Copyright (c) Braiden Gole 2021
 */
#ifndef SOURCE
#define SOURCE "source.h"

struct HashNode
{
    char* key;
    int value;
};

// Function prototypes.
void prepareBuckets(struct HashNode* hashTable[], int size);
struct HashNode* insertion(struct HashNode* hashTable[], struct HashNode* newNode, int hashValue);
struct HashNode* lookup(struct HashNode* hashTable[], char* key, int hashValue);
struct HashNode* delete(struct HashNode* hashTable[], char* key, int hashValue);
#endif