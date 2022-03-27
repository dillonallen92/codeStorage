# imports
import webbrowser
from bs4 import BeautifulSoup
import requests
import random 

def generateRandomConspiracy():

  # helper function
  def isBadKeyword(inputStr, badKeywordList):
    # the current format of the inputStr is an href of the form
    # /wiki/<text>_<text> etc
    # for the bad keywords in question, they are of the form
    # /wiki/<badkeyword>_<identifier>
    lastElement = inputStr.split('/')[-1].split('_')[0]
    if lastElement in badKeywordList:
      return True
    return False

  # All of the bad keywords
  badKeywords = ['ISBN', 'SAGE', 'Doi', 'ISSN', 'S2CID', 'PMID',
                'John', 'Wiley', 'CiteSeerX', 'JSTOR','Bibcode',
                'PMC']

  # List of all acceptable webpaths will go here
  webpath_list = []

  # URLs needed
  URL = 'https://en.wikipedia.org/wiki/List_of_conspiracy_theories'
  wikiURL = 'http://en.wikipedia.org'

  # Web request and BS4 call
  page = requests.get(URL)
  soup = BeautifulSoup(page.content, 'html.parser')

  # Parsing to find all the hrefs
  results = soup.find_all("a",class_='mw-redirect', href=True)
  for res in results:
    webpath = res['href']
    if not isBadKeyword(webpath, badKeywords):
      webpath_list.append(webpath)

  # generate a random number between 0 and the length of the amount of webpaths
  random_index = random.randint(0,len(webpath_list))

  # find the random webpage
  random_webpage = wikiURL + webpath_list[random_index]

  # now open the webpage
  webbrowser.open_new_tab(random_webpage)


if __name__ == '__main__':
  exitCode = 0
  while not exitCode:
    user_choice = str(input('Would you like to generate a random conspiracy wiki article? (y/n) '))
    if user_choice.lower() == 'y':
      generateRandomConspiracy()
    else:
      print("Exiting now...")
      exitCode = 1
  