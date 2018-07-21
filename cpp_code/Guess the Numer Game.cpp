// Ch5 Comprehensive, High-Low Game.cpp : Defines the entry point for the console application.
//

#include "stdafx.h" // for VS only
#include <iostream> 
#include <Windows.h> // for Sleep(milliseconds)
#include <ctime> // for std::time(0) to get clock
#include <cstdlib> // for rand() and srand()
#include <math.h> // for abs() absolute value
#include <stdlib.h>// for system("CLS") to clear the console



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
		std::cout << "Your guess " << guess << " was too high \n\n";
		return false; 
	}
	else if (guess < number) {
		std::cout << "Your guess " << guess << " was too low\n\n";
		return false;
	 }
}


int getAndCheckInput() { // attempts to error handle for bad input during the game
	std::cin.clear(); 
	bool invalid = true;
	

	while (invalid) {
		int x;
		
		std::cin >> x;
		//std::cin.ignore(32767, '\n');
		if(std::cin.fail()){ //returns true if cin fails to extract 
			std::cout << "Input unrecognized, try again. \n";
			std::cin.clear();  // resets input steam
			std::cin.ignore(32767, '\n');   // ignore remaining characters and restart 
			
		}
		else {
			invalid = false; // this is to prevent the loop from running longer
			return x;
		}
	}
	
}



bool checkPlayAgain() { // checks for bad input at the end 
	std::cout << "Would you like to play again? (y/n)\n";
	
	bool invalid = true;
	while (invalid) {
		char playAgain;
		std::cin >> playAgain;
		
		if (std::cin.fail()) {  // its best to check if it failed first
			std::cout << "Input unrecognized, try again. \n";
			std::cin.clear();
			std::cin.ignore(32767, '\n');
			
		}
		else if (playAgain == 'y'){
			std::cin.clear();
			std::cin.ignore(32767, '\n');
			invalid = false;
			return true;
			break;
			
		}
		else if (playAgain == 'n') {
			invalid = false;
			return false; 
			break;
			
		}
		else {
			std::cout << "Input unrecognized, try again. \n";
			std::cin.clear();
			std::cin.ignore(32767, '\n');
		}
	}
	
}




int main()
{
	bool exitGame = false;
	
	system("CLS"); // clears console
	while (!exitGame) {
		std::cout << "\n\nChoose minimum: \n";
		int min = getAndCheckInput();
		
		std::cout << "Choose maximum: \n";
		int max = getAndCheckInput();

		// get the random number
		int number = getRandomNumber(min, max);
		
		std::cout << "Guess an integer between " << min << "-" << max << " \n";
		bool guessing = true;
		bool correct = false;
		int guessCount = 0;

		while (guessing && (guessCount !=5)) {
			
			int guess = getAndCheckInput(); 
			 
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
		
		bool playAgain = checkPlayAgain();
		playAgain ? (exitGame = false) : (exitGame = true); //sweet ternary operator 
		
		
	}



    return 0;
}
