<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String userid = request.getParameter("name");
	session.putValue("name", userid);
	String password = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "root");
	Statement statement = con.createStatement();
	ResultSet result = statement
			.executeQuery("select * from user where name='" + userid + "' and password='" + password + "'");
	try {
		result.next();
		if (result.getString("password").equals(password) && result.getString("name").equals(userid)) {
			out.println("Welcome " + userid);
		} else {
			out.println("Invalid password or username.");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>