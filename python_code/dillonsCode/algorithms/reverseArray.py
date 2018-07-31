inputArr = [1,4,3,2]

# HackerRank reverse array challenge

def reverseArray(arr):
    size = len(arr)
    lastIndex = size-1
    iterations = size/2

    # use a temp swap method 

    for i in range(0, round(iterations)):
        temp = arr[lastIndex]
        arr[lastIndex] = arr[i]
        arr[i] = temp
        lastIndex -= 1

print(inputArr) # Prints the initial array
reverseArray(inputArr) # Reverses
print(inputArr) # Prints the reversed array