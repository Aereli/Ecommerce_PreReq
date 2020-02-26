<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<%
	String userid = request.getParameter("name");
	session.putValue("name", userid);
	String password = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false", "root", "root");
	Statement statement = con.createStatement();
	ResultSet result = statement
			.executeQuery("select * from user where name='" + userid + "' and password='" + password + "'");
	try {
		result.next();
		if (result.getString("password").equals(password) && result.getString("name").equals(userid)) {
			out.println("Welcome " + userid);
			
		} else {
			//out.println("Invalid password or username.");
			 response.sendRedirect("index.html"); //error
	         // HttpSession  session=request.getSession(true);
	            session.setAttribute("errorMessage", "Login Failed ");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>


<%
String driver = "com.mysql.jdbc.Driver";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
ResultSet resultSet = null;

%>
<!DOCTYPE html>
<html>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>Product Name</td>
<td>Description</td>
<td>Price</td>
<td>Add</td>
</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false", "root", "root");
statement=connection.createStatement();
String sql ="select * from product";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("name") %>
<td><%=resultSet.getString("description") %></td>
<td><%=resultSet.getString("price") %></td>

<td><a href="addCart.jsp?id=<%=resultSet.getString("idproduct")%>">add</a></td>

</tr>
<%

}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</body>
</html>
