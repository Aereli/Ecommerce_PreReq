<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	
	String userid = request.getParameter("name");
	String password = request.getParameter("password");
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "root");
		Statement st = conn.createStatement();
		int i = st.executeUpdate("insert into user(name,password)values('" + userid + "','" + password + "')");
		out.println("Thank you for register ! Please <a href='index.html'>Login</a> to continue.");
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>