import java.sql.* ;

public class JavaConnections {
    
    public static void main(String[] args) {
	JavaConnections obj = new JavaConnections();
	obj.ConnectMSACCESS();
    }
    
    /*------------------------------------
    FILE LEVEL DATABASES
    ------------------------------------*/
    
    // SQLITE
    public static void ConnectSQLite() {             
        try {
            Class.forName("org.sqlite.JDBC");
        } 
        catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        try {
            String database = "C:\\Path\\To\\Database\\File.db"; 
            Connection conn = DriverManager.getConnection("jdbc:sqlite:"+database);
            
            conn.close();           
        }
            
        catch ( SQLException err ) {            
            System.out.println( err.getMessage( ) );            
        }
    }

    // MS ACCESS
    public static void ConnectMSACCESS() {
                
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        } 
        catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        try {            
            String database = "C:\\Path\\To\\Database\\File.accdb";                        
            Connection conn = DriverManager.getConnection("jdbc:ucanaccess://"+database);
            
            conn.close();           
        }
            
        catch ( SQLException err ) {            
            System.out.println( err.getMessage( ) );            
        }
    }


    /*------------------------------------
    SERVER LEVEL DATABASES
    ------------------------------------*/
    
    // MySQL        
    public static void ConnectMySQL() {
                       
        try {            
            String url = "jdbc:mysql://<host name>:3306/<database name>";            
            String username = "***";
            String password  =  "***";
                        
            Connection conn = DriverManager.getConnection(url, username, password);
            
            conn.close();                
        }
            
        catch ( SQLException err ) {            
            System.out.println( err.getMessage( ) );            
        }        
    }

    // SQL SERVER
    public static void  ConnectMSSQL() {
            
        try {            
            String url = "jdbc:sqlserver://<Server Name>:1433;integratedSecurity=true;databaseName=<database name>";            
            String username = "***";
            String password  =  "***";
                        
            Connection conn = DriverManager.getConnection(url, username, password);
            
            conn.close();            
        }
            
        catch ( SQLException err ) {            
            System.out.println( err.getMessage( ) );            
        }
    }
}
 

