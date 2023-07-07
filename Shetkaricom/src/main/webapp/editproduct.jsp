
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
<%@include file="components/n_common.jsp" %>
<title>Add New Product</title>
<style>
.back
{
  color: black;
  margin-left: 2.5%
}
h3
{
	color: Green;
	text-align: center;
}
</style>
</head>
<body style="background-color: #eee !important">
<!-- ********************************************************************************************************************************** -->
   <%@include  file="components/farmer_navbar.jsp" %>
      
<!-- ********************************************************************************************************************************** -->

<h3 style="margin-top :100px"> <span style="color:#1bbd36">Update </span> <span style="color:black">Product Details</span></h3>
<%

String pid=request.getParameter("id");
try
{
	Connection con=DbConnection.getConnect();
	Statement s=con.createStatement();
	ResultSet rs=s.executeQuery("select * from product where pid='"+pid+"'");
	while(rs.next())
	{

%>

<div class="container-fluid">
<div class="row">
<div class="col-md-3">
</div>
<div class="col-md-6">
<form action="editproductaction.jsp" method="post">
<input type="hidden" name="id" value="<% out.println(pid);%>">


  <div class="form-group">
    <label for="exampleInputEmail1">Product Name</label>
    <input type="text" class="form-control" name="name1" required="required" id="exampleInputEmail1" value="<%= rs.getString(2) %>" aria-describedby="emailHelp" placeholder="Enter email">
   
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Product Category</label>
   <select name="name2" required class="form-control">
										   	<option value="fruits">Fruits</option>
										   	<option value="crops">Crops</option>
								
										   	
									</select>   </div>
 
  <div class="form-group">
    <label for="exampleInputPassword1">Product About</label>
    <input type="text" class="form-control" name="name11" id="exampleInputPassword1" value="<%= rs.getString(12) %>" required="required" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Product Payment Mode</label>
     <select name="name12" required class="form-control">
										   	<option value="online">Online</option>
										   	<option value="offline">Offline</option>
										   	<option value="both">Both</option>
									</select></div>
  
  
  
  
  <h3 style="margin-top :100px"> <span style="color:#1bbd36">Update User</span> <span style="color:black">Product Details</span></h3>
   <div class="form-group">
    <label for="exampleInputPassword1">Product Price </label>
    <input type="number" class="form-control" name="name3" id="exampleInputPassword1" required="required" placeholder="Password" value="<%= rs.getString(4) %>">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Product Quantity</label>
      <input type="text" class="form-control" name="name4" id="exampleInputPassword1" placeholder="Password" required="required" value="<%= rs.getString(5) %>">
      </div>
      
  <div class="form-group">
    <label for="exampleInputPassword1">Quantity Unit</label>
     
      <select class="form-control" name="name5" required>
								  		<option value="KG">KG</option>
								  		<option value="Quital">Quital</option>
								  		<option value="Ton">Ton</option>
								  	</select> 
      </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Product Active Status</label>
   <select name="name6" required class="form-control">
										   	<option value="Available">Available</option>
										   	<option value="Not Available">Not Available</option>
									</select> </div>
  
  
   <h3 style="margin-top :100px"> <span style="color:#1bbd36">Update WholeSaler</span> <span style="color:black">Product Details</span></h3>
   <div class="form-group">
    <label for="exampleInputPassword1">Product Price </label>
    <input type="number" class="form-control" name="name7" id="exampleInputPassword1" required="required"  value="<%= rs.getString(8) %>">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Product Quantity</label>
    <input type="number" class="form-control" name="name8" id="exampleInputPassword1" placeholder="Password" required="required" value="<%= rs.getString(9) %>">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Quantity Unit</label>
     <select class="form-control" name="name9" required>
								  		<option value="KG">KG</option>
								  		<option value="Quital">Quital</option>
								  		<option value="Ton">Ton</option>
								  	</select> </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Product Active Status</label>
    <select name="name10" required class="form-control">
										   	<option value="Available">Available</option>
										   	<option value="Not Available">Not Available</option>
									</select></div>
  
  
  <button type="submit" class="btn btn-primary">Submit</button>

</form>
</div>
</div>
<div class="col-md-3"></div>

</div>
<%
	}
}catch(Exception e)
{
	System.out.println(e);
}
%>

</body>
<br><br><br>
</body>
</html>