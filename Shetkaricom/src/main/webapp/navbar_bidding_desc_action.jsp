<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
//String femail=(String)session.getAttribute("session_femail");
String message=request.getParameter("mess1");
String femail=request.getParameter("id");
String id=request.getParameter("id5");
String pid=request.getParameter("pid5");

try
{
	Connection con=DbConnection.getConnect();
	PreparedStatement ps=con.prepareStatement("insert into bidding values(?,?,?)");

	ps.setString(1, femail);
	ps.setString(2, message);
	ps.setString(3,pid);
	
	ps.executeUpdate();
	response.sendRedirect("navbar_bidding_desc.jsp?id="+id+"&pid="+pid+"&msg=send");
			
}
catch(Exception e)
{
	response.sendRedirect("navbar_bidding_desc.jsp?msg=fail");
	
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