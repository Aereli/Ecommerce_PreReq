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

<%!ArrayList total = new ArrayList();%>

<%!ArrayList al1 = new ArrayList();%>
<%!ArrayList al2 = new ArrayList();%>
<%!ArrayList al3 = new ArrayList();%>

<%
	try {
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		//statement=connection.createStatement();
		//select * from product where idproduct in (2); this line works in MySQL
		//String getProductId ="select * from product where idproduct in="+id;

		//prepared statement WORKS
		//String getProductId = "select * from product where idproduct in('"+id+"')";
		//resultSet = statement.executeQuery(getProductId);
		//String getUserId = "select * from user";
		//PreparedStatement userIdStatement = connection.prepareStatement(getUserId);
		//userIdStatement.setString(1,)
		String getProductId = "select * from product where idproduct in (?);";
		PreparedStatement st = connection.prepareStatement(getProductId);
		st.setString(1, id);
		System.out.println(st);

		resultSet = st.executeQuery();
		System.out.println(resultSet);
		while (resultSet.next()) {
		
%>

  

<% total.add(0, resultSet.getString("price")); %>

	<% 
		Integer priceCounter = 0;
		for (int j = 0; j < total.size(); j++) {
					String totalPrice = (String) total.get(j);
					
					priceCounter += Integer.parseInt(totalPrice);
	%>
	
	
	<%
		}
	%>

<% al1.add(0, resultSet.getString("price")); %>
<% al2.add(0, resultSet.getString("name")); %>
<% al3.add(0, resultSet.getString("description")); %>

<!DOCTYPE html>
<html>
<body>
<form>
<h1>These are all your cart items!</h1>


<form method="post" action="order.jsp">
<h3> Your total amount to pay is:</h3>
$:<input value="<%=priceCounter%>"></input>
<input type="submit" value=submit>
</form>

<br>


	<%
	Integer count = 0;
		for (int i = 0; i < al1.size(); i++) {
					String pricePro = (String) al1.get(i);
					String namePro = (String) al2.get(i);
					String descriptionPro = (String) al3.get(i);
					count++;
	%>
	
			<table border="">
			<tr>
			<td>Item:<%=count %>
			</td></tr>
			<tr>
			<td>Product Name</td>
			<td>
				<input type="text" name="name"
				value="<%=namePro%>">
			</td>
			</tr>
			<tr>
			<td>Description</td>
			<td>
				<input type="text" name="name"
				value="<%=descriptionPro%>">
			</td>
			</tr>
	<tr>
			<td>Price</td>
			<td>
				<input type="text" name="name"
				value="<%=pricePro%>">
			</td>
			</tr>
			
			</table>
			<br>
	<%
		}
	%>
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