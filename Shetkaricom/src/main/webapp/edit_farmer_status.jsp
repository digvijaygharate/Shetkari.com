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
    
    String id=request.getParameter("id");
    String time=request.getParameter("time");
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
 <h5 class="section-title h1"><span style="color:#1bbd36">Accept</span> <span style="color:black">User Request</span></h5>
     
     <form action="edit_farmer_status_action.jsp" method="post">
     <input type="hidden" name="id1" value="<% out.println(id);%>">
    
     <table class="table">
        <thead>
          <tr>
           <th scope="col">ID</th>
            <th scope="col">Requested ID</th>
            <th scope="col">Farmer Email</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
            <th scope="col">Active Status</th>
            <th scope="col">Message</th>
           
           
            <th scope="col">Edit </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from applied_farmer_user where id=?");
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
            <td> <%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><input type="text" name="status1" placeholder="<%=rs.getString(6) %>"></td>
            <td><%=rs.getString(7) %></td>
           
        
            
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