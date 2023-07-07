<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
String id1=request.getParameter("id1");
String pid=request.getParameter("time");
String name1=request.getParameter("status1");

try
{
	Connection con=DbConnection.getConnect();
	Statement s=con.createStatement();
	System.out.println(id1);
	s.executeUpdate("update applied_ws_farmer set status5='"+name1+ "' where id='"+id1+"'   ");
	s.executeUpdate("update applied_ws_user set status1='"+name1+ "' where id='"+id1+"'   ");
	//response.sendRedirect("allProductEditProduct.jsp?msg=done");
		response.sendRedirect("wholesaler_data.jsp?msg=done");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("wholesaler_data.jsp?msg=wrong");
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