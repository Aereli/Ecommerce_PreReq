<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
	String url = "jdbc:mysql://localhost:3306/mydb?useSSL=false";
	String driverName = "com.mysql.jdbc.Driver";
	String username = "root";
	String password = "root";
	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement;
	ResultSet resultSet;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<table>

		<%
			try (Connection con = (Connection) DriverManager.getConnection(url, username, password)) {
				System.out.println("Database connected!");

				statement = connection.createStatement();
				resultSet = statement.executeQuery("select * from product");
				while (resultSet.next()) {
					
		%>
		
		 <%
		  System.out.println(resultSet.getString("name"));		 
		 %>
		<tr>
			<td><%=resultSet.getString("idproduct")%></td>

			<td><%=resultSet.getString("name")%></td>

		</tr>
		<%
			}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>

	</table>

</body>
</html>