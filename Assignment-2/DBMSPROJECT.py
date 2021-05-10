


#establishing the connection

import mysql.connector

try:

    conn = mysql.connector.connect(host='127.0.0.1', user='root', passwd='root', db='aqa2426')
    cursor = conn.cursor()
    print('Connected')
except:
    print('Not connected')



############################################
# Preparing SQL query to INSERT a record into the database.
print("TRANSACTION 1-------------")
insert_stmt = (
    """select count(doseId) from Doses, Manufacturer where Doses.ManuId=ManuFacturer.ManuId and VaccineName=%s;"""
)
data = (input("Vaccine Name:"),)
# Executing the SQL command
cursor.execute(insert_stmt, data)
Result1=cursor.fetchall()
for res in Result1:
    print(res)

###############################################
print("TRANSACTION 2-------------")
statement=(""" select * from DistByFederalGorv; """)
cursor.execute(statement)
ResultSet2=cursor.fetchall()
for res in ResultSet2:
    print(res)

insert_stmt2=("""UPDATE DistByFederalGorv
    set QtyDist=QtyDist+%s where StateName=%s;
""")
Inc=input("Increment:")
SName=input("StateName:")
data=(Inc,SName)
cursor.execute(insert_stmt2,data)
statement=(""" select * from DistByFederalGorv; """)
cursor.execute(statement)
ResultSet2=cursor.fetchall()
for res in ResultSet2:
    print(res)
###########################################3

print("TRANSACTION 3-------------")
statement=(""" select * from DistByState;""")
cursor.execute(statement)
ResultSet=cursor.fetchall()
for res in ResultSet:
    print(res)
insert_stmt3=("""Set SQL_SAFE_UPDATES=0;
	UPDATE DistByState,LocalBody
    set QtyObtain=QtyObtain+%s where DistByState.localBodyId=LocalBody.LocalBodyId and LocalBodyName=%s";
    Set SQL_SAFE_UPDATES=1;""")
Inc=input("Increment:")
LBName=input("StateName:")
data=(Inc,LBName)
cursor.execute(insert_stmt3,data,multi=True)

statement=(""" select * from DistByState;""")
cursor.execute(statement)
ResultSet=cursor.fetchall()
for res in ResultSet:
    print(res)

######################################3(113,"ronda corps","Gorv","GoCorona","ALL REMOVAL");
print("TRANSACTION 4-------------")
insert_stmt4=("""INSERT INTO Manufacturer(ManuId,ManuName,UnitType,VaccineName,VaccineType) VALUES
    (%s,%s,%s,%s,%s);
""")
ManuId=input("ManuId:")
ManuName=input("ManuName:")
UnitType=input("UnitType:")
VaccineName=input("VaccineName:")
VaccineType=input("VaccineType:")
data=(ManuId,ManuName,UnitType,VaccineName,VaccineType)
cursor.execute(insert_stmt4,data)

statement=(""" select * from Manufacturer where ManuId=%s;""")
data=(ManuId,)
cursor.execute(statement,data)
ResultSet=cursor.fetchall()
for res in ResultSet:
    print(res)
print("Successfully INserted")

#########################################33
print("TRANSACTION 5-------------")
insert_stmt5=("""select concat("Adverse reaction for ", personalInfo.PName ," after getting ", Manufacturer.VaccineName ," administration") as "REPORT" from PersonalInfo,Manufacturer,Doses where 
    PersonalInfo.PId=Doses.Pid and Doses.ManuId=Manufacturer.ManuId and ShotTime='2021-2-1';
""")
cursor.execute(insert_stmt5)
ResultSet5=cursor.fetchall()
for res in ResultSet5:
    print(res)
# Commit your changes in the database
conn.commit()

# Closing the connection
conn.close()