# Triply-linked list
Triply-linked list is a linked list with 3 pointers for each nodes.
I tried to implement it and able to demonstrate that it is doable using data type. 
Searching would be feasible too with pattern matching for each node. 

However, it is **not by any mean could be called a LinkedList anymore**.
In traditional LinkedList you can move back and forth in a concise and clear way, because it has two pointer that points preceeding node and the node after it.

In a triply-linked list, you can either having two option of pointers for moving forward, or having two option of pointers for moving backward. This ambiguous term will make the nature of LinkedList pointless, as LinkedList is a one-dimensional data structure. 

```haskell

--  In doubly-linked list
[Points Null, Node 1, Points right] 
[Points left, Node 5, Points right] 
[...]

-- In Triply-linked list
[Points Null, Points ??, Node 1, Points right] 
[Points left, Points ??, Node 2, Points right] 
[...]

```

There are a list that utilize this three pointers, it's called _**Binary Tree**_ structure, where two pointers referencing the left and right child, and the third pointers points to a parent.