/*
    Functions and Pointers, Lab1b
    Dillon Allen

    Task: Create two regular c-type functions ( with separation ). Both functions will have one integer array
          parameter and one constant integer parameter that can be used to pass the array size.
        1. One function simply outputs the values stored in each element of the array
        2. The other function will output the address of each of the elements in the array. Cast the 
           addresses out to integers and note that they are sequential.
*/

#include <iostream>

void printArrayElements(int* arr, const int size);
void printArrayElementAddress(int* arr, const int size);

int main()
{
    int arr[10] { 0 };
    int* aPtr = arr;
    int size = 10;

    printArrayElements(aPtr, size);
    printArrayElementAddress(aPtr, size);

    return 0;
}

void printArrayElements(int* arr, const int size)
{
    for(int i = 0; i < size; i++)
        std::cout << *(arr + i) << std::endl;
}

void printArrayElementAddress(int* arr, const int size)
{
    for(int i = 0; i < size; i++)
        std::cout << (std::intptr_t) (arr+i) << std::endl;
}