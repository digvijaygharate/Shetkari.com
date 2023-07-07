<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
String email=(String)session.getAttribute("session_email");
String id=request.getParameter("id");
String incdec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity=0;
int final_total=0;
try
{
	

	Connection con=DbConnection.getConnect();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart where cemail='"+email+"' and cproduct_id='"+ id+"' and caddress is null");
	while(rs.next())
	{
		
		price=rs.getInt(4);
		total=rs.getInt(5);
		quantity=rs.getInt(3);
	}
	if(quantity==1 && incdec.equals("dec"))
	
		response.sendRedirect("product_cart.jsp?msg=notpossible");
		else if(quantity !=1 && incdec.equals("dec"))
		{
			total=total-price;
			quantity=quantity-1;
			st.executeUpdate("update cart set ctotal='"+total+"',cquantity='"+quantity+"' where cemail='"+email+"' and cproduct_id='"+id+"' and caddress is null ");
			response.sendRedirect("product_cart.jsp?msg=dec");
		}
		else
		{
			total=total+price;
			quantity=quantity+1;
			st.executeUpdate("update cart set ctotal='"+total+"',cquantity='"+quantity+"' where cemail='"+email+"' and cproduct_id='"+id+"' and caddress is null ");
			response.sendRedirect("product_cart.jsp?msg=inc");
		}
	}

catch(Exception e)
{
	System.out.print(e);
}

%>

