from selenium import webdriver
from selenium.webdriver.edge.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from bs4 import BeautifulSoup
import time

def papersList(soupedPage) :
    #empty list to append the data to
    pip = []
    paper = soupedPage.find_all("a",class_="gsc_a_at")
    rangePaper = len(paper)
    print(rangePaper)
    for i in range(rangePaper) :
        pip.append(paper[i].text)
    return pip, rangePaper

def citationList(soupedPage,ranges) :
    cit = []
    citation = soupedPage.find_all("td",class_="gsc_a_c")
    for i in range(ranges) :
        if (citation[i].text==''):
            cit.append(0)
        else :
            cit.append(citation[i].text)
    return cit

def yearList(soupedPage) :
    year = soupedPage.find_all("td",class_="gsc_a_y")
    return year

def typeList(soupedPage) :
    types =[]
    type = soupedPage.find_all("div",class_="gs_gray")
    for typ in range(2,len(type),2):
        l=type[typ].text
        types.append(l)
    return types

def linkList(soupedPage, driver) :
    lots=[]
    publisher=[]
    for link in soupedPage.find_all('a',class_="gsc_a_at", href=True):
        #TODO: check if the initial link is appended to the href link next time it runs (eat yourself if it doesnt)
        lots.append(("https://scholar.google.com"+link['href']))

    for j in lots:
        inner_link= j
        inner_req = driver.get(inner_link)
        souper= BeautifulSoup(driver.page_source, "html.parser")
        try:
            pub= souper.find_all("div",class_="gsc_oci_field")[4]
            if pub.text=="Publisher" :
                try:
                    z= souper.find_all("div",class_="gsc_oci_value")[4]
                    publisher.append(z.text)
                except IndexError:
                    publisher.append(0)
            else :
                publisher.append(0)
        except IndexError:
            publisher.append(0)
        time.sleep(2)
        
    return lots,publisher