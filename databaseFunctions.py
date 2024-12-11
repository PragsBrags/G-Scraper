import os
from dotenv import load_dotenv

load_dotenv()

import mysql.connector

db = mysql.connector.connect(
    host=os.getenv('host') or '127.0.0.1',
    user=os.getenv('user'),
    passwd=os.getenv('passwd'),
    database=os.getenv('database')
)

mycursor = db.cursor();

def allScholar () :
   queryScholar = "select p_URL from tbl_scholar"
   mycursor.execute(queryScholar)
   results = mycursor.fetchall()
   scholar = [row[0] for row in results]
   return scholar

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

   querytotalPaper = "Select SUM(paper_amt) as num_paper FROM tbl_dep_count"
   mycursor.execute(querytotalPaper)
   results = mycursor.fetchone()
   totalPaper = results[0]

   deptCiteScore = deptPaper/totalPaper
   queryCiteScore = "update tbl_dep_count set cite_score = %s where DID =%s"
   mycursor.execute(queryCiteScore,(deptCiteScore, DID))
   db.commit()

   updateHindex = "update tbl_scholar set h_index = %s where scholar_id = %s"
   mycursor.execute(updateHindex, (h_index.text, id))
   db.commit()

   return id, DID

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

def updateHindexDept (DID) :
   
   queryscID = "select scholar_id from tbl_scholar where DID = %s "
   mycursor.execute(queryscID,(DID,))
   results = mycursor.fetchall()
   scID = [row[0] for row in results]
   
   PID = []

   for i in scID :
    queryPID = "select paper_id from tbl_paper_author where author_id = %s"
    mycursor.execute(queryPID, (i,))
    results = mycursor.fetchall()
    PID.extend([row[0] for row in results])

   uniquePID = list(set(PID))

   cite = []

   for i in uniquePID :
    queryCITE = "select citation from tbl_paper where paper_id = %s"
    mycursor.execute(queryCITE, (i,))
    results = mycursor.fetchall()
    cite.extend([row[0] for row in results])

   # Step 1: Sort the list in descending order
   cite.sort(reverse=True)

   # Step 2: Find the h-index
   h_index = 0
   for i, citation in enumerate(cite):
    if citation >= i + 1:  # Check if citations are >= rank (i+1)
        h_index = i + 1
    else:
        break  # Stop when citation is less than rank
   
   queryhindex = "update tbl_dep_count set hindex = %s where DID = %s"
   mycursor.execute(queryhindex, (h_index, DID))
   db.commit()
    
def updateSchool () :
   
   queryschID = "select SID from tbl_school"
   mycursor.execute(queryschID)
   results = mycursor.fetchall()
   schID = [row[0] for row in results]
   
   querytotalPaper = "Select SUM(paper_amt) as num_paper FROM tbl_dep_count"
   mycursor.execute(querytotalPaper)
   results = mycursor.fetchone()
   totalPaper = results[0]

   for i in schID :
    queryDID = "select DID from tbl_department where SID = %s"
    mycursor.execute(queryDID, (i,))
    results = mycursor.fetchall()
    DID = [row[0] for row in results]
   
    scID = []

    for j in DID :
        queryscID = "select scholar_id from tbl_scholar where DID = %s"
        mycursor.execute(queryscID, (j,))
        results = mycursor.fetchall()
        scID.extend([row[0] for row in results])

    sum = 0

    for j in DID :
       queryDIDamt = "select paper_amt from tbl_dep_count where DID = %s"
       mycursor.execute(queryDIDamt, (j,))
       result = mycursor.fetchone()
       if result is not None:  # Check if the query returned a result
        paper_amt = result[0]  # Extract the first column value
        sum = sum + paper_amt
       else:
        sum = sum + 0

    citeScore = sum/totalPaper

    queryPamt = "update tbl_school set paper_amt = %s where SID = %s"
    mycursor.execute(queryPamt, (sum, i))
    db.commit()

    queryCite = "update tbl_school set cite_score = %s where SID = %s"
    mycursor.execute(queryCite, (citeScore, i))
    db.commit()   
    
    PID = []

    for j in scID :
        queryPID = "select paper_id from tbl_paper_author where author_id = %s"
        mycursor.execute(queryPID, (j,))
        results = mycursor.fetchall()
        PID.extend([row[0] for row in results])

    uniquePID = list(set(PID))

    cite = []

    for j in uniquePID :
        queryCITE = "select citation from tbl_paper where paper_id = %s"
        mycursor.execute(queryCITE, (j,))
        results = mycursor.fetchall()
        cite.extend([row[0] for row in results])

    # Step 1: Sort the list in descending order
    cite.sort(reverse=True)

    # Step 2: Find the h-index
    h_index = 0
    for k, citation in enumerate(cite):
        if citation >= k + 1:  # Check if citations are >= rank (i+1)
            h_index = k + 1
        else:
            break  # Stop when citation is less than rank
    
    queryhindex = "update tbl_school set hindex = %s where SID = %s"
    mycursor.execute(queryhindex, (h_index, i))
    db.commit()
       

