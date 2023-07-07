<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- ********************************************************************************************************************************** -->

<jsp:declaration>Connection con=null;</jsp:declaration>
<!-- ********************************************************************************************************************************** -->

<jsp:scriptlet>
    String fname = (String) session.getAttribute("session_fname");
    String lname = (String) session.getAttribute("session_lname");
    String email=(String) session.getAttribute("session_email");
    String gender = (String) session.getAttribute("session_gender");
    String city = (String) session.getAttribute("session_city");
    String profile_pic = (String) session.getAttribute("session_profilepic");
    
    String title = (String) session.getAttribute("session_title");
    String skills = (String) session.getAttribute("session_skills");
    String state = (String) session.getAttribute("session_state");
    String image = (String) session.getAttribute("session_image");
</jsp:scriptlet>


<!-- ********************************************************************************************************************************** -->

<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Profile</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/style.css" />
   <%@include file="components/common_css_js.jsp" %>
<!-- ********************************************************************************************************************************** -->
<style>
@import url("https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap");
body {
	background: #f9f9f9;
	font-family: "Roboto", sans-serif;
}

.shadow {
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1) !important;
}

.profile-tab-nav {
	min-width: 250px;
}

.tab-content {
	flex: 1;
}

.form-group {
	margin-bottom: 1.5rem;
}

.nav-pills a.nav-link {
	padding: 15px 20px;
	border-bottom: 1px solid #ddd;
	border-radius: 0;
	color: #333;
}
.nav-pills a.nav-link i {
	width: 20px;
}

.img-circle img {
	height: 100px;
	width: 100px;
	border-radius: 100%;
	border: 5px solid #fff;
}
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

        <%@include file="components/admin_navbar.jsp" %>
<!-- ********************************************************************************************************************************** -->
   
</head>
<body>
<script>
$(document).ready(function () {
	  $('#dtHorizontalExample').DataTable({
	    "scrollX": true
	  });
	  $('.dataTables_length').addClass('bs-select');
	});
</script>
<!-- ********************************************************************************************************************************** -->
  
<!-- <div class="row">
            <div class="col-md-2"> </div>
            <div class="col-md-8">
                <div class="row" style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                    <div class="col-md-2">
                        <a href="user_profile_pic_edit.jsp" style="font-size: 12px; float: right"> <span class="fa fa-pencil"></span></a>
                        <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="100" style="border-radius: 50px"/>
                    </div>
                    <div class="col-md-10">
                      
                        <b> <jsp:expression>title</jsp:expression> </b> <br> <br>
                        <span style="color: #acaaaa"> Skills : </span> <jsp:expression>skills</jsp:expression> <br> <br>
                        <span style="color: #acaaaa"> Gender : </span> <jsp:expression> gender</jsp:expression> <br>
                        <span style="color: #acaaaa"> City : </span> <jsp:expression> city</jsp:expression> <br>
                   
                        </div>
                </div> <br> <br>
                  </div>
                    </div>
 -->                    
