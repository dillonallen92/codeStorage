// Ch5 Comprehensive, High-Low Game.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <Windows.h>
#include <ctime>
#include <cstdlib>
#include <math.h>



int getRandomNumber(int min,int max) {
	//generate using srand() and clock as seed
	std::srand(static_cast<unsigned int>(std::time(0)));
	std::rand();

	//create a fraction that will always put the number returned by rand() between 0-1
	static const double fraction = (1.0 / (RAND_MAX + 1.0));  //note, if the 1.0's are not exactly "1.0" it messes up
	//get the range that we are guessing int
	int range = abs(max - min) + 1;

	return (min + static_cast<int>( (fraction * range * std::rand())));
}


bool checkGuess(int number, int guess) {
	if (guess == number) {
		std::cout << "You guess correctly, the number was " << number << "\n";
		return true; 
	}
	else if (guess > number) {
		std::cout << "Your guess " << guess << " was too high \n";
		return false; 
	}
	else if (guess < number) {
		std::cout << "Your guess " << guess << " was too low\n";
		return false;
	 }
}


int main()
{
	bool exitGame = false;
	

	while (!exitGame) {
		std::cout << "\n\nChoose minimum: \n";
		int min;
		std::cin >> min;
		std::cout << "Choose maximum: \n";
		int max;
		std::cin >> max;

		// get the random number
		int number = getRandomNumber(min, max);
		
		std::cout << "Guess a number between " << min << "-" << max << " \n";
		bool guessing = true;
		bool correct = false;
		int guessCount = 0;

		while (guessing && (guessCount !=5)) {
			
			int guess; 
			std::cin >> guess; 
			bool guessedCorrectly = checkGuess(number, guess);
			if (guessedCorrectly) {
				guessing = false;
				correct = true;
				guessCount++;
			}
			else {
				std::cout << "Try again\n";
				guessCount++;
			}

		}

		if (correct) {
			std::cout << guessCount << " guesses\n";
		}
		std::cout << "Would you like to play again? (y/n)\n";
		char playAgain;
		std::cin >> playAgain;
		playAgain == 'y' ? (exitGame = false) : (exitGame = true);
		
		
	}



    return 0;
}

