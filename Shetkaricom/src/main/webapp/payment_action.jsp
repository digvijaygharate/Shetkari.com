<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String email=(String)session.getAttribute("session_email");
String name1=request.getParameter("name1");
String name2=request.getParameter("name2");
String name3=request.getParameter("name3");
String name4=request.getParameter("name4");
String name5=request.getParameter("name5");
String name6=request.getParameter("pname");
String name7=request.getParameter("pquan");
String name8=request.getParameter("pprice");
String name10=request.getParameter("pid");
String name9=request.getParameter("pcity");

Date d=new Date();
SimpleDateFormat sdf1=new SimpleDateFormat("dd-MM-yyyy");
String date1=sdf1.format(d);
SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
String time1=sdf2.format(d);
String status="Ordered";
try
{
	Connection con=DbConnection.getConnect();
	PreparedStatement ps=con.prepareStatement("insert into payment(pemail,pid,cno,monthy,code,name,time,date,status,pname,pquan,pprice,pcity) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1, email);
	ps.setString(2, name10);
	ps.setString(3, name1);
	ps.setString(4, name2);
	ps.setString(5,name3);
	ps.setString(6, name4);
	ps.setString(7, time1);
	ps.setString(8, date1);
	ps.setString(9, status);
	ps.setString(10, name6);
	ps.setString(11, name7);
	ps.setString(12, name8);
	ps.setString(13, name9);
	
	
	ps.executeUpdate();
	response.sendRedirect("payment_successful.jsp?msg=done");
			
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("paymet.jsp?msg=fail");
	
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