<!-- ********************************************************************************************************************************** -->
<section  style="background-color :#eee !important; margin-top:80px ">
		<div class="container-fluid m-0">
		
			<div class="bg-white shadow rounded-lg  d-block d-sm-flex " >
				<div class="profile-tab-nav border-right">
					<div class="p-4">
						
						<h4 class="text-center">Hello Admin</h4>
					</div>
					<div class="nav flex-column nav-pills"  id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link active"  id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
							<i class="fa fa-home text-center mr-1" ></i> 
							User Details
						</a>
					
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#security" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							User Extra Details
						</a>
						
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#farmer" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Farmer Details
						</a>
						
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#farmerdetails" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Farmer Extra Details
						</a>
						
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#wholesaler" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Wholesaler Details
						</a>
						
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#wholesalerdetails" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Wholesaler Extra Details
						</a>
						
						<!-- 
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#appliedfarmer" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Applied Farmer 
						</a>
						 -->
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#appliedfarmeruser" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							User Applied To Farmer 
						</a>
						
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#appliedfarmerwholesaler" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							WholeSaler Applied To Farmer
						</a>
						
						<!-- 
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#appliedwholesaler" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Applied Wholesaler
						</a>
						-->
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#appliedwholesalerfarmer" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Farmer Applied To Wholesaler 
						</a>
						
						
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#appliedwholesaleruser" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							User Applied To WholeSaler 
						</a>
						
						
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#payment" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
						Payment Details
						</a>
						
						
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#product" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Product Details
						</a>
						
						
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#pcat" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Add Product Category
						</a>
					
					
					</div>
				</div>
				
				
				
				
				
				<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
						<h3 class="mb-4">User Details</h3>
						
					   
		<table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Fname</th>
            <th scope="col">Lname</th>
            <th scope="col">Gender</th>
            <th scope="col">Email</th>
            <th scope="col">Password</th>
            <th scope="col">City</th>
         
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from register");
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
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
          
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
					
					
					
					
					
	<div class="tab-pane fade" id="security" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">User Extra Details</h3>
								<table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">State</th>
            <th scope="col">About</th>
            <th scope="col">Image</th>
        
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from about_user");
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
	
	
	
	
	<div class="tab-pane fade" id="farmer" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">Farmer Details</h3>
								
        <table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Fname</th>
            <th scope="col">Lname</th>
            <th scope="col">Gender</th>
            <th scope="col">Email</th>
            <th scope="col">Password</th>
            <th scope="col">City</th>
         
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from farmer");
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
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
          
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
					
					
					
				<div class="tab-pane fade" id="farmerdetails" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">Farmer Extra Details</h3>
								<table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">About</th>
            <th scope="col">State</th>
            <th scope="col">Experience</th>
            <th scope="col">Available</th>
            <th scope="col">Quantity</th>
            <th scope="col">Unit</th>
            <th scope="col">Payment</th>
            <th scope="col">Image</th>
        
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from about_farmer");
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
            <td><%=rs.getString(6) %></td>
             <td><%=rs.getString(7) %></td>
              <td><%=rs.getString(8) %></td>
               <td><%=rs.getString(9) %></td>
                <td><%=rs.getString(10) %></td>
          
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
					
					
					
					<div class="tab-pane fade" id="wholesaler" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">WholeSaler Details</h3>
								
        <table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Fname</th>
            <th scope="col">Lname</th>
            <th scope="col">Gender</th>
            <th scope="col">Email</th>
            <th scope="col">Password</th>
            <th scope="col">City</th>
         
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from wholesaler");
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
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
          
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
					
				
				
					<div class="tab-pane fade" id="wholesalerdetails" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">Wholesaler Extra Details</h3>
								<table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">About</th>
            <th scope="col">State</th>
            <th scope="col">Experience</th>
            <th scope="col">Need</th>
            <th scope="col">Quantity</th>
            <th scope="col">Company</th>
            <th scope="col">Payment</th>
             <th scope="col">Category</th>
            <th scope="col">Image</th>
        
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from about_wholesaler");
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
            <td><%=rs.getString(6) %></td>
             <td><%=rs.getString(7) %></td>
              <td><%=rs.getString(8) %></td>
               <td><%=rs.getString(9) %></td>
                <td><%=rs.getString(10) %></td>
                  <td><%=rs.getString(11) %></td>
          
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
	
	
	
			<div class="tab-pane fade" id="appliedfarmer" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">Applied Farmer Details</h3>
								<table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Farmer Id</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
        
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from applied_farmer");
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
	
	
			<div class="tab-pane fade" id="appliedfarmeruser" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">User Applied To Farmer Details</h3>
								<table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Farmer Id</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
        	<th scope="col">Status</th>
        	<th scope="col">Message</th>
        	
        	
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from applied_farmer_user");
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
           <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
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
	
	
	
	<div class="tab-pane fade" id="appliedfarmerwholesaler" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">WholeSaler Applied To Farmer</h3>
								<table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Farmer Id</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
        	<th scope="col">Status</th>
        	<th scope="col">Message</th>
        	
        	
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from applied_farmer_wholesaler");
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
           <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
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
	
	
	
	
	
	<div class="tab-pane fade" id="appliedwholesaler" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">Applied WholeSaler Details</h3>
								<table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">WholeSaler Id</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
        
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from applied_ws");
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
	
	
			<div class="tab-pane fade" id="appliedwholesalerfarmer" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">Farmer Applied To Wholesaler Details</h3>
								<table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">WholeSaler Id</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
        	<th scope="col">Status</th>
        	<th scope="col">Message</th>
        	
        	
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from applied_ws_farmer");
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
           <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
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
	
	
	
	<div class="tab-pane fade" id="appliedwholesaleruser" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">User Applied To WholeSaler Details</h3>
								<table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Farmer Id</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
        	<th scope="col">Status</th>
        	<th scope="col">Message</th>
        	
        	
            <th scope="col">Delete </th>
          </tr>
        </thead>
        <tbody>
       
       <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
			PreparedStatement ps1=con.prepareStatement("select * from applied_ws_user");
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
           <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
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
	
	
		<div class="tab-pane fade"  id="product" role="tabpanel" aria-labelledby="security-tab"  >
					
						<h3 class="mb-4">Product Details</h3>
						 <div class="form-group " >
						<a href="admin_product_details.jsp" class="btn btn-outline-info">Check Product Details</a>
			</div>
	</div>	
	
	
		<div class="tab-pane fade" id="payment" role="tabpanel" aria-labelledby="security-tab" >
					
						<h3 class="mb-4">Payment Details</h3>
								<table class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Product Id</th>
            <th scope="col">CNo</th>
            <th scope="col">Month</th>
        	<th scope="col">Code</th>
        	<th scope="col">Name</th>
        	<th scope="col">Time</th>
        	<th scope="col">Date</th>
        	<th scope="col">Status</th>
        	
            <th scope="col">Delete </th>
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
       %>
       
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td> <%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
           <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
            <td><%=rs.getString(8) %></td>
            <td><%=rs.getString(9) %></td>
            <td><%=rs.getString(10) %></td>
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
	
	
				<div class="tab-pane fade"  id="pcat" role="tabpanel" aria-labelledby="security-tab"  >
					
						<h3 class="mb-4">Add Product Category</h3>
						 <div class="form-group " >
						<a href="admin_product_category.jsp" class="btn btn-outline-info">Add Product Category</a>
			</div>
	</div>	
				
					
					
					
					</div>
					</div>
					</div>
					</section>
					

<!-- ********************************************************************************************************************************** -->
<%@include file="components/n_footer.jsp" %>
<!-- ********************************************************************************************************************************** -->
<!--  <a href="user_profile_about.jsp"><button>Edit Profile</button></a>
 -->
</body>
</html>