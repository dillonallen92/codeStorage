

mylist = [1, 3, 4, 5, 7, 11, 9] #sum of 40

# the goal of the code written here is to recursively write a sum function instead of iteratively

def mySum(myList):
    if len(myList) == 0:
        return 0
    if len(myList) == 1:
        return myList[0]
    else:
        return myList.pop(0) + mySum(myList)

print("sum of list is: " + str(mySum(mylist)))