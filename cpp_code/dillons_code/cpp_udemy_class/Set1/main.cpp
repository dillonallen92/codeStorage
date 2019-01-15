#include <iostream>
#include <vector>

int main()
{
    bool playAgain = true;
    char userOption;
    // Vector notes
    do
    {
        std::cout << "Would you like to play again? (y/n)";
        std::cin >> userOption;
        if (userOption == 'y')
        {
            playAgain = true;
        }else
        {
            playAgain = false;
        }
    }while(playAgain);
}