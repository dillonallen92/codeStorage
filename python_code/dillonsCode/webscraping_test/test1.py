'''
import requests
from bs4 import BeautifulSoup
from lxml import etree

url = 'https://www.tiktok.com/trending?lang=en'

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36',
    'Content-Type': 'text/html',
}

response = requests.get(url, headers = headers)

soup = BeautifulSoup(response.text, 'html.parser')

print(soup.find_all('a', {'class': 'jsx-1229794949 video-feed-item-wrapper'}))
'''

import time
from selenium.webdriver import Chrome

browser = Chrome('./driver/chromedriver.exe')  # Optional argument, if not specified will search path.
browser.get('http://www.google.com/');
time.sleep(5) # Let the user actually see something!
search_box = browser.find_element_by_name('q')
search_box.send_keys('ChromeDriver')
search_box.submit()
time.sleep(5) # Let the user actually see something!
browser.close()