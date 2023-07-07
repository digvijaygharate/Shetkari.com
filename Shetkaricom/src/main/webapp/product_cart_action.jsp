<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

//String email=session.getAttribute("email").toString();
String email=(String)session.getAttribute("session_email");
//String email=request.getParameter("email");
String product_id=request.getParameter("pid1");
String quant=request.getParameter("quant1");
//int quantity=1;
int price=0;
int product_total=0;
int cart_total=0;

int z=0;
try{
	Connection con=DbConnection.getConnect();
	Statement s=con.createStatement();
	ResultSet rs=s.executeQuery("select * from product where pid='"+product_id+"' ");
	while(rs.next())
	{
		price=rs.getInt(4);
		product_total=price;
	}
	ResultSet rs1=s.executeQuery("select * from cart where cproduct_id='"+product_id+"' and cemail='" +email+"' and caddress is NULL ");
	while(rs1.next())
	{
		cart_total=rs1.getInt(5);
		cart_total=cart_total+product_total;
		quant=rs1.getString(3);
		//quantity=quantity+1;
		z=1;
	}
	if(z==1)
	{
		s.executeUpdate("update cart set ctotal='"+cart_total+"',cquantity='"+quant+"' where cproduct_id='"+product_id+"' and cemail='"+email+"' and caddress is NULL ");
		response.sendRedirect("product_cart.jsp?msg=exist");
	}
	if(z==0)
	{
		String status="Pending";
		PreparedStatement ps=con.prepareStatement("insert into cart(cemail,cproduct_id,cquantity,cprice,ctotal,status) values(?,?,?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, product_id);
		ps.setString(3, quant);
		ps.setInt(4, price);
		ps.setInt(5,product_total );
		ps.setString(6,status );
		ps.executeUpdate();
		response.sendRedirect("product_cart.jsp?msg=added");
	}
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("product_cart.jsp?msg=invalid");
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