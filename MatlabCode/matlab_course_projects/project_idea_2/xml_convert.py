import xml.etree.ElementTree as ET
import sys
import collections

def convertXMLtoDict(file):

        tree = ET.parse(file)
        root = tree.getroot()

        dateArray = []
        valueArray = []

        for i in range(len(root)):
                if (root[i].get('type') == 'HKQuantityTypeIdentifierHeartRate'):
                        dateArray.append(root[i].attrib['startDate'])
                        valueArray.append(float(root[i].attrib['value']))

        heartRateDict = collections.OrderedDict(zip(dateArray, valueArray))
        return heartRateDict

if __name__ == '__main__':
        xmlFileName = sys.argv[1]
        myDict = convertXMLtoDict(xmlFileName)
        sys.stdout.write(myDict)