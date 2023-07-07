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
	s.executeUpdate("delete from cart where cemail='"+email+"' and cproduct_id='"+id+"' and caddress is NULL");
	response.sendRedirect("product_cart.jsp?msg=removed");
}catch(Exception e)
{
	System.out.print(e);
}
%>
    
    