
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<%@include file="components/common_css_js.jsp" %>
<style>
h3
{
	color: Green;
	text-align: center;
}
#hero {
 
  	  margin-top:100px;
	  background: #eee !important;
	  height:auto;


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


<div class="container h-auto" id="hero">
	<div class="row">

<h5 class="section-title h1"><span style="color:#1bbd36">Check User</span> <span style="color:black">Product Details</span></h5>
   
		<table class="table">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Unit</th>
            <th scope="col">Active Status</th>
            <th scope="col">About</th>
            <th scope="col">Payment Mode</th>
            <th scope="col">Image</th>
            <th scope="col">Edit </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		Statement s=con.createStatement();
       		ResultSet rs=s.executeQuery("select * from product");
       		while(rs.next())
       		{
       %>
       
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td> <%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
            <td><%=rs.getString(12) %></td>
             <td><%=rs.getString(13) %></td>
             <td><%=rs.getString(14) %></td>
            <td><a href="editproduct.jsp?id=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%}
       }
       		catch(Exception e)
       {
       			System.out.println(e);
       }
       		
       		%>
        </tbody>
      </table>
      
      
      <h5 class="section-title h1" style="margin-top :50px ;"><span style="color:#1bbd36">Check WholeSaler</span> <span style="color:black">Product Details</span></h5>
   
		<table class="table" style="margin-bottom:100px">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Unit</th>
            <th scope="col">Active Status</th>
            <th scope="col">About</th>
            <th scope="col">Payment Mode</th>
            <th scope="col">Image</th>
            <th scope="col">Edit </th>
          </tr>
        </thead>
        <tbody>
         <%
       try{
       		Connection con=DbConnection.getConnect();
       		Statement s=con.createStatement();
       		ResultSet rs=s.executeQuery("select * from product");
       		while(rs.next())
       		{
       %>
       
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td> <%=rs.getString(8) %></td>
            <td><%=rs.getString(9) %></td>
            <td><%=rs.getString(10) %></td>
            <td><%=rs.getString(11) %></td>
            <td><%=rs.getString(12) %></td>
             <td><%=rs.getString(13) %></td>
             <td><%=rs.getString(14) %></td>
            <td><a href="editproduct.jsp?id=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%}
       }
       		catch(Exception e)
       {
       			System.out.println(e);
       }
       		
       		%>
        </tbody>
      </table>
      
      
      
      </div>
      </div>
      
     
<!-- ======= Footer ======= -->
    <%@include file="components/n_footer.jsp" %>
  <!-- End Footer -->
</body>
</html>