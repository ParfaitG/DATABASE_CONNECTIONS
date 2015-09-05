#!/usr/bin/python
import sqlite3
import pypyodbc
import pymysql


# LIST OF INSTALLED DATA SOURCES (DSNs)
print(pypyodbc.dataSources())

# LIST OF INSTALLED DRIVERS
print(pypyodbc.drivers())

#------------------------------FILE LEVEL DATABASES-------------------------------#

##############################
## SQLITE DB CONNECTION
##############################

db = sqlite3.connect('C:\\Path\\To\\Database\\File.db')
cur = db.cursor()
cur.execute("SELECT * FROM tablename")

cur.close()
db.close()


############################
## ACCESS DB CONNECTION
############################

# (USING DSN)
databasename = 'C:\\Path\\To\\Database\\File.accdb'
constr = "DSN=MS Access Database;DBQ={0};".format(databasename)

db = pypyodbc.connect(constr)
cur = db.cursor()
cur.execute("SELECT * FROM tablename")

cur.close()
db.close()


# (USING DRIVER)
databasename = 'C:\\Path\\To\\Database\\File.accdb'
constr = "DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};DBQ={0};".format(databasename)

db = pypyodbc.connect(constr)
cur = db.cursor()
cur.execute("SELECT * FROM tablename")

cur.close()
db.close()


#------------------------------SERVER LEVEL DATABASES-------------------------------#
############################
## MYSQL DB CONNECTION
############################

# (USING DSN)
db = pypyodbc.connect(dsn="dsn name")

cur = db.cursor() 
cur.execute("SELECT * FROM tablename;")
db.commit()
    
cur.close()
db.close()

# (USING DRIVER)
db = pypyodbc.connect(driver="ODBC Driver Name", host="hostname",
                      uid="username", pwd="password", database="database")

cur = db.cursor() 
cur.execute("SELECT * FROM tablename;")
db.commit()
    
cur.close()
db.close()

# (PYMYSQL MODULE)
db = pymysql.connect(host="hostname", port=portNumber,
                     user="username", passwd="123ABC", db="database")

cur = db.cursor() 
cur.execute("SELECT * FROM tablename;")
    
cur.close()
db.close()


##############################
## SQL SERVER DB CONNECTION
##############################

#(USING DSN)
db = pypyodbc.connect('DSN=dsn name;')

cur = db.cursor()
cur.execute("SELECT * FROM dbo.tablename")

cur.close()
db.close()


# (USING DRIVER)
constr = 'Trusted_Connection=yes;DRIVER={SQL Server};SERVER=servername;' \
         'DATABASE=database name;UID=username;PWD=password'
db = pypyodbc.connect(constr)

cur = db.cursor()
cur.execute("SELECT * FROM dbo.tablename")

cur.close()
db.close()
