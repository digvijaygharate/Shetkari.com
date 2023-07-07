<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

String email=(String)session.getAttribute("session_email");
String id=request.getParameter("id");

try
{
	Connection con=DbConnection.getConnect();
	Statement s=con.createStatement();
	s.executeUpdate("delete from payment where pemail='"+email+"' and payment_id='"+id+"' ");
	response.sendRedirect("tracking.jsp?msg=removed");
}catch(Exception e)
{
	System.out.print(e);
}
%>
    
    