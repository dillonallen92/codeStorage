/*
    Function Templates lab1c
    Dillon Allen

    Task: Write two c-type function templates called getMin() and getMax() that return the smaller or larger
          of the two arguments. Demonstrate the usage on datatypes int, double, char, and string.
*/

#include <iostream>
template <class T>
T getMin(T a, T b);

template <class T>
T getMax(T a, T b);

int main()
{
    
    std::cout << "Compare two ints (23 vs -65). Min: " << getMin(23, -65) << ". Max: " << getMax(23, -65);
    std::cout << "Compare two doubles (2.4, -2.7). Min: " << getMin(2.4, -2.7) << ". Max: " << getMax(2.4, -2.7);
    std::cout << "Compare two chars (c, f). Min: " << getMin('c', 'f') << ". Max: " << getMax('c', 'f');
    std::cout << "Compare two strings (brenden, dumb). Min: " << getMin("brenden", "dumb") << ". Max: " << getMax("brenden", "dumb");
    return 0;
}

template <class T>
T getMin(T a, T b)
{
    return((a < b) ? a : b);
}

template <class T>
T getMax(T a, T b)
{
    return((a > b) ? a : b);
}