Attribute VB_Name = "VBAConnections"
Option Compare Database

Public Sub DB_Connectoins()

    Dim conn As Object
    Dim rst As Object
    
    Set conn = CreateObject("ADODB.Connection")
    Set rst = CreateObject("ADODB.Recordset")
        
    '-----------------------------------------FILE LEVEL DATABASES-----------------------------------------'

    ''''''''''''''''''''
    '''' SQLITE
    ''''''''''''''''''''
    '    WITH DSN
    conn.Open "DSN name"
    rst.Open "SELECT * FROM tablename;", conn

    '    WITH DRIVER
    conn.Open "DRIVER=SQLite3 ODBC Driver;Database=C:\Path\To\Database\File.db;"
    rst.Open "SELECT * FROM tablename;", conn
    rst.Close

    Set rst = Nothing
    Set conn = Nothing


    ''''''''''''''''''''
    '''' MS ACCESS
    ''''''''''''''''''''
    '    WITH DSN
    conn.Open "DSN=MS Access Database;DBQ=C:\Path\To\Database\File.accdb;"
    rst.Open "SELECT * FROM Tractors;", conn

    '    WITH DRIVER
    conn.Open "DRIVER=Microsoft Access Driver (*.mdb, *.accdb);DBQ=C:\Path\To\Database\File.accdb;"
    rst.Open "SELECT * FROM tablename;", conn

    '    WITH OLEDB
    conn.Open "PROVIDER=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Path\To\Database\File.accdb;"
    rst.Open "SELECT * FROM tablename;", conn
    rst.Close

    Set rst = Nothing
    Set conn = Nothing


    '-----------------------------------------SERVER LEVEL DATABASES-----------------------------------------'

    ''''''''''''''''''''
    '''' MySQL
    ''''''''''''''''''''
    '    WITH DSN
    conn.Open "DSN=DSN Name;"
    rst.Open "SELECT * FROM tablename;", conn

    '    WITH DRIVER
    conn.Open "DRIVER={MySQL ODBC 5.3 Unicode Driver};server=servername;database=databasename;UID=username;PWD=password;"
    rst.Open "SELECT * FROM tablename;", conn
    rst.Close

    Set rst = Nothing
    Set conn = Nothing


    ''''''''''''''''''''
    '''' SQL SERVER
    ''''''''''''''''''''
    '    WITH DSN
    conn.Open "DSN=DSN Name;"
    rst.Open "SELECT * FROM water;", conn

    '    WITH DRIVER
    conn.Open "DRIVER={SQL Server};server=servername;database=databasename;UID=username;PWD=password;"
    rst.Open "SELECT * FROM tablename;", conn

    '    WITH OLEDB
    conn.Open "PROVIDER=SQLOLEDB;Data Source=servername;Initial Catalog=databasename;Integrated Security=SSPI;Trusted_Connection=yes;" _
                & "User ID=username;Password=password;"
    rst.Open "SELECT * FROM tablename;", conn

    rst.Close

    Set rst = Nothing
    Set conn = Nothing

End Sub
