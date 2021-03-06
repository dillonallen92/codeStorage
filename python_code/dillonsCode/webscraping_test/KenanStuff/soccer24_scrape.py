# This program is going to webscrape a website for
# soccer games: Soccer24
#
# The goal is to scrape all of the Premier Leauge games

# Data
# The data we are looking for is as listed:
# 1. Final Score
# 2. Match Statistics
# 3. Lineup formations
# 4. Lineup composition
# 5. Substitutes
# 6. Missing Players
# 7. Hopefully scrape injuries

# So far Kenan's group has been able to scrape the data for
# the score, statistics and lineup formation.

# My goal is to recreate how they did 1-3 and push 4-7

import requests
from bs4 import BeautifulSoup

url = "https://www.soccer24.com/england/premier-league/results/"
page = requests.get(url)

soup = BeautifulSoup(page.content, 'html.parser')

res = soup.find(class_="container")
myList = list(res.descendants)
print(myList[1])