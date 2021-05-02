import program

algo = program.HashTableAlgorithm()

key = bytes("Braiden", encoding="utf-8")
key2 = bytes("Brant", encoding="utf-8")
algo.insertion(key)
algo.insertion(key2)

lookup_1 = bytes("Braiden", encoding="utf-8")
algo.lookup(lookup_1)

deleteNode = bytes("Braiden", encoding="utf-8")
algo.delete(deleteNode)

algo.free_table()
