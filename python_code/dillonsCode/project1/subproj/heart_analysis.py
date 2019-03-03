import xml.etree.ElementTree as ET
import re
import matplotlib.pyplot as plt
import collections
import sys 
import math

beginProgram = True

def convertXMLtoDict(file = ""):
    tree = ET.parse(file)
    root = tree.getroot()
    print("\nData imported.\n")
    return root

def collectData(rootObj, dateArray, valueArray):
    print("\nFor now this is only for heart rate data")

    for i in range(len(rootObj)):
        if (rootObj[i].get('type') == 'HKQuantityTypeIdentifierHeartRate'):
            dateArray.append(rootObj[i].attrib['startDate'])
            valueArray.append(float(rootObj[i].attrib['value']))
    print("Number of records:", len(valueArray))
    heartRateDict = collections.OrderedDict(zip(dateArray, valueArray))
    print("\nData is finished being processed. \n")
    return heartRateDict

def displayDataPrompt(heartDict):
    highValues = []
    avgRate = 0
    highRate = 0
    lowRate = 0
    uInput = ""
    print("There are ", len(heartDict), " values to sort through")
    while(uInput != 'n'):
        heartCheckVal = input("Enter the bpm you want to check (0 for all): ")
        if (heartCheckVal == 'n'):
            uInput = 'n'
        else:
            for x,y in heartDict.items():
                if y >= float(heartCheckVal):
                    highValues.append(y)
                    print(x,y)
                    print("")
            avgRate = sum(highValues)/len(highValues)
            highRate = max(highValues)
            lowRate = min(highValues)
            print("The heart rate of ", heartCheckVal, " bpm and greater has been seen a total of ", len(highValues), "times.")
            print("The average heartRate for this cycle is ", avgRate )
            print("The minimum is ", lowRate)
            print("The maximum is ", highRate)
            plotInput = input("Would you like to visualize this data? ")
            if (plotInput == 'y'):
                plotDataPrompt(highValues, avgRate, lowRate, highRate)
            else:
                highValues = []
                avgRate = 0
                lowRate = 0
                highRate = 0

def plotDataPrompt(inputVals, avgVal, lowVal, highVal):
    plotChoice = ""
    print("\n---------- Plotting Section ----------\n")
    print("1. Histogram")
    print("2. Line Graph")
    plotChoice = input("How would you like to plot these? ")
    if (plotChoice == '1'):
        binVal = math.ceil(math.sqrt(len(inputVals)))
        plt.hist(inputVals, bins = binVal, color = 'c', edgecolor = 'k', alpha = 0.65)
        plt.axvline(avgVal, color='r', linewidth = 1)
        _, max_ = plt.ylim()
        plt.text(avgVal + 5*avgVal/binVal, max_ - 10*max_/(binVal), 'μ = {:.2f} bpm'.format(avgVal))
        plt.xlabel("bmp")
        plt.ylabel("Count")
        plt.title("Histogram of bmp")
        plt.show()
    elif (plotChoice == '2'):
        xPlot = range(0, len(inputVals))
        yPlot = inputVals
        plt.plot(xPlot, yPlot)
        plt.xlabel("# of measurements")
        plt.ylabel("bmp")
        plt.title("Chart of bmp measurements")
        plt.show()

def clearData(dateArray, valueArray, highValues):
    dateArray = []
    valueArray = []
    highValues = []
    print("All values are cleared")
    return dateArray, valueArray, highValues

if __name__ == "__main__":

    xmlFileName = sys.argv[1]
    dateArray = []
    valueArray = []
    highValues = []

    while(beginProgram):

        print("\n---------- Menu ----------\n")
        print("1. Import XML")
        print("2. Form Data")
        print("3. Display/Search data")
        print("4. Clear data")
        print("5. Exit")

        userInput = input("\nWhat would you like to do: ")

        if (userInput == '1'):
            heartFile = convertXMLtoDict(xmlFileName)
        elif (userInput == '2'):
            heartRateDict = collectData(heartFile, dateArray, valueArray)
        elif (userInput == '3'):
            displayDataPrompt(heartRateDict)
        elif (userInput == '4'):
            clearData(dateArray, valueArray, highValues)
        else:
            beginProgram = False

    