<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

String id=request.getParameter("id");
String name1=request.getParameter("name1");
String name2=request.getParameter("name2");
String name3=request.getParameter("name3");
String name4=request.getParameter("name4");
String name5=request.getParameter("name5");
String name6=request.getParameter("name6");
String name7=request.getParameter("name7");
String name8=request.getParameter("name8");
String name9=request.getParameter("name9");
String name10=request.getParameter("name10");
String name11=request.getParameter("name11");
String name12=request.getParameter("name12");
//String name8=request.getParameter("name8");

try
{
	Connection con=DbConnection.getConnect();
	Statement s=con.createStatement();
	s.executeUpdate("update product set pname='"+name1+ "',pcat='"+name2+ "',puprice='"+name3+ "',puquantity='"+name4+ "',puunit='"+name5+"',  puactive='"+name6+ "',pwprice='"+name7+ "',pwquantity='"+name8+ "', pwunit='"+name9+"' ,pwactive='"+name10+ "',   pabout='"+name11+ "',ppayment='"+name12+ "' where pid='"+id+"' ");
	//response.sendRedirect("allProductEditProduct.jsp?msg=done");
	if(name5.equals("No"))
	{
		s.executeUpdate("delete from cart where cproduct_id='"+id +"' and caddress is null  ");
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
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