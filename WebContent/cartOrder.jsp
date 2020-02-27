<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%!String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/mydb?useSSL=false";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String description = request.getParameter("description");
	String price = request.getParameter("price");

	if (id != null) {
		Connection con = null;
		PreparedStatement ps = null;
		int personID = Integer.parseInt(id);
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, psw);
			// String sql="INSERT into product_has_order id=?,first_name=?,last_name=?,city_name=?,email=? where id="+id;
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, first_name);
			ps.setString(3, last_name);

			int i = ps.executeUpdate();
			if (i > 0) {
				out.print("Record Updated Successfully");
			} else {
				out.print("There is a problem in updating Record.");
			}
		} catch (SQLException sql) {
			request.setAttribute("error", sql);
			out.println(sql);
		}
	}
%>