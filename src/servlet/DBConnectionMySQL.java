package servlet;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 
  
// This class can be used to initialize the database connection 
public class DBConnectionMySQL { 
    protected static Connection initializeDatabase() 
        throws SQLException, ClassNotFoundException 
    { 
    	
    	String url = "jdbc:mysql://localhost:3306/mydb";
    	String username = "root";
    	String password = "root";

	System.out.println("Connecting database...");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = (Connection) DriverManager.getConnection(url, username, password);
	    
        return con; 
    } 
}