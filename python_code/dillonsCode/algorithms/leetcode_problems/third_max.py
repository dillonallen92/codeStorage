
# this problem is on leetcode and the point is to find the third max number in an unsorted list

# ex list
mylist = [3, 2, 1]
mylist2 = [2, 2, 3, 1]
mylist3 = [3, 1]
mylist4 = [1, 4, 2, 5, 7, 2, 1, 3, 2, 1]

def thirdmax(nums):
    if len(nums) == 0:
        return null
    elif len(nums) == 1:
        return nums
    elif len(nums) == 2:
        return nums.sort().pop()
    else:
        nums.sort()
        return list(set(nums))[-3]

print("This should return 1: " + str(thirdmax(mylist)))
print("This should return 4: " + str(thirdmax(mylist4)))