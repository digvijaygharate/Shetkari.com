<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
.dtHorizontalExampleWrapper {
  max-width: 600px;
  margin: 0 auto;
}
#dtHorizontalExample th, td {
  white-space: nowrap;
}

table.dataTable thead .sorting:after,
table.dataTable thead .sorting:before,
table.dataTable thead .sorting_asc:after,
table.dataTable thead .sorting_asc:before,
table.dataTable thead .sorting_asc_disabled:after,
table.dataTable thead .sorting_asc_disabled:before,
table.dataTable thead .sorting_desc:after,
table.dataTable thead .sorting_desc:before,
table.dataTable thead .sorting_desc_disabled:after,
table.dataTable thead .sorting_desc_disabled:before {
 bottom: .5em;
 
 
</style>
</head>
<body>
  <%@include file="components/admin_navbar.jsp" %>
<div class="container-fluid" style="margin-top:100px">
 <table class="table table-striped table-bordered" style="width: 800px;">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Pname</th>
             <th scope="col">Pcat</th>
            <th scope="col">Uprice</th>
            <th scope="col">Uquantity</th>
         
        	<th scope="col">Ustatus</th>
        	<th scope="col">Wprice</th>
            <th scope="col">Wquantity</th>
          
        	<th scope="col">Wstatus</th>
        	<th scope="col">About</th>
        	<th scope="col">Payment</th>
        	<th scope="col">Image</th>
        	<th scope="col">Email</th>
        	
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from product");
			//ps1.setString(1,email2);
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
     
            <td><%=rs.getString(7) %></td>
            <td><%=rs.getString(8) %></td>
            <td><%=rs.getString(9) %></td>
          
             <td><%=rs.getString(11) %></td>
              <td><%=rs.getString(12) %></td>
               <td><%=rs.getString(13) %></td>
                <td><%=rs.getString(14) %></td>
                 <td><%=rs.getString(15) %></td>
            <td><a href="#">Delete <i class='fas fa-pen-fancy'></i></a></td>
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







</body>
</html>