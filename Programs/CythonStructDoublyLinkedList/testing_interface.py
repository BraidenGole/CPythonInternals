import program

algo = program.DoublyLinkedList()

node_1 = bytes("Braiden", encoding="utf-8")
node_2 = bytes("Brant", encoding="utf-8")
node_3 = bytes("Kim", encoding="utf-8")
node_4 = bytes("Dave", encoding="utf-8")

algo.create(node_1)
algo.create(node_2)
algo.create(node_3)
algo.create(node_4)

find_1 = bytes("Braiden", encoding="utf-8")
replace_1 = bytes("BRAIDEN", encoding="utf-8")

find_2 = bytes("Brant", encoding="utf-8")
replace_2 = bytes("BRANT", encoding="utf-8")

algo.update(find_1, replace_1)
algo.update(find_2, replace_2)

delete_1 = bytes("BRAIDEN", encoding="utf-8")
algo.delete(delete_1)

delete_2 = bytes("Kim", encoding="utf-8")
algo.delete(delete_2)

algo.show_all()
