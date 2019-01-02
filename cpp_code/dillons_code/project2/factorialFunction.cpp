#include <iostream>

int factorial(int n);

int main()
{
    int userInput = 0;
    std::cout << "Enter your number: ";
    std::cin >> userInput;
    std::cout << "Factorial of " << userInput << " is: " << factorial(userInput) << std::endl;
    return 0;
}

int factorial(int n){
    return ((n == 0) ? 1 : n*factorial(n-1));
}