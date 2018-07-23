#include <iostream>
#include <cstdlib> // for rand() and srand()
#include <ctime>   // for std::time
#include <cmath>

int getRandomNumber(int min, int max, int previousSeed)
{
    //generate using srand() and clock as seed
    std::srand(static_cast<unsigned int>(std::time(0)) + previousSeed);
    for (int i = 0; i < previousSeed; i++)
    { //to shake things up even more
        std::rand();
    }

    //create a fraction that will always put the number returned by rand() between 0-1
    static const double fraction = (1.0 / (RAND_MAX + 1.0)); //note, if the 1.0's are not exactly "1.0" it messes up
    //get the range that we are guessing int
    int range = abs(max - min) + 1;

    return (min + static_cast<int>((fraction * range * std::rand())));
}

int main()
{
    //int array[9] = {9, 8, 7, 6, 5, 4, 3, 2, 1};
    while (1)
    {

        // lets make a random array
        int previousSeed = 99;
        int arrayMinLength = 10, arrayMaxLength = 80, arrayMinValue = 1, arrayMaxValue = 700;
        int randomNum = getRandomNumber(arrayMinLength, arrayMaxLength, previousSeed); // this will be the length of the array

        int array[randomNum] = {0};
        int lastRandom = 0; //purely for help debugging. Cant easily see inside arrays
        for (int i = 0; i < randomNum; i++)
        { // fills each index of the array with a random no.
            array[i] = getRandomNumber(arrayMinValue, arrayMaxValue, previousSeed);
            lastRandom = array[i];
            previousSeed = lastRandom;
        }
        int arrayLength = sizeof(array) / sizeof(array[0]);

        // print this array just to see what it looks like
        std::cout << "Input Array : \n";
        for (int i = 0; i < arrayLength; i++)
        {
            std::cout << array[i] << " ";
        }
        std::cout << "\n\n";

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
        std::cout << "Output Array : \n";
        for (int i = 0; i < arrayLength; i++)
        {
            std::cout << array[i] << " ";
        }
        std::cout<< "\n";
        std::cout << "Press any key and hit enter to run again";
        /*
        note: because no actual exit was implemented on this program,
        you have to make sure it closes by using the X at the top right 
        */

        char keyPressed = 0;
        std::cin>> keyPressed;
        std::cout << "\n";
    } 
    
}