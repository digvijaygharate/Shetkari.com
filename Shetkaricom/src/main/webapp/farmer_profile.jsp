<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<!-- ********************************************************************************************************************************** -->

<jsp:declaration>Connection con=null;</jsp:declaration>
<!-- ********************************************************************************************************************************** -->

<jsp:scriptlet>
   
    String ffname1 = (String) session.getAttribute("session_uawid");
    String email1=(String)session.getAttribute("session_femail");
</jsp:scriptlet>

<jsp:scriptlet>
 
</jsp:scriptlet>
<!-- ********************************************************************************************************************************** -->

<!-- ********************************************************************************************************************************** -->
<jsp:scriptlet>
 	String ffname = (String) session.getAttribute("session_ffname");
    String flname = (String) session.getAttribute("session_flname");
    String fgender = (String) session.getAttribute("session_fgender");
    String fcity = (String) session.getAttribute("session_fcity");
    String favailable=(String) session.getAttribute("session_favailable");
    
    String fabout= (String) session.getAttribute("session_fabout");
    String funit= (String) session.getAttribute("session_funit");
    String fprofile_pic = (String) session.getAttribute("session_fprofilepic");
    if (fabout == null || fabout.equals("")) {
        fabout = "";
    }
    String fstate = (String) session.getAttribute("session_fstate");
    if (fstate == null || fstate.equals("")) {
        fstate = "";
    }
    String fexp = (String) session.getAttribute("session_fexp");
    if (fexp == null || fexp.equals("")) {
        fexp = "";
    }
    String fneed = (String) session.getAttribute("session_fneed");
    if (fneed == null || fneed.equals("")) {
        fneed = "";
    }
    String fquantity = (String) session.getAttribute("session_fquantity");
    if (fquantity == null || fquantity.equals("")) {
    	fquantity = "";
    }
    String fcompany = (String) session.getAttribute("session_fcompany");
    if (fcompany == null || fcompany.equals("")) {
    	fcompany = "";
    }
    String fpayment = (String) session.getAttribute("session_fpayment");
    if (fpayment == null || fpayment.equals("")) {
    	fpayment = "";
    }
</jsp:scriptlet>


