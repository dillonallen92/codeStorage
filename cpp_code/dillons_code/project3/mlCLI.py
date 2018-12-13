'''
    Command Line Interface for Machine Learning 
    Written by Dillon Allen 
    December 12th, 2018

    Using test file 
'''

# Imports

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import os

# Globals

fileName = ""
userInput = ""

def FileManager():
    fileName = ""
    if (fileName == ""):
        fileName = ""
        print("File Manager Menu")
        print("1. Display everything in pwd")
        print("2. Input filename")
        print("Enter mm for main menu")
        userInput = input("What would you like to do? ")
        if ( userInput == "mm"):
            main()
        if ( userInput == "1"):
            print(os.listdir())
            FileManager()
        if ( userInput == "2"):
            finput = input("Is the file a .txt or .csv? ( txt / csv ): ")
            if (finput == 'txt'):
                fname = input("Enter the filename ( without the .txt): ")
                fileName = fileName + fname + ".txt"
                print(fileName)
                yninput = input("Does this look right to you? ( y / n ):  ")
                if (yninput == 'y'):
                    EDA(fileName)
                if (yninput == 'n'):
                    FileManager()
            if (finput == "csv"):
                fname = input("Enter the filename ( without the .csv): ")
                fileName = fileName + fname + ".csv"
                print(fileName)
                yninput = input("Does this look right to you? ( y / n ):  ")
                if (yninput == 'y'):
                    EDA(fileName)
                if (yninput == 'n'):
                    FileManager()
            
def EDA(fileName):
    print(fileName)
    yninput = input("Is this the correct fileName? ( y / n ): ")
    if (yninput == "y"):
        df = pd.read_csv(fileName)
        done = False
        while ( done == False ):
            print("1. Display head of dataframe")
            print("2. Display dataframe sumamry")
            uInput = input("What would you like to see? ")
            if (uInput == '1'):
                print(df.head())
            if (uInput == '2'):
                print(df.describe())
            doneYet = input("Are you done yet? ( y / n ): ")
            if (doneYet == 'y'):
                done = True
            else:
                pass
    if (yninput == 'n'):
        FileManager()
    

def optionTwo():
    print("option Two")

def optionThree():
    print("option Three")

def main():
    print("Machine Learning Command Line Interface")
    print("1. File Manager ")
    print("2. Option 2")
    print("3. Option 3")
    print("4. Quit")

    userInput = input("What would you like to do? ")

    if ( userInput == "1" ):
        FileManager()
    if ( userInput == "2" ):
        optionTwo()
    if ( userInput == "3" ):
        optionThree()
    if ( userInput == "4" ):
        SystemExit

# Main statement here to start the program

if __name__ == '__main__':
    main()