<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
String id1=request.getParameter("id1");
String pid=request.getParameter("pid");
String name1=request.getParameter("status1");

try
{
	Connection con=DbConnection.getConnect();
	Statement s=con.createStatement();
	System.out.println(id1);
	s.executeUpdate("update cart set status='"+name1+ "' where cproduct_id='"+pid+"' and cemail='"+id1+"'  ");
	//response.sendRedirect("allProductEditProduct.jsp?msg=done");
		response.sendRedirect("user_farmer_data.jsp?msg=done");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("user_farmer_data.jsp?msg=wrong");
}

%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>