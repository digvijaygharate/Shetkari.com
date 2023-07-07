<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>

<jsp:scriptlet>
   
    String wfname = (String) session.getAttribute("session_uawid");
    String email1=(String)session.getAttribute("session_wemail");
    String email2=(String)session.getAttribute("session_femail");
</jsp:scriptlet>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
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
   <%@include  file="components/wholesaler_navbar.jsp" %>
      
<!-- ********************************************************************************************************************************** -->



<%

String msg=request.getParameter("msg");


if("done".equals(msg))
{
%>


<h3 class="alert">Product Successfully Updated!</h3>
<%} %>
<%

if("fail".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>


<div class="container" id="hero">
	<div class="row">
 <h5 class="section-title h1"><span style="color:#1bbd36">Check</span> <span style="color:black">Requested User</span></h5>
      
		<table class="table">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Farmer ID</th>
            <th scope="col">User ID</th>
            <th scope="col">WholeSaler Email</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
            <th scope="col">Active Status</th>
            <th scope="col">Message</th>
           	<th scope="col">Chat </th>
            <th scope="col">Edit </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps2=con.prepareStatement("select * from applied_ws_user where wsid=?");
			ps2.setString(1,email1);
			ResultSet rs2=ps2.executeQuery();
       		while(rs2.next())
       		{
       %>
       
          <tr>
            <td><%=rs2.getString(1) %></td>
            <td>None</td>
             <td><%=rs2.getString(2) %></td>
            <td><%=rs2.getString(3) %></td>
            <td> <%=rs2.getString(4) %></td>
            <td><%=rs2.getString(5) %></td>
            <td><%=rs2.getString(6) %></td>
            <td><%=rs2.getString(7) %></td>
             <td><a href="chatwithwholesaler&user.jsp?id=<%=rs2.getString(2)%>&id1=<%=rs2.getString(1)%>">Chat <i class='fas fa-pen-fancy'></i></a></td>
           
            <td><a href="edit_wholesaler_status.jsp?id=<%=rs2.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%}
       }
       		catch(Exception e)
       {
       			System.out.println(e);
       }
       		
       		%>  <br>
        </tbody>
         <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from applied_ws_farmer where wsid5=?");
			ps1.setString(1,email1);
			ResultSet rs=ps1.executeQuery();
       		while(rs.next())
       		{
       %>
       
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
             <td>None</td>
            <td><%=rs.getString(3) %></td>
            <td> <%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
             <td><a href="chatwithfarmerwholesaler.jsp?id=<%=rs.getString(2)%>&id1=<%=rs.getString(1)%>">Chat <i class='fas fa-pen-fancy'></i></a></td>
           
            <td><a href="edit_wholesaler_status.jsp?id=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
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
       
      </div>  
      </div>
      