<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("idproduct");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
//select * from product where idproduct in (2); this line works in MySQL
String sql ="select * from product where idproduct"= +id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="addCart.jsp">
<input type="hidden" name="idproduct" value="<%=resultSet.getString("idproduct") %>">
<input type="text" name="idproduct" value="<%=resultSet.getString("idproduct") %>">
<br>
First name:<br>
<input type="text" name="name" value="<%=resultSet.getString("name") %>">
<br>
Last name:<br>
<input type="text" name="description" value="<%=resultSet.getString("description") %>">
<br><br>
<input type="submit" value="submit">
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