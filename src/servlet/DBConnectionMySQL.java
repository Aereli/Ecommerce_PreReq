package servlet;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 
  
// This class can be used to initialize the database connection 
public class DBConnectionMySQL { 
    protected static Connection initializeDatabase() 
        throws SQLException, ClassNotFoundException 
    { 
    	//this ?useSSL=false part is to remove warning for later versions os mysql that need it.
    	String url = "jdbc:mysql://localhost:3306/mydb?useSSL=false";
    	String username = "root";
    	String password = "root";

	System.out.println("Connecting database...");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = (Connection) DriverManager.getConnection(url, username, password);
	    
        return con; 
    } 
}