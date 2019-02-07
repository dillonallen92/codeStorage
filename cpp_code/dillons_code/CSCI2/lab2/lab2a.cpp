/*
    Dillon Allen
    Task: Write a function that calculates the power of an element, recursively
*/

#include <iostream>

int myPow(int a, int b);

int main()
{
    std::cout << " 3 to the 4th power: " << myPow(3,4) << std::endl;
    return 0;
}

int myPow(int a, int b)
{
   return( (b == 0) ? 1 : a*myPow(a, b-1));
}