<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
String id=request.getParameter("pid");
String name=request.getParameter("pname");
String quan=request.getParameter("pquantity");
String cat=request.getParameter("pcategory");
String exp=request.getParameter("pexpected");
String pay=request.getParameter("ppayment");
String about=request.getParameter("pabout");
String active=request.getParameter("pactive");
String email=request.getParameter("pemail");



try
{
	Connection con=DbConnection.getConnect();
	PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,?,?,?)");
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3, cat);
	ps.setString(4, exp);
	ps.setString(5,quan);
	ps.setString(6, active);
	ps.setString(7, about);
	ps.setString(8, pay);
	
	ps.executeUpdate();
	response.sendRedirect("farmer_profile.jsp?msg=done");
			
}
catch(Exception e)
{
	response.sendRedirect("farmer_profile.jsp?msg=fail");
	
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