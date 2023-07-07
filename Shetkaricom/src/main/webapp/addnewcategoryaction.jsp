<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
String id=request.getParameter("pid");
String name=request.getParameter("pname");




try
{
	Connection con=DbConnection.getConnect();
	PreparedStatement ps=con.prepareStatement("insert into category values(?,?)");
	ps.setString(1, id);
	ps.setString(2, name);
	
	
	ps.executeUpdate();
	response.sendRedirect("admin_product_category.jsp?msg=done");
			
}
catch(Exception e)
{
	response.sendRedirect("admin_product_category.jsp?msg=fail");
	
}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>