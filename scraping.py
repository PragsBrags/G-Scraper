import os
from dotenv import load_dotenv

load_dotenv()

from selenium import webdriver
from selenium.webdriver.edge.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from bs4 import BeautifulSoup
import time

import scrapingFunction as funk

def scroll (url) :

    #setting up web driver for selenium
    driverpath = os.getenv('driverpath')
    service= Service(driverpath)
    driver = webdriver.Edge(service = service)

    #waiting for the site load
    urlResponse = driver.get(url)
    time.sleep(5)

    while True:
        try :
            ele= WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, """/html/body/div/div[12]/div[2]/div/div[4]/form/div[2]/div/button""")))
            ele.click()
        except :
            print("No more pages left")
            break   

    #waiting for the site to load again till the end
    time.sleep(5)

    #parse the page in html
    soupedPage = BeautifulSoup(driver.page_source, "html.parser")
    
    paper,ranges = funk.papersList(soupedPage)

    citation = funk.citationList(soupedPage,ranges)

    year = funk.yearList(soupedPage)

    type = funk.typeList(soupedPage)

    links,publisher = funk.linkList(soupedPage, driver)

    h_index = soupedPage.find_all("td",class_="gsc_rsb_std")[2]

    return paper, ranges, citation, year, type, links, publisher, h_index

