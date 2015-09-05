

******************************************FILE LEVEL DATABASES******************************************;
***************;
*** SQLITE 3
***************;

** USING LIBNAME;
libname mydata odbc complete = "Driver={SQLite3 ODBC Driver}; Database=C:\Path\To\database.db";

** USING PROC SQL;
* WITH DSN;
proc sql;
	connect to odbc as conn
		("DSN=SQLite;DBQ=C:\Path\To\database.db;");

    create table TableName as	
	select * from connection to conn
		(select * from tablename);
	disconnect from conn;
quit;

* WITH DRIVER;
proc sql;
	connect to odbc as conn
		("Driver={SQLite3 ODBC Driver};Database=C:\Path\To\database.db;");

    create table TableName as	
	select * from connection to conn
		(select * from tablename);
	disconnect from conn;
quit;


***************;
*** MS ACCESS
***************;

** USING LIBNAME;
libname mydata "C:\Path\To\Database.accdb";


** USING PROC SQL;
* WITH DSN;
proc sql;
	connect to odbc as conn
		("DSN=MS Access Database;DBQ=C:\Path\To\Database.accdb;");

    create table TableName as	
	select * from connection to conn
		(select * from tablename);
	disconnect from conn;
quit;

* WITH DRIVER;
proc sql;
	connect to odbc as conn
		("Driver=Microsoft Access Driver (*.mdb, *.accdb);DBQ=C:\Path\To\Database.accdb;");

    create table TableName as	
	select * from connection to conn
		(select * from tablename);
	disconnect from conn;
quit;


******************************************SERVER LEVEL DATABASES******************************************;
***************;
*** MYSQL
***************;

** USING LIBNAME;
* WITH DSN;
libname mydata odbc datasrc="DSN Name" user="username" password="password";

* WITH DRIVER;
libname mydata odbc complete="driver=MySQL ODBC 5.3 Unicode Driver; Server=servername; user=username; pwd=password; database=databasename;";


** USING PROC SQL;
* WITH DSN;
proc sql;
	connect to odbc as conn
		(datasrc = "DSN Name" user="username" password="password");
	create table Tablename as
	select * from connection to conn
		(select * from tablename);
	disconnect from conn;
quit;

* WITH DRIVER;
proc sql;
	connect to odbc as conn
		("driver={MySQL ODBC 5.3 Unicode Driver};server=servername; database=databasename; user=username; pwd=password;");
	create table Tablename as
	select * from connection to conn
		(select * from tablename);
	disconnect from conn;
quit;

*****************;
*** SQL SERVER;
*****************;

** USING LIBNAME;
* WITH DSN;
libname mydata odbc datasrc="DSN Name" user="username" password="password";

* WITH DRIVER;
libname mydata odbc complete="driver=SQL Server; Server=servername; user=username; pwd=password; database=databasename;";


** USING PROC SQL;
* WITH DSN;
proc sql;
	connect to odbc as conn
		(datasrc = "DSN Name" user="username" password="password");
	create table Tablename as
	select * from connection to conn
		(select * from tablename);
	disconnect from conn;
quit;

* WITH DRIVER;
proc sql;
	connect to odbc as conn
		("driver={SQL Server};server=servername; database=databasename; uid=username;pwd=password");
	create table TableName as
	select * from connection to conn
		(select * from tablename);
	disconnect from conn;
quit;
