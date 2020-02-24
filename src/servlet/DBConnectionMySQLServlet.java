package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DBConnectionMySQLServlet
 */
@WebServlet("/InsertData")
public class DBConnectionMySQLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBConnectionMySQLServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	
		 try { 
			  
	            // Initialize the database 
	            Connection con = DBConnectionMySQL.initializeDatabase(); 
	  
	            // Create a SQL query to insert data into demo table 
	            // demo table consists of two columns, so two '?' is used 
	            PreparedStatement st = con 
	                   .prepareStatement("INSERT INTO user VALUES(iduser,?, ?)"); 
	  
	            // For the first parameter, 
	            // get the data using request object 
	            // sets the data to st pointer 
	            st.setString(1, request.getParameter("name")); 
	  
	            // Same for second parameter 
	            st.setString(2, request.getParameter("password")); 
	  
	            // Execute the insert command using executeUpdate() 
	            // to make changes in database 
	            st.executeUpdate(); 
	  
	            // Close all the connections 
	            st.close(); 
	            con.close(); 
	  
	            // Get a writer pointer  
	            // to display the successful result 
	            response.sendRedirect("home.jsp");
//	            
//	            PrintWriter out = response.getWriter(); 
//	            out.println("<html><body><b>Successfully Inserted"
//	                        + "</b></body></html>"); 
	        } 
	        catch (Exception e) { 
	            e.printStackTrace(); 
	        } 
	    } 
	}


