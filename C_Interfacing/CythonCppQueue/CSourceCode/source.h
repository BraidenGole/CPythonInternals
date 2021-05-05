/**
 * @file queueOp.h
 * @author Braiden Gole
 * @brief This is where we will store our Queue class.
 * @version 0.1
 * @date 2021-02-22
 * @copyright Copyright (c) Braiden Gole 2021
 */
#ifndef _QUEUEOP
#define _QUEUEOP "source.h"

/**     -- Class header comment
 *  Name        :   Queue
 *  Purpose     :   This class is created to hold methods that will provide
 *                  access to the structures operations.
 */
class Queue {

    private:
        
        int front;
        int rear;
        int peek;
        int size;

    public:
        
        int data;
        int currentSize;

        // Constructor.
        Queue();
        Queue(unsigned int size);

        // Destructor.
        ~Queue();

        // Accessors.
        int GetFront();
        int GetRear();
        int GetPeek(Queue* queue); // Special Get Method.
        int GetData();
        int GetInitSize();
        
        // Mutators.
        void SetFront(int front);
        void SetRear(int rear);

        // General Methods.
        Queue* EnQueue(Queue* queue, int data);
        Queue* DeQueue(Queue* queue);

        // Extra Methods.
        bool IsEmpty(Queue* queue);
        bool IsFilled(Queue* queue);
};
#endif