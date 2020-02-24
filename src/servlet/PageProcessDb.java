package servlet;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class PageProcessDb
 */
@WebServlet("/PageProcessDb")
public class PageProcessDb extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public PageProcessDb() {
        super();
        
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
		
		String url = "jdbc:mysql://localhost:3306/mydb";
    	String username = "root";
    	String password = "root";

		String loginName = request.getParameter("name");
		String loginPass = request.getParameter("password");
		
    	System.out.println("Connecting database...");

    	try (Connection connection = (Connection) DriverManager.getConnection(url, username, password)) {
    	    System.out.println("Database connected!");
    	    
    	    String insert = "INSERT INTO user(name,password) VALUES('"+loginName+"','"+loginPass+"')";
    	} catch (SQLException e) {
    	    throw new IllegalStateException("Cannot connect the database!", e);
    	}
    }

	}

