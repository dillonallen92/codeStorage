#include <iostream>

int main()
{

    int array[7] = {3, 2, 4, 7, 1, 9, 0};

    int arrayLength = sizeof(array) / sizeof(array[0]);


    //lets organize the array from lowest to highest
    //first find the smallest element
    int smallestIndex = 0; //to get things started
    int smallest = array[0];

    for (int j = 0; j < arrayLength; j++)
    {
        for (int i = j; i < arrayLength; i++)
        {
            if (array[smallestIndex] > array[i])
            {
                smallestIndex = array[i];
            }
        }

        if (array[smallestIndex]> array[j]){
            std::swap(array[smallestIndex], array[j]);
        }
        
    }

    //print new array
    for (int i = 0; i <arrayLength; i++){
        std::cout << array[i];
    }
}

