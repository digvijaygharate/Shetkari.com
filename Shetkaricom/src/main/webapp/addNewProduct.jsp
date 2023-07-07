
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<link rel="stylesheet" href="../css1/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>

<h3 class="alert">Product Added Successfully!</h3>
<%} %>

<% 
if("fail".equals(msg))
{
%>

<h3 class="alert">Some thing went wrong! Try Again!</h3>

<%} %>

<%
int id=1;
try
{
	Connection con=DbConnection.getConnect();
	Statement s=con.createStatement();
	ResultSet rs=s.executeQuery("select max(id) from product");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e)
{
	
}
%>
<form action="addnewproductaction.jsp" method="post">
<h3 style="color: yellow;">Product ID:<% out.print(id); %> </h3>
<input type="hidden" name="id" value="<% out.print(id); %>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="cat" placeholder="Enter Name" required>
 
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
  <input class="input-style" type="number" name="price" placeholder="Enter Name" required>
 
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
   <select name="active">
   	<option value="yes">Yes</option>
   	<option value="no">No</option>
   </select>
<hr>
</div>
 <button class="button">Submit<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>