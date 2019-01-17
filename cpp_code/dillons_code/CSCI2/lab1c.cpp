/*
    Function Templates lab1c
    Dillon Allen

    Task: Write two c-type function templates called getMin() and getMax() that return the smaller or larger
          of the two arguments. Demonstrate the usage on datatypes int, double, char, and string.
*/

#include <iostream>
#include <string>

template <class T>
T getMin(T a, T b);

template <class T>
T getMax(T a, T b);

int main()
{
    
    std::cout << "Compare two ints (23 vs -65). Min: " << getMin(23, -65) << ". Max: " << getMax(23, -65) << '\n';
    std::cout << "Compare two doubles (2.4, -2.7). Min: " << getMin(2.4, -2.7) << ". Max: " << getMax(2.4, -2.7) << '\n';
    std::cout << "Compare two chars (c, f). Min: " << getMin('c', 'f') << ". Max: " << getMax('c', 'f') << '\n';
    std::cout << "Compare two strings (zebra, beach). Min: " << getMin(static_cast<std::string>("zebra"), static_cast<std::string>("beach")) << ". Max: " << getMax(static_cast<std::string>("zebra"), static_cast<std::string>( "beach")) << '\n';
    return 0;
}

template <class T>
T getMin(T a, T b)
{
    return((a>b) ? b : a);
}

template <class T>
T getMax(T a, T b)
{   
    return((a > b) ? a : b);
}