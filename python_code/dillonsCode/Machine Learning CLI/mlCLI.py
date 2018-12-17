'''
    Command Line Interface for Machine Learning 
    Written by Dillon Allen 
    December 12th, 2018

    Using test file: StudentsPerformance.csv 
    TODO:
        1. Improve Features list (query, create other df's, etc)
        2. Access Kaggle for more test files
        3. Implement basic linear regression
        4. Add one hot encoding

'''

# Imports

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import os
from pandas.plotting import scatter_matrix
import cv2

# Globals

fileName = ""
userInput = ""

# File Manager Function

def FileManager():
    fileName = ""
    if (fileName == ""):
        fileName = ""
        print("\n --- File Manager Menu --- \n")
        print("1. Display everything in pwd")
        print("2. Input filename")
        print("Enter mm for main menu")
        userInput = input("\nWhat would you like to do? ")
        if ( userInput == "mm"):
            main()
        if ( userInput == "1"):
            print(os.listdir())
            FileManager()
        if ( userInput == "2"):
            finput = input("\nIs the file a .txt or .csv? ( txt / csv ): ")
            if (finput == 'txt'):
                fname = input("\nEnter the filename ( without the .txt): ")
                fileName = fileName + fname + ".txt"
                print(fileName)
                yninput = input("\nDoes this look right to you? ( y / n ):  ")
                if (yninput == 'y'):
                    EDA(fileName)
                if (yninput == 'n'):
                    FileManager()
            if (finput == "csv"):
                fname = input("\nEnter the filename ( without the .csv): ")
                fileName = fileName + fname + ".csv"
                print(fileName)
                yninput = input("\nDoes this look right to you? ( y / n ):  ")
                if (yninput == 'y'):
                    EDA(fileName)
                if (yninput == 'n'):
                    FileManager()

# EDA Function

def EDA(fileName=""):
    if fileName == "":
        FileManager()
    print("\n --- EDA Section --- \n")
    print(fileName)
    yninput = input("\nIs this the correct fileName? ( y / n ): ")
    if (yninput == "y"):
        try:
            df = pd.read_csv(fileName)
            done = False
            while ( done == False ):
                print("\n1. Display head of dataframe")
                print("2. Display dataframe sumamry")
                print("3. Display the scatter matrix")
                print("4. Display Features List: ")
                uInput = input("\nWhat would you like to see? ")
                if (uInput == '1'):
                    print("")
                    print(df.head())
                if (uInput == '2'):
                    print("")
                    print(df.describe())
                if (uInput == '3'):
                    scatter_matrix(df, alpha = 0.2)
                    plt.show()
                if (uInput == "4"):
                    print("")
                    print(list(df.columns.values))
                    pltYN = input("\nWould you like to plot two categorical values against each other? ( y / n ): ")
                    if pltYN == 'y':
                        val1 = input("\nEnter categorical value 1: ")
                        val2 = input("\nEnter categorical value 2: ")
                        try:
                            plt.scatter(df[:][val1], df[:][val2])
                            plt.xlabel(val1)
                            plt.ylabel(val2)
                            plt.title(val1 + " vs " + val2)
                            plt.show()
                        except:
                            print("\n --- Invalid value parameters: check the following for misspellings: " + val1 + " , " + val2 + " ---\n")
                            print("\n --- Note: You may have added extra spaces. --- \n")
                doneYet = input("\nAre you done yet? ( y / n ): ")
                if (doneYet == 'y'):
                    done = True
                    main()
                else:
                    pass
        except:
            print("\n --- Error in file naming (Not found or misspelled) --- \n")
            print("\n --- Sending back to File Manager Menu --- \n")
            FileManager()
    if (yninput == 'n'):
        FileManager() 

# Machine Learning Function

def optionThree():
    print("option Three")

# OpenCVClass Function

def OpenCVFunction():
    userInput = ""
    print("\n --- OpenCV Playground --- \n")
    print("1. Open Camera with Edge Detection")
    print("2. Open Facial Detection (Haar Cascade)")
    userInput = input("\nSelect your option: ")
    if (userInput == "1"):
        openCamEdgeDetect()
    if (userInput == "2"):
        openCamFacialRec()

# Canny Edge

def LiveCamEdgeDetection_Canny(image_color):
    threshold_1 = 30
    threshold_2 = 80
    image_gray = cv2.cvtColor(image_color, cv2.COLOR_BGR2GRAY)
    canny = cv2.Canny(image_gray, threshold_1, threshold_2)
    return canny

# OpenCamEdgeDetect Function

def openCamEdgeDetect():
    cap = cv2.VideoCapture(0) # Capture from main webcam ( in case more )

    while True:
        ret, frame = cap.read()
        cv2.imshow('Live Edge Detection', LiveCamEdgeDetection_Canny(frame))
        cv2.imshow('Webcam Video', frame)
        if cv2.waitKey(1) == 13:
            break
    cap.release()
    cv2.destroyAllWindows()      

# openCamFacialRec() Function

def openCamFacialRec():
    print("Soon to come")

# Main Function

def main():
    print("\n --- Machine Learning Command Line Interface --- \n")
    print("1. File Manager ")
    print("2. EDA ")
    print("3. Machine Learning Options")
    print("4. OpenCV functions")
    print("5. Quit")

    userInput = input("\nWhat would you like to do? ")

    if ( userInput == "1" ):
        FileManager()
    if ( userInput == "2" ):
        EDA()
    if ( userInput == "3" ):
        optionThree()
    if (userInput == "4"):
        OpenCVFunction()
    if ( userInput == "5" ):
        print("\n --- Exiting Program --- \n")
        SystemExit

# Main statement here to start the program

if __name__ == '__main__':
    main()