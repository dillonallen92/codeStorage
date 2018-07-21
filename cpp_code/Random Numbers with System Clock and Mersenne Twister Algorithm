// 5.9 Random Numbers using the system cloc.cpp : Defines the entry point for the console application.
//

#include "stdafx.h" // only for Visual Studio 
#include <cstdlib> // for rand() and srand()
#include <ctime> // for std::time()
#include <iostream>
#include <Windows.h> // for Sleep()
#include <iostream>
#include <random> // for std::random_device and std::mt19937



int main()
{
	// cast the system clock into the seed for the random number gen
	/*
	std::srand(static_cast<unsigned int>(std::time(0)));

	int x = std::rand();

	while (1) {
		std::srand(static_cast<unsigned int>(std::time(0)) + x);
		x = std::rand();
		std::cout << x << "\n";
		Sleep(500 + static_cast<double>(1 / x*x));
	}
	*/

	// "mersenne Twister algorithm for pseudo random no. gen

	std::random_device rd;
	std::mt19937 mersenne(rd()); // Create a mersenne twister, seeded using the random device

	 // choose min and max
	std::uniform_int_distribution<> die(1, 60);

	// Print a bunch of random numbers
	while (1) {
		std::cout << die(mersenne) << "\n";
		Sleep(500);// millis 
	}


    return 0;
}

