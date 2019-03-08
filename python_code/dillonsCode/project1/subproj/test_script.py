import xml.etree.ElementTree as ET 
import re
import matplotlib.pyplot as plt
import collections
import pandas as pd
import datetime
import seaborn as sns

tree = ET.parse('export.xml')
root = tree.getroot()

'''
Did this to see how the data prints out

for child in root:
    print(child.attrib)
'''

# print(root[15].attrib)

'''
Once we find the type that is HKQuanitityType, we want the dict values of 'value' and 'startDate'
'''

# print(type(root[15].attrib['value']))
# print(type(root[15].attrib['startDate']))

# Attempt to parse the startDate
# print(root[15].attrib['startDate'][11:19])

# Now try to collect data in x(date) and y(heartrate)

dateArray = []
timeArray = []
valueArray = []




for i in range(len(root)):
    if (root[i].get('type') == 'HKQuantityTypeIdentifierHeartRate'):
        dateArray.append(root[i].attrib['startDate'])
        valueArray.append(float(root[i].attrib['value']))

print(dateArray[1][11:19])

# Grab the times from each date (still in string form)

for k in range(len(dateArray)):
        timeArray.append(dateArray[k][:19])
print(timeArray)
print(" ")



# Now try to do the whole array with a for each loop
parsedTimeArray = []
parsedTimeArray = [datetime.datetime.strptime(myDate, '%Y-%m-%d %H:%M:%S') for myDate in timeArray]
print(parsedTimeArray)
print(" ")
# parsedDateArray = [datetime.datetime.strptime(myDate,'%Y-%m-%d %H:%M:%S').time() for myDate in dateArray]
# print(parsedTimeArray)

# plt.plot(parsedTimeArray, valueArray)
# plt.show()

# Try to format plot with seaborn (sns)
fig, ax = plt.subplots()

ax.plot(parsedTimeArray, valueArray)

plt.setp(ax.get_xticklabels(), rotation=45)

ax.set(xlabel = "Date", ylabel="bmp")

plt.show()
'''

# Now I will query the instantaneous heart rate
# It has a record inside a record that also has an element that then can be queried for attributes

for i in range(len(root)):
    if(root[i].get('type') == 'HKQuantityTypeIdentifierHeartRateVariabilitySDNN'):
        print(root[i].attrib)
        print(" ")
        for record in root[i][:]:
                print(next(iter(record)))
        # print(next(iter(root[i][:])).attrib)
        # print(" ")
'''
'''

dateArray = []
valueArray = []

First way to filter

for i in range(0,25019):
    dateArray.append(root[15+i].attrib['startDate'])
    valueArray.append(float(root[15+i].attrib['value']))


# Second filter technique



firstDate = dateArray[0]
lastDate = dateArray[-1]
minHeartRate = min(valueArray)
maxHeartRate = max(valueArray)
totalData = len(valueArray)
avgHeartRate = sum(valueArray) / totalData

print("First day of measurement was:" , firstDate)
print("Last day of measurement was:", lastDate)
print("Minimum heartrate was:", minHeartRate)
print("Maximum heartrate was:", maxHeartRate)
print("Average heartrate was:", avgHeartRate)
print("Total amount of measurements:", totalData)

# Make an ordered dictionary of values

heartRateDict = collections.OrderedDict(zip(dateArray, valueArray))

# Now attempt to query high heart rates and run a loop for me to just check values

highValues = []

uInput = ""
while(uInput != 'n'):

    heartCheckVal = input("Enter the bpm you want to check against: ")

    for x,y in heartRateDict.items():
        if y >= float(heartCheckVal):
            highValues.append(y)
            print(x,y)
            print("")

    print("This heart rate and higher have been seen a total of", len(highValues), "times")
    highValues = []
    uInput = input("Continue? (n to cancel)")


xPlot = range(totalData)
plt.plot(xPlot, valueArray)
plt.title('All data points (~ 3 months)')
plt.xlabel('# of measurements')
plt.ylabel('Heartrate (bpm)')
plt.show()
'''