<jsp:scriptlet>
    if (ffname == null || ffname.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>
<!-- ********************************************************************************************************************************** -->

<html>
<head>
<meta charset="ISO-8859-1">

<title>Farmer Profile</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

</style>

        <%@include file="components/n_common.jsp" %>

	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<!-- ********************************************************************************************************************************** -->
   <%@include  file="components/farmer_navbar.jsp" %>
<!-- ********************************************************************************************************************************** -->
    
   <%
   String image = (String) session.getAttribute("session_fimage");
   %>
	<section style="background-color :#eee !important;margin-top:80px; ">
		<div class="container">
		
			<div class="bg-white shadow rounded-lg d-block d-sm-flex" >
				<div class="profile-tab-nav border-right">
					<div class="p-4">
						<div class="img-circle text-center mb-3">
							<img src="img/farmer/<%=image %>" class="card-img img-fluid" style="width:150px;height:150px" alt="Sorry">
						</div>
						<h4 class="text-center"><%= ffname %><%= flname %></h4>
					</div>
					<div class="nav flex-column nav-pills"  id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link active"  id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
							<i class="fa fa-home text-center mr-1" ></i> 
							Account
						</a>
						<a class="nav-link"  id="password-tab" data-toggle="pill" href="#password" role="tab" aria-controls="password" aria-selected="false">
							<i class="fa fa-key text-center mr-1"></i> 
							More Information
						</a>
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#security" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Edit Account Details
						</a>
						
						<a class="nav-link" id="notification-tab" data-toggle="pill" href="#product" role="tab" aria-controls="product" aria-selected="false">
							<i class="fa fa-bell text-center mr-1"></i> 
						Add Product
						</a>
						
						
						<a class="nav-link" id="notification-tab" data-toggle="pill" href="#euproduct" role="tab" aria-controls="euproduct" aria-selected="false">
							<i class="fa fa-bell text-center mr-1"></i> 
						Check And Update Product
						</a>
												
						<a class="nav-link" id="notification-tab" data-toggle="pill" href="#notification" role="tab" aria-controls="notification" aria-selected="false">
							<i class="fa fa-bell text-center mr-1"></i> 
						Check User Data
						</a>
						
						<a class="nav-link" id="notification-tab" data-toggle="pill" href="#updateorder" role="tab" aria-controls="notification" aria-selected="false">
							<i class="fa fa-bell text-center mr-1"></i> 
						Update Order Status
						</a>
					</div>
				</div>
				<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
						<h3 class="mb-4">Profile Details</h3>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
								  	<label>First Name</label>
								  	<input type="text" class="form-control" disabled value="<%=ffname %> " >
								<br>
								  	<label>Last Name</label>
								  	<input type="text" class="form-control" value="<%= flname%>" disabled>
								<br>			
								  	<label>Gender</label>
								  	<input type="text" class="form-control" value="<%= session.getAttribute("session_fgender") %>" disabled>
								
								  
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  
								  	<label>State</label>
								  	<input type="text" class="form-control" value="<%= fstate %>" disabled>
								<br>  	
								   <label>City</label>
								  	<input type="text" class="form-control" value="<%= fcity %>" disabled>
								<br>								
								  	<label>Email</label>
								  	<input type="text" class="form-control" value="<%= session.getAttribute("session_femail") %>" disabled>
													
								</div>
							</div>
							
							<div class="col-md-12">
								  	<label>About</label>
									<textarea class="form-control" placeholder="<%= fabout %>" disabled></textarea>
							</div>
							
						</div>
						
					</div>
					<div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
						<h3 class="mb-4">More Information</h3>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Total Work Experience</label>
								  	<input type="text" class="form-control" disabled value="<%=fexp %> " >
								<br>
								 	<label>Payment Mode</label>
								  	<input type="text" class="form-control" value="<%= fpayment %>" disabled>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Quantity</label>
								  	<input type="text" class="form-control" value="<%= fquantity %>" disabled>
								<br>
									<label>Unit</label>
								  	<input type="text" class="form-control" value="<%= funit %>" disabled>
							
								  
								</div>
							</div>
							<div class="col-md-12">
								 	<label>Available Product</label>
								  	<textarea class="form-control" placeholder="<%= favailable %>" disabled></textarea>
								
								
							</div>
							
						</div>
						
					</div>
					
					
					<div class="tab-pane fade" id="security" role="tabpanel" aria-labelledby="security-tab" >
						<form action="farmer_profile_about_edit" method="post" enctype="multipart/form-data">
						<h3 class="mb-4">Edit Account Details</h3>
						<div class="row">
							<div class="col-md-6">
							
							
							 
								<div class="form-group">
								  	<label>First Name</label>
								  	<input type="text" class="form-control" required name="name1" value="<%=ffname %> " >
								<br>
								  	<label>Last Name</label>
								  	<input type="text" class="form-control" required name="name2" value="<%= flname%>" >
								<br>								
								  	<label>Email</label>
								  	<input type="text" class="form-control" required value="<%= session.getAttribute("session_femail") %>" disabled>
								<br>
								  	<label>Gender</label>
								  	<input type="text" class="form-control" required name="gender1" value="<%= fgender%>" >
								 <br>
								 	<label>Total Work Experience</label>
								  	<input type="number" class="form-control" required name="exp1" value="<%=fexp %> " > 
								  <br>
								 	<label>Available Product</label>
								  	<input type="text" class="form-control" required name="avil1" value="<%=favailable %> " >  	
								</div>
								
						
								
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	
								  	<label>State</label>
								  	<input type="text" class="form-control" required name="state1" value="<%= fstate %>" >
								<br>  	
								   <label>City</label>
								  	<input type="text" class="form-control" required name="city1" value="<%= fcity %>" >
								<br>
									<label>Quantity</label>
								  	<input type="number" class="form-control" required name="quan1" value="<%= fquantity %>" >
								<br>
									<label>Unit</label>
								  	<select class="form-control" name="unit1" required>
								  		<option value="KG">KG</option>
								  		<option value="Quital">Quital</option>
								  		<option value="Ton">Ton</option>
								  	</select>
								<br>
								  	<label>Payment Mode</label>
								  	<input type="text" required class="form-control" name="payment1" value="<%= fpayment %>" >
								<br>
								<label>Profile Image</label>
								<input type="file" name="image" required class="form-control">			
							
									
								
								</div>
							</div>
							
							<div class="col-md-12">
									<label>About</label>
									<textarea class="form-control" required name="about1" placeholder="<%= fabout %>" ></textarea>
							</div>
						
				
							
						</div>
						<div>
							<button class="btn btn-primary">Update</button>
							<button class="btn btn-light">Cancel</button>
						</div>
					</form>
					</div>
					
					
					
					<%
							String msg=request.getParameter("msg");
							if("done".equals(msg))
							{
							%>
							
							
							<%} %>
							
							<% 
							if("fail".equals(msg))
							{
							%>
							
						
							
							<%} %>
							
							<%
							int pid=1;
							try
							{
								Connection con=DbConnection.getConnect();
								Statement s=con.createStatement();
								ResultSet rs=s.executeQuery("select max(pid) from product");
								while(rs.next())
								{
									pid=rs.getInt(1);
									pid=pid+1;
								}
							}
							catch(Exception e)
							{
								
							}
					%>
				
					
					
					<div class="tab-pane fade" id="product" role="tabpanel" aria-labelledby="security-tab">
						<form action="addnewproductaction" method="post" enctype="multipart/form-data">
						<h3 class="mb-4">Add Product Details</h3>
						<h6 style="color: green;">Product ID:<% out.print(pid); %> </h6>
						<input type="hidden" name="id" value="<% out.print(pid); %>">
						<div class="row">
						
							<div class="col-md-6">
							
							
							 
								<div class="form-group">
								  	<label>Product Name</label>
								  	<input type="text" class="form-control"  name="pname" required  >
								<br>
								
								  	<label>Product Image</label>
								  	 <input type="file" name="image" class="form-control">
								
								
								<br>
								
								  		<label>Product Description</label>
									<textarea class="form-control" name="pabout" required ></textarea>
									 
							
								</div>
								
						
								
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Product Category</label>
								  	
								  	<%
							//int pid=1;
							try
							{
								Connection con=DbConnection.getConnect();
								Statement s=con.createStatement();
								ResultSet rs=s.executeQuery("select * from category");
								%>
									
								
					<select  name="pcategory" required class="form-control">
						<%
							while(rs.next())
								{
								%>	
						<option value="<%=rs.getString(2) %>"><%=rs.getString(2) %></option>
						<%
						}
						 %>
						</select>
								  
								  	<%
							}
							catch(Exception e)
							{
								
							}
							%>	
								
								<br>
									<label>Email</label>
								  	<input type="text" class="form-control" name="pemail" value="<%= session.getAttribute("session_femail") %>" disabled>	 
								<br>  	
								  	<label>Payment Mode</label>
								  	 <select name="ppayment" required class="form-control">
										   	<option value="online">Online</option>
										   	<option value="offline">Offline</option>
										   	<option value="both">Both</option>
									</select>
								
								
															
								  
								
									</div>
							</div>
							
							<div class="col-md-12">
							<h5 class="mb-4">Add User Product Details</h5>
							</div>
							
							<div class="col-md-6">
								<label>Product Quantity</label>
								  	<input type="number" class="form-control" name="puquantity" required >
								 <br>
								 	<label>Product Active Status</label>
								  	 <select name="puactive" required class="form-control">
										   	<option value="Available">Available</option>
										   	<option value="Not Available">Not Available</option>
									</select>
							</div>
							
							
							<div class="col-md-6">
								<label>Quantity Unit</label>
								  <select class="form-control" name="puunit" required>
								  		<option value="KG">KG</option>
								  		<option value="Quital">Quital</option>
								  		<option value="Ton">Ton</option>
								  	</select>
								<br>  	
									<label>Product Price</label>
								  	<input type="number" class="form-control" name="puprice" required>
							</div>
							
							
							<div class="col-md-12">
						<h5 class="mb-4">Add WholeSaler Product Details</h5>
							</div>
							
							<div class="col-md-6">
								<label>Product Quantity</label>
								  	<input type="number" class="form-control" name="pwquantity" required >
								 <br>
								 	<label>Product Active Status</label>
								  	 <select name="pwactive" required class="form-control">
										   	<option value="Available">Available</option>
										   	<option value="Not Available">Not Available</option>
									</select>
							</div>
							
							
							<div class="col-md-6">
								<label>Quantity Unit</label>
								  <select class="form-control" name="pwunit" required>
								  		<option value="KG">KG</option>
								  		<option value="Quital">Quital</option>
								  		<option value="Ton">Ton</option>
								  	</select>
								<br>  	
									<label>Product Price</label>
								  	<input type="number" class="form-control" name="pwprice" required>
							</div>
							
							
							
							
						
						
				
				
				
							
						</div>
						<div>
							<button class="btn btn-primary">Add</button>
							<button class="btn btn-light">Cancel</button>
						</div>
					</form>
					</div>
					
					
				<div class="tab-pane fade" id="euproduct" role="tabpanel" aria-labelledby="notification-tab">
						<h3 class="mb-4">Check And Update Product</h3>
						<div class="form-group " >
						<a href="allProductEditProduct.jsp" class="btn btn-outline-info">Check And Update Product</a>
			</div></div>		
					
					
					
					<div class="tab-pane fade" id="notification" role="tabpanel" aria-labelledby="notification-tab">
						<h3 class="mb-4">Check User Data</h3>
						<div class="form-group " >
						<a href="user_farmer_data.jsp" class="btn btn-outline-info">Check User Data</a>
			</div></div>
			
			<div class="tab-pane fade" id="updateorder" role="tabpanel" aria-labelledby="notification-tab">
						<h3 class="mb-4">Update Order Status</h3>
						<div class="form-group " >
						<a href="update_order_status.jsp" class="btn btn-outline-info">Update Order Status</a>
			</div></div>
			
			</div>
			</div>
		</div>
	</section>

 <%@include file="components/n_footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
