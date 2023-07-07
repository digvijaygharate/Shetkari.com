<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<jsp:scriptlet>
   
    String wfname = (String) session.getAttribute("session_uawid");
    String email1=(String)session.getAttribute("session_wemail");
    String email2=(String)session.getAttribute("session_femail");
    
    String id=request.getParameter("id");
    String p_id=request.getParameter("paymentid");
   // String time=request.getParameter("time");
</jsp:scriptlet>
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
 
  margin-top:110px;
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
 <div class="container h-auto" id="hero">
 <h5 class="section-title h1"><span style="color:#1bbd36">Change</span> <span style="color:black">Order Status</span></h5>
     
     <form action="update_order_status_1_action.jsp" method="post">
     <input type="hidden" name="id1" value="<% out.println(id);%>">
     <input type="hidden" name="id2" value="<% out.println(p_id);%>">
    	
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
			PreparedStatement ps1=con.prepareStatement("select * from payment where pid=?");
			ps1.setString(1,id);
			//ps1.setString(2,time);
			ResultSet rs=ps1.executeQuery();
       		while(rs.next())
       		{
       %>
       
          <tr>
          
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
     	    <td><%=rs.getString(3) %></td>
             <td> <%=rs.getString(8) %></td>
            <td><%=rs.getString(9) %></td>
         <td><input type="text" name="status1" value="<%=rs.getString(10) %>"></td>
           
        
            
            <td><button type="submit" class="btn btn-primary">Submit</button>
			</td>
          </tr>
         <%}
       }
       		catch(Exception e)
       {
       			System.out.println(e);
       }
       		
       		%>
        </tbody>
      </table></form>
     </div> <br><br>
       <%@include file="components/n_footer.jsp" %>

</body>
</html>