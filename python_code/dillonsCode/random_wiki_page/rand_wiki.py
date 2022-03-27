#############################
#     Import Statements     #
#############################

import os
import webbrowser


def generateWebpage():
  webbrowser.open_new_tab('http://en.wikipedia.org/wiki/Special:Random')

if __name__ == '__main__':
  endcode = False
  while not endcode:
    user_choice = str(input("Would you like a random wikipedia webpage? (y/n) "))
    print(user_choice)
    if user_choice.lower() == 'y':
      generateWebpage()
    else:
      print("Exiting now...")
      endcode = True
