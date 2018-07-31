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
    
    def insertInbetween(self, middle_node, newData):

        # Check if the node exists

        if middle_node is None:
            print("The node you requested is misisng")
            return
        
        # Now Place after the mentioned node

        NewNode = nodes.Node(newData)
        NewNode.nextval = middle_node.nextval
        middle_node.nextval = NewNode
        
    def removeItem(self, RemoveKey):

        # Setting the headval logic

        HeadVal = self.headval
        if HeadVal is not None:
            if HeadVal.dataval == RemoveKey:
                self.headval = HeadVal.nextval
                HeadVal = None
                return

        # Traverse list to find the key and remove the object, placing the next value in its place

        while HeadVal is not None:
            if HeadVal.dataval == RemoveKey:
                break
            prev = HeadVal
            HeadVal = HeadVal.nextval

        # Handles null head value

        if HeadVal == None:
            return
        
        prev.nextval = HeadVal.nextval

        HeadVal = None

        
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

# Add ( "Its wednesday my dudes ahhhh" ) after Wednesday and before Thursday
# Note that the nodes shifted so e2.nextval is now e3 from the original link

list1.insertInbetween(e2.nextval, "It's Wednesday my dudes, AHHHHHHH")
list1.listprint()
print("*"*20)

# Now I will remove the recent addition
list1.removeItem("It's Wednesday my dudes, AHHHHHHH")
list1.listprint()
print("*"*20)