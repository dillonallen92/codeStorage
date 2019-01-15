/*
    Array Practice Lab 1a
    Dillon Allen
    
    Task: Create an integer array of 10 elements and populate it with random even numbers
          between 2 and 100
        1. Output the Contents of the array and the associated memory address explicitly.
        2. Achieve the same output using references only. In other words, use pointers, pointer arithmetic,
           and the dereferencing operator. 
*/
#include <iostream>
#include <ctime>
#include <stdlib.h>
#include <cmath>

int main()
{
    // create a seed for random number
    // Solution to 1
    srand(time(NULL));
    int arr[10] { 0 };
    for(int i = 0; i < 10; i++)
        arr[i] = 2*abs((rand()%50))+2;
    for (auto num : arr )
        std::cout << num << " at address " << &num << std::endl;

    std::cout << "-------------------------" << std::endl;

    // Solution to 2
    int* aPtr = arr;
    for(int i = 0; i < 10; i ++)
        std::cout << *(aPtr + i) << " at address " << aPtr + i << std::endl;
    
    return 0;
}