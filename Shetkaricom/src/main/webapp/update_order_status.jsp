<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:scriptlet>
   
    String wfname = (String) session.getAttribute("session_uawid");
    String email1=(String)session.getAttribute("session_wemail");
    String email2=(String)session.getAttribute("session_femail");
</jsp:scriptlet>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/n_common.jsp" %>
<style>
h3
{
	color: Green;
	text-align: center;
}
#hero {
 
  margin-top:100px;
  height:auto;
	  background: #eee !important;


}
body
{
background: #eee !important;
}
</style>
</head>
<body>
<!-- ********************************************************************************************************************************** -->
   <%@include  file="components/farmer_navbar.jsp" %>
      
<!-- ********************************************************************************************************************************** -->
<div class="container" id="hero">
	<div class="row">
 <h5 class="section-title h1"><span style="color:#1bbd36">Check</span> <span style="color:black">Requested User</span></h5>
      
		<table class="table">
        <thead>
          <tr>
            <th scope="col">Payement ID</th>
            <th scope="col">User Email</th>
            <th scope="col">Product ID</th>
            <th scope="col">Time</th>
            <th scope="col">Date</th>
            <th scope="col">Active Status</th>
           
            <th scope="col">Edit </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from payment");
			//ps1.setString(1,email2);
			ResultSet rs=ps1.executeQuery();
       		while(rs.next())
       		{
       			//PreparedStatement ps2=con.prepareStatement("select * from cart where ");
    			//ps1.setString(1,email2);
    			//ResultSet rs2=ps2.executeQuery();
           		//while(rs2.next())
       %>
       
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td> <%=rs.getString(8) %></td>
            <td><%=rs.getString(9) %></td>
            <td><%=rs.getString(10) %></td>
           
            
            <td><a href="update_order_status_1.jsp?id=<%=rs.getString(3) %>&paymentid=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%}
       }
       		catch(Exception e)
       {
       			System.out.println(e);
       }
       		
       		%>  <br>
        </tbody>
      </table>
     </div></div>

</body>
</html>