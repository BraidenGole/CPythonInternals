import program

# The amount you enter here is the amount you must enqueue.
algo = program.BraidensCppQueue(10)

# Enqueue 10 items.
algo.enqueue(1)
algo.enqueue(2)
algo.enqueue(3)
algo.enqueue(4)
algo.enqueue(5)
algo.enqueue(6)
algo.enqueue(7)
algo.enqueue(8)
algo.enqueue(9)
algo.enqueue(10)

# Set a few values to 0.
algo.dequeue()
algo.dequeue()
algo.dequeue()

# Show the entire queue.
algo.show_queue()

algo.show_peek()

del algo