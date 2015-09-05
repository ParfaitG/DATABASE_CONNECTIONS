library(RSQLite)
library(RODBC)
library(RMySQL)

# LISTS ALL INSTALLED ODBC SOURCES (DRIVERS AND DSNs)
odbcDataSources()

#----------------------------------------FILE LEVEL DATABSES----------------------------------------#

################
# SQLITE
################
sqlite <- dbDriver("SQLite")
conn <- dbConnect(sqlite,"C:\\Path\\To\\Database\\File\\newexample.db")
df <- dbGetQuery(conn, "select * from tablename;")
dbDisconnect(conn)


################
# MS ACCESS
################

# (USING DSN)
conn <-odbcConnect('MS Access Database;
                   DBQ=C:\\Path\\To\\Database\\File.accdb')
df <- sqlQuery(conn, "select * from tablename;")
close(conn)

# (USING DRIVER)
conn <-odbcDriverConnect('driver={Microsoft Access Driver (*.mdb, *.accdb)};
                         DBQ=C:\\Path\\To\\Database\\File.accdb')
df <- sqlQuery(conn, "select * from tablename;")
close(conn)


#----------------------------------------SERVER LEVEL DATABSES----------------------------------------#

################
# MySQL
################

# USING DSN
conn <-odbcConnect('DSN Name;host=hostname;database=databasename;
                   UID=username;PWD=password')
df <- sqlQuery(conn, "select * from tablename;")
close(conn) 

# USING DRIVER
conn <-odbcDriverConnect('driver={MySQL ODBC 5.3 Unicode Driver};host=hostname;database=databasename;
                         UID=username;PWD=password')
df <- sqlQuery(conn, "select * from tablename;")
close(conn)

# USING RMySQL
conn <- dbConnect(RMySQL::MySQL(), dbname="databasename", host="hostname",
                    username="username", password="password")
df <- dbGetQuery(conn, "select * from tablename;")
dbDisconnect(conn)


################
# SQL SERVER
################

# USING DSN
conn <-odbcConnect('DSN Name')
df <- sqlQuery(conn, "select * from dbo.tablename;")
close(conn) 

# USING DRIVER 
conn <-odbcDriverConnect('driver={SQL Server};server=servername;database=databasename;
                         trusted_connection=yes;UID=username;PWD=password')
df <-sqlQuery(conn, "select * from dbo.tablename;")
close(conn) 

 

