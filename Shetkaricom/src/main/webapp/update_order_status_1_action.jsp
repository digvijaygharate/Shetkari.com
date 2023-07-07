<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
//int id1=8;
//String email=(String)session.getAttribute("session_email");
String id=request.getParameter("id1");
String pid=request.getParameter("id2");
String name1=request.getParameter("status1");
//String name1="ontheway";
try
{
	Connection con=DbConnection.getConnect();
	Statement s=con.createStatement();
	System.out.print(id);
	//System.out.print(name1);
	s.executeUpdate("update payment set status='"+name1+ "' where pid='"+id+"' and payment_id='"+pid+"' ");
	//response.sendRedirect("allProductEditProduct.jsp?msg=done");
	System.out.println(name1);
	System.out.println(pid);
	response.sendRedirect("update_order_status.jsp?msg=done");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("update_order_status.jsp?msg=wrong");
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