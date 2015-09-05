<?php

/*-------------------------------------------FILE LEVEL SERVER DATABASES-------------------------------------------*/

################################
# SQLITE PDO CONNECTION
################################

# USING DSN
$database="C:\Path\To\Database\File.sqlite";

try {
    $dbh = new PDO("sqlite:$database");
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $sql = "SELECT * FROM tablename";    
    $STH = $dbh->query($sql);    
    $STH->setFetchMode(PDO::FETCH_ASSOC); 
}
catch(PDOException $e) {  
    echo $e->getMessage()."\n";
    exit;
}
# close the connection
$dbh = null;


################################
# MS ACCESS PDO CONNECTION
################################

# USING DSN
$database="C:\Path\To\Database\File.accdb";

try {
    $dbh = new PDO("odbc:DSN=MS Access Database;DBq=$database;");
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $sql = "SELECT * FROM tablename";    
    $STH = $dbh->query($sql);    
    $STH->setFetchMode(PDO::FETCH_ASSOC); 
}
catch(PDOException $e) {  
    echo $e->getMessage()."\n";
    exit;
}
# close the connection
$dbh = null;


# USING DRIVER
$database="C:\Path\To\Database\File.accdb";

try {
    $dbh = new PDO("odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBq=$database;");    
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $sql = "SELECT * FROM tablename";    
    $STH = $dbh->query($sql);    
    $STH->setFetchMode(PDO::FETCH_ASSOC); 
}
catch(PDOException $e) {  
    echo $e->getMessage()."\n";
    exit;
}
# close the connection
$dbh = null;


/*-------------------------------------------SERVER LEVEL SERVER DATABASES-------------------------------------------*/


################################
# MySQL PDO CONNECTION
################################

# WITH ODBC DRIVER PDO
try {
    $dbh = new PDO("odbc:Driver={MySQL ODBC 5.3 Unicode Driver};host=$hostname;dbname=$database",$username,$password);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "SELECT * FROM tablename";
    $STH = $dbh->query($sql);
    $STH->setFetchMode(PDO::FETCH_ASSOC);  

}
catch(PDOException $e) {  
    echo $e->getMessage();
    exit;
}
# close the connection
$dbh = null;


# WITH MYSQL PDO
try {
    $dbh = new PDO("mysql:host=$host;dbname=$database",$username,$password);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "SELECT * FROM tablename";
    $STH = $dbh->query($sql);
    $STH->setFetchMode(PDO::FETCH_ASSOC);  

}
catch(PDOException $e) {  
    echo $e->getMessage();
    exit;
}
# close the connection
$dbh = null;


################################
# SQL Server PDO CONNECTION
################################

# WITH ODBC DRIVER PDO
try {
    $dbh = new PDO("odbc:Driver={SQL Server};Server=$server;database=$database",$username,$password);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $sql = "SELECT * FROM dbo.tablename";    
    $STH = $dbh->query($sql);    
    $STH->setFetchMode(PDO::FETCH_ASSOC); 
}
catch(PDOException $e) {  
    echo $e->getMessage()."\n";
    exit;
}
# close the connection
$dbh = null;


# WITH SQLSRV PDO
try {
    $dbh = new PDO("sqlsrv:server=$server;database=$database",$username,$password);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $sql = "SELECT * FROM dbo.tablename";    
    $STH = $dbh->query($sql);    
    $STH->setFetchMode(PDO::FETCH_ASSOC); 
}
catch(PDOException $e) {  
    echo $e->getMessage()."\n";
    exit;
}
# close the connection
$dbh = null;

?>