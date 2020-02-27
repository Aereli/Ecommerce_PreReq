<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>



<%
	String id = request.getParameter("id");
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String database = "mydb?useSSL=false";
	String userid = "root";
	String password = "root";
	try {
		Class.forName(driver);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>


<%!ArrayList al = new ArrayList();%>
<%
	try {
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		//statement=connection.createStatement();
		//select * from product where idproduct in (2); this line works in MySQL
		//String getProductId ="select * from product where idproduct in="+id;

		//prepared statement WORKS
		//String getProductId = "select * from product where idproduct in('"+id+"')";
		//resultSet = statement.executeQuery(getProductId);

		String getProductId = "select * from product where idproduct in (?);";
		PreparedStatement st = connection.prepareStatement(getProductId);
		st.setString(1, id);
		System.out.println(st);

		resultSet = st.executeQuery();
		System.out.println(resultSet);
		while (resultSet.next()) {
		
%>

	<% al.add(0, resultSet.getString("price")); %>
<select>
	<%
		for (int i = 0; i < al.size(); i++) {
					String option = (String) al.get(i);
	%>
	<option value="<%=option%>"><%=option%></option>
	<%
		}
	%>
</select>
<!DOCTYPE html>
<html>
<body>
	<h1>these are the items in your cart!</h1>
	<form method="post" action="cartOrder.jsp">
		<input type="hidden" name="idproduct"
			value="<%=resultSet.getString("idproduct")%>"> Product Name:<br>
		<input type="text" name="name"
			value="<%=resultSet.getString("name")%>"> <br>
		Description:<br> <input type="text" name="description"
			value="<%=resultSet.getString("description")%>"> <br>
		Price:<br> <input type="text" name="price"
			value="<%=resultSet.getString("price")%>"> <br>
		<br> <input type="submit" value="submit">
		
	</form>



	<%
		}
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>