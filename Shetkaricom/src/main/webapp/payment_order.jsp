
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.digvijay.connection.DbConnection"%>

<%@page import="java.sql.Connection"%>
<html>
<head>
<jsp:scriptlet>
   
    String wfname = (String) session.getAttribute("session_uawid");
    String email1=(String)session.getAttribute("session_wemail");
    String email2=(String)session.getAttribute("session_femail");
</jsp:scriptlet>

<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forword(1) !=null)
	window.history.forword(1);
</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email=(String)session.getAttribute("session_email");
int total=0;
int sno=0;
try
{
	Connection con=DbConnection.getConnect();
	Statement s=con.createStatement();
	ResultSet rs1=s.executeQuery("select sum(ctotal) from cart where cemail='"+email+"' and caddress is null");
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}

%>
 <tr>
          <th scope="col"><a href="product_cart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><% out.print(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        
          <% 
      ResultSet rs=s.executeQuery("select * from product inner join cart on product.pid=cart.cproduct_id and cart.cemail='"+email+"' and cart.caddress is NULL"); 
      while(rs.next())
      {
      %>
        
          <tr>
          	<%
			sno=sno+1;
			%>
           <td style="background-color:#eee !important"><% out.println(sno); %></td>
            <td style="background-color:#eee !important"><%=rs.getString(2) %></td>
            <td style="background-color:#eee !important"><%=rs.getString(3) %></td>
            <td style="background-color:#eee !important"><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
            <td style="background-color:#eee !important"><a href="incdecquantityaction.jsp?id=<%= rs.getString(1)%>&quantity=inc"><i class='fa fa-plus-circle'></i></a><%=rs.getString(11) %>  <a href="incdecquantityaction.jsp?id=<%= rs.getString(1)%>&quantity=dec"><i class='fa fa-minus-circle'></i></a></td>
            <td style="background-color:#eee !important"><i class="fa fa-inr"></i> <%=rs.getString(14) %></td>
            </tr>
         <%} 
      String id;
         ResultSet rs2=s.executeQuery("select * from register where email='"+email+"' ");
         while(rs2.next())
         {
        	 //id=rs2.getString("fname");
         
         %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="payment_order_action.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
<input type="text" value="<%= rs2.getString(2) %>">
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input type="text" value="<%= rs2.getString(4) %>">
</div> 

<div class="left-div">
<h3>Enter State</h3>

</div>

<div class="right-div">
<h3>Enter country</h3>

</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
<select name="payment">
<option value="cod">Cash On Delivery</option>
<option value="op">Online Payment</option>
</select>
 
</div>

<div class="right-div">
<h3>Pay online on this btechdays@pay.com</h3>

<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>

<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<i class='far fa-arrow-alt-circle-right'></i>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
      
         }
}catch(Exception e)
{
	
}

%>
  
      <br>
      <br>
      <br>

</body>
</html>