# this is taken from a website on algorithms

# example code here

class daynames:
    def __init__(self, dataval = None):
        self.dataval = dataval
        self.nextval = None

# Create instances of days

e1 = daynames('Mon')
e2 = daynames('Tues')
e3 = daynames('Wed')
e4 = daynames('Thurs')
e5 = daynames('Fri')
e6 = daynames('Sat')
e7 = daynames('Sun')

# Create the pointers from one day to the next

e1.nextval = e2
e2.nextval = e3
e3.nextval = e4
e4.nextval = e5
e5.nextval = e6
e6.nextval = e7

# Initialize the first value

thisvalue = e1

# Transverse the nodes

while thisvalue:
    print(thisvalue.dataval)
    thisvalue = thisvalue.nextval

# example code end
