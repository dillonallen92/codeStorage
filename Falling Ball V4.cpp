// Falling Ball V4.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <Windows.h>
#include <cmath>
#include <ctime>
#include <stdlib.h>
using namespace std;

const double gravity{ 9.8 };


// take in an initial height, velicity, elapsed time and calculate the new height using the kinematic equation
double calculateNewHeight(double previousHeight, double Vnot, double timeElapsed) {
	return previousHeight - (Vnot * timeElapsed) - (.5 * gravity * pow(timeElapsed, 2));
}


int main()
{
	
	
	//setup
	while (true) {
		//Sleep(3000);
		int updatePauseMilis = 100; // this will be how long a pause before another iteration
		cout << "You are dropping a ball from a tower... \n";
		cout << "Choose your update speed (integer 1-6): \n";
		int gameSpeed = 1;
		cin >> gameSpeed;
		switch (gameSpeed) {
		case 1:
			updatePauseMilis = 100;
			break;
		case 2:
			updatePauseMilis = 75;
			break;
		case 3: 
			updatePauseMilis = 50;
			break;
		case 4:
			updatePauseMilis = 25;
			break;
		case 5:
			updatePauseMilis = 10;
			break;
		case 6:
			updatePauseMilis = 1;
			break;
		default:
			updatePauseMilis = 100;
			break;
		}
		cout << "How high is the tower (float 1-1000 meters)?...\n";
		double beginHeight;
		cin >> beginHeight;
		system("CLS");//clears the previous screen
		double previousHeight = beginHeight;
		double currentHeight = beginHeight - .001; //offset minus 1 to jumpstart the calculation because it is impossible to calculate the instantaneous next position without calculus
		//gets current time for all 3 variables 
		clock_t startTime = clock();//used to calculate final time
		clock_t finishTime = clock();//used to calculate final time
		clock_t previousTime = clock();
		clock_t currentTime = clock();
		double deltaY = 0;
		double deltaT = 0;
		



		while (currentHeight > 0)
		{
			Sleep(updatePauseMilis);
			//update current time after the sleep period (so that it is not instantaneous)
			currentTime = clock();
			//deltaT = (currentTime - previousTime)/1000;
			deltaT = difftime(currentTime, previousTime) / 1000;
			//calculate initial velocity for each run through (will be zero on first run through)
			double Vnot = deltaY / deltaT;
			double Velocity = Vnot + gravity * deltaT;

			//send previous height, initial velocity and change in time to calc new height
			currentHeight = calculateNewHeight(previousHeight, Velocity, deltaT);
			//calc change in height for next run through
			deltaY = previousHeight - currentHeight;

			if (currentHeight > 0) // need to check again because the height could change after while loop condition
			{
				std::cout << "Time: "<< difftime(currentTime, startTime)/1000 << " seconds, " << "Height " << currentHeight <<" meters" << std::endl;
			}
			else
			{
				std::cout << "Time: " << difftime(currentTime, startTime)/1000 << " seconds, " << "Height " << "0" << " meters" << std::endl;
			}
			
			//set the new previous time as this current time 
			previousTime = currentTime;
			//set the new previous height as this current height
			previousHeight = currentHeight;
			//return 0;
		}
		cout << "\n\n The ball took ";
		finishTime = clock();
		cout << "\n" << difftime(finishTime, startTime) / 1000;
		cout << " Seconds to hit the ground\n\n";

	}
	
	
	
	return 0;
}
