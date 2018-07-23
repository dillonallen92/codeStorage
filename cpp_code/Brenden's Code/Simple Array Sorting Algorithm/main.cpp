#include <iostream>

int main()
{
    int array[9] = {9, 8, 7, 6, 5, 4, 3, 2, 1};

    int arrayLength = sizeof(array) / sizeof(array[0]);

    //lets organize the array from lowest to highest
    
    int smallestIndex = 0; //to get things started
    int smallest = array[0];

    //the inner loop finds the index of the smallest number in the range i=j to arraylength
    //the outer loop updates the array by swaping the smallest and the current iteration index
    for (int j = 0; j < arrayLength; j++)
    {
        smallestIndex = j;
        for (int i = j; i < arrayLength; i++)
        {
            if (array[smallestIndex] > array[i])
            {
                smallestIndex = i;
            }
        }

        if (array[smallestIndex] < array[j])
        {
            std::swap(array[smallestIndex], array[j]);
        }
    }

    //print new array
    for (int i = 0; i < arrayLength; i++)
    {
        std::cout << array[i];
    }
}