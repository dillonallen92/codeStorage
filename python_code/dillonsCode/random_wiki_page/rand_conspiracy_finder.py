# imports
import webbrowser
from bs4 import BeautifulSoup
import requests
import random
import smtplib, ssl
import csv
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

def sendConspiracyEmail(messageText):
  port = 465

  # grab emails from list
  with open('email_list.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    linecount = 0 
    for row in csv_reader:
      if linecount == 0:
        linecount += 1
      elif linecount == 1:
        personal_email = row[1]
        personal_password = row[2]
        linecount += 1
      elif linecount == 2:
        target_email = row[1]
        linecount +=1
      else:
        break
  
  # create secure ssl context
  context = ssl.create_default_context()

  message = MIMEMultipart("alternative")
  message["Subject"] = "Hello fren!"
  message["From"]    = personal_email
  message["To"]      = target_email

  text = messageText

  part1 = MIMEText(text, "plain")

  message.attach(part1)
  
  # log in to the email account
  with smtplib.SMTP_SSL("smtp.gmail.com", port, context=context) as server:
    server.login(personal_email, personal_password)
    server.sendmail(personal_email, personal_email, message.as_string())
    


def generateRandomConspiracy(massSpam = 'n'):

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
  if massSpam == 'y':
    for i in range(0,len(webpath_list)):
      webpath_list[i] = wikiURL + webpath_list[i]
    return webpath_list
  else:
    # now open the webpage
    webbrowser.open_new_tab(random_webpage)
    return random_webpage

if __name__ == '__main__':
  exitCode = 0
  while not exitCode:
    user_choice = str(input('Would you like to generate a random conspiracy wiki article? (y/n) '))
    if user_choice.lower() == 'y':
      emailQuestion = str(input("""Would you like to:
                                   view (v) your conspiracy,
                                   send as an email (e)
                                   or mass spam them? (v/e/ms)
                                   -- for mass email, ctrl+c to stop --
                                   """))
      if emailQuestion.lower() == 'v':
        _ = generateRandomConspiracy()
      elif emailQuestion.lower() == 'e':
        sendConspiracyEmail(generateRandomConspiracy())
      elif emailQuestion.lower() == 'ms':
        listOfConspiracies = generateRandomConspiracy(massSpam = 'y')
        for ct in listOfConspiracies:
          sendConspiracyEmail(ct)
      else:
        'Did not understand...'
    else:
      print("Exiting now...")
      exitCode = 1
  