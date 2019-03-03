import xml.etree.ElementTree as ET
import re
import matplotlib.pyplot as plt
import collections
import sys 

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
    print(len(valueArray))
    heartRateDict = collections.OrderedDict(zip(dateArray, valueArray))
    print("\nData is finished being processed. \n")
    return heartRateDict

def displayDataPrompt(heartDict):
    highValues = []
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
            print("The heart rate of ", heartCheckVal, " bpm and greater has been seen a total of ", len(highValues), "times.")
            plotInput = input("Would you like to plot a histogram? ")
            if (plotInput == 'y'):
                plotDataPrompt(highValues)
            else:
                highValues = []

def plotDataPrompt(inputVals):
    plotChoice = ""
    print("\n---------- Plotting Section ----------\n")
    print("1. Histogram")
    print("2. Line Graph")
    plotChoice = input("How would you like to plot these? ")
    if (plotChoice == '1'):
        plt.hist(inputVals)
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
        print("4. Plot Data")
        print("5. Clear data")
        print("6. Exit")

        userInput = input("\nWhat would you like to do: ")

        if (userInput == '1'):
            heartFile = convertXMLtoDict(xmlFileName)
        elif (userInput == '2'):
            heartRateDict = collectData(heartFile, dateArray, valueArray)
        elif (userInput == '3'):
            displayDataPrompt(heartRateDict)
        elif (userInput == '4'):
            plotDataPrompt(heartFile)
        elif (userInput == '5'):
            clearData(dateArray, valueArray, highValues)
        else:
            beginProgram = False

    