import os
from dotenv import load_dotenv

load_dotenv()

import mysql.connector

db = mysql.connector.connect(
    host=os.getenv('host'),
    user=os.getenv('user'),
    passwd=os.getenv('passwd'),
    database=os.getenv('database')
)

mycursor = db.cursor();

def newdata ( Name, dept, level, scholar_link) :
   queryDept = "select DID from tbl_department where Dept = %s"
   mycursor.execute(queryDept, (dept,))
   DIDone = mycursor.fetchone()
   DID = DIDone[0]

   queryInsert = "insert into tbl_scholar (level, scholar, DID, p_URL) values (%s,%s,%s,%s)"
   mycursor.execute(queryInsert, (level, Name, DID, scholar_link))
   db.commit()

   getscholarID = "select scholar_id from tbl_scholar where p_URl = %s"
   mycursor.execute(getscholarID, (scholar_link,))
   IDone = mycursor.fetchone()
   ID = IDone[0]

   queryIntoamt = "insert into tbl_count (scholar_id, DID) values (%s,%s)"
   mycursor.execute(queryIntoamt, (ID, DID))
   db.commit()

def facultyExistance ( service_url):
    query = "select p_URL from tbl_scholar where scholar_id = %s"
    mycursor.execute(query, (service_url,))
    result = mycursor.fetchone()
    if result :
     return result[0]
    else :
        return

def updateAmount ( service_url, ranges, h_index) :
   DID = 123          # Example ID
   name = "John Doe"  # Example scholar name
   id = 1234          # Example ID

   queryID = "Select scholar_id from tbl_scholar where p_URL =%s"
   mycursor.execute(queryID, (service_url,))
   idone = mycursor.fetchone()
   id = idone[0]

   queryDID = "select DID from tbl_scholar where p_URL=%s"
   mycursor.execute(queryDID, (service_url,))
   DIDone = mycursor.fetchone()
   DID = DIDone[0]

   queryScholarID = "select scholar from tbl_scholar where scholar_id =%s"
   mycursor.execute(queryScholarID, (id,))
   nameone = mycursor.fetchone()
   name = nameone[0]

   queryFacultyAmount = "UPDATE tbl_count SET paper_amt = %s, DID =%s WHERE scholar_id = %s"
   mycursor.execute(queryFacultyAmount, (ranges, DID, id))
   db.commit()

   queryDeptAmount = "SELECT SUM(paper_amt) AS num_paper FROM tbl_count WHERE DID = %s GROUP BY DID"
   mycursor.execute(queryDeptAmount, (DID,))
   results = mycursor.fetchone()
   deptPaper = results[0]

   updateDeptAmount = "update tbl_dep_count set paper_amt = %s where DID = %s"
   mycursor.execute(updateDeptAmount, (deptPaper, DID))
   db.commit()

   updateHindex = "update tbl_scholar set h_index = %s where scholar_id = %s"
   mycursor.execute(updateHindex, (h_index.text, id))
   db.commit()

   return id

def paperDetails (paper, cit, year, publisher, types, lots, id) :
   
   for i,j,k,l,m,o in zip(paper,cit,year,publisher,types,lots):
    mycursor.execute("select paper_id from tbl_paper where paper_title=%s",(i,))
    print(f"Paper: {i}")
    result = mycursor.fetchone()
    if result:
        paper_id=result[0]
        print(f"Paper already exists with paper_id: {paper_id}")
        mycursor.execute("Insert ignore into tbl_paper_author (author_id,paper_id) values(%s,%s)",(id,paper_id))
        db.commit()
    else :
            mycursor.execute("INSERT IGNORE INTO tbl_paper (paper_title,citation,p_year,publisher,p_type,URL) VALUES(%s,%s,%s,%s,%s,%s)", (i, j, k.text, l,m,o))
            db.commit()
            mycursor.execute("SELECT paper_id FROM tbl_paper WHERE paper_id=(SELECT max(paper_id) FROM tbl_paper);")
            result_id= mycursor.fetchone()
            mycursor.execute("Insert IGNORE into tbl_paper_author (author_id,paper_id) values(%s,%s)",(id,result_id[0]))
            db.commit()
    