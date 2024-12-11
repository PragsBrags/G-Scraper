import time
import schedule
import databaseFunctions as data
import scraping as scrap

def autoScrape () :
    scholars = []
    scholars = data.allScholar()
    for i in scholars :
        paper, ranges, citation, year, type, links, publisher, h_index = scrap.scroll(i)

        id, DID = data.updateAmount(i, ranges, h_index)
        data.paperDetails(paper, citation, year, publisher, type, links, id)
        data.updateHindexDept(DID)
        data.updateSchool()

autoScrape()
while True :
    service = int(input("Are you adding new faculty data or updating existing faculty data (1 for new data 2 for existing data and 3 to exit)"))

    if service == 1  :
        name = input("Provide the name of the faculty ")
        dept = input("Provide Department name ")
        level = input("Provide profession level of the faculty member ")
        link = input("Provide Google scholar link")

        data.newdata(name, dept, level, link)

        paper, ranges, citation, year, type, links, publisher, h_index = scrap.scroll(link)

        id, DID = data.updateAmount(link, ranges, h_index)
        data.paperDetails(paper, citation, year, publisher, type, links, id)
        data.updateHindexDept(DID)
        data.updateSchool()

    elif service == 2 :

        service_url_ID = int(input("Please provide the ID of the faculty member "))

        Existence =  data.facultyExistance(service_url_ID)

        if Existence :

            print("user exists and url is ", Existence)
            paper, ranges, citation, year, type, links, publisher, h_index = scrap.scroll(Existence)

            id, DID = data.updateAmount(Existence, ranges, h_index)
            data.paperDetails(paper, citation, year, publisher, type, links, id)
            data.updateHindexDept(DID)
            data.updateSchool()
            
        else:
            print("No faculty with such ID",Existence)

    elif service == 3 :
        print("exiting program")
        break

    else :
        print("No valid service selected")