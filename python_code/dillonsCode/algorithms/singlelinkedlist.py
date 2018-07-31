# Importing my nodes class because I am too lazy to retype

import nodes

# Creating the Singly Linked List class from the tutorial

class SinglyLinkedList:

    # Initialize the list

    def __init__(self):
        self.headval = None
    
    # Print the list

    def listprint(self):
        printval = self.headval
        while printval is not None:
            print(printval.dataval)
            printval = printval.nextval
    
    # Function to insert at beginning

    def insertAtBeginning(self, newData):
        NewNode = nodes.Node(newData)

        # Update the new nodes

        NewNode.nextval = self.headval
        self.headval = NewNode

    # Function to insert at end

    def insertAtEnd(self, newData):
        NewNode = nodes.Node(newData)

        # Check to see if this is the first addition to the list

        if self.headval is None:
            self.headval = NewNode
            return
        
        # Set laste value to the headval and transverse until None
        # Then add the NewNode as the last value

        laste = self.headval
        while(laste.nextval):
            laste = laste.nextval
        laste.nextval = NewNode
        

# Create the list

list1 = SinglyLinkedList()

# Insert the head value

list1.headval = nodes.Node("Mon")

# Create two extra nodes

e2 = nodes.Node("Tues")
e3 = nodes.Node("Wed")

# Create the link 

list1.headval.nextval = e2
e2.nextval = e3

# Print the list ( with stars for dividers )
print("*"*20)
print('First list print')
list1.listprint()

# Insert the new head val
list1.insertAtBeginning("Sun")
print("*"*20)
print("Ths is with the new inserted value at the start ('Sunday') ")

list1.listprint()

# Add Thursday to the end of the list

list1.insertAtEnd("Thurs")
print("*"*20)
print("This is now with ('Thurs') added to the end of the list")
list1.listprint()
print("*"*20)