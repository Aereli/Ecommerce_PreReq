package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
		
		try {
			String getProducts = "SELECT * FROM product";
	        Connection con = DBConnectionMySQL.initializeDatabase(); 
	        
	        response.setContentType("text/html");
	        List<String> dataList = new ArrayList<String>(); 
	        
	        PreparedStatement select = con 
	        		.prepareStatement(getProducts);
	        
	        select.executeQuery();
	        ResultSet result = select.getResultSet();	
	       
	        while (result.next ()){

	        	  //Add records into data list

	        	  System.out.println(result.getString("name"));
	        	  dataList.add(result.getString("name"));
        	  }

	        	result.close();

		} catch (SQLException | ClassNotFoundException e) { 
	        e.printStackTrace(); 
	    }  
		 RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");

		  if (dispatcher != null){

		  dispatcher.forward(request, response);
	}
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
	  
	        
	            PreparedStatement st = con 
	                   .prepareStatement("INSERT INTO user VALUES(iduser,?, ?)"); 
	  
	            st.setString(1, request.getParameter("name")); 
	            st.setString(2, request.getParameter("password")); 
	  
	            st.executeUpdate(); 
	  
	            // Close all the connections 
	            st.close(); 
	            con.close(); 
	            
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


