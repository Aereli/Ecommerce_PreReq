<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String userid = request.getParameter("name");
	session.putValue("name", userid);
	String password = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "root");
	Statement st = con.createStatement();
	ResultSet rs = st
			.executeQuery("select * from user where name='" + userid + "' and password='" + password + "'");
	try {
		rs.next();
		if (rs.getString("password").equals(password) && rs.getString("name").equals(userid)) {
			out.println("Welcome " + userid);
		} else {
			out.println("Invalid password or username.");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>