cdef extern from "CSourceCode/source.h":
    cdef cppclass Queue:
        int front;
        int rear;
        int peek;
        int size;
        int data;
        int currentSize;

        Queue()
        Queue(unsigned int size)

        int GetFront()
        int GetRear()
        int GetPeek(Queue* queue)
        int GetData()
        int GetInitSize()

        void SetFront(int front)
        void SetRear(int rear)

        Queue* EnQueue(Queue* queue, int data)
        Queue* DeQueue(Queue* queue)

        bint IsEmpty(Queue* queue)
        bint IsFilled(Queue* queue)