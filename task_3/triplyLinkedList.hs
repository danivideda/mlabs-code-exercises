data LinkedList a
    = Node a (LinkedList a)
    | End
    deriving (Show)

data TriplyLinkedList a
    = TNode a (TriplyLinkedList a) (TriplyLinkedList a)
    | TEnd
    deriving (Show)

node1 = Node 1 End
node2 = Node 2 node1
node3 = Node 3 node2

tNode1 = TNode 1 TEnd TEnd
tNode2 = TNode 2 TEnd tNode1
tNode3 = TNode 3 TEnd tNode2

main = do
    print node3
    print tNode3