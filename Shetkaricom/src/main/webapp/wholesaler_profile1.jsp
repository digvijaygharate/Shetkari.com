<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- ********************************************************************************************************************************** -->

<jsp:declaration>Connection con=null;</jsp:declaration>
<!-- ********************************************************************************************************************************** -->

<jsp:scriptlet>
   
    String wfname1 = (String) session.getAttribute("session_uawid");
    String email1=(String)session.getAttribute("session_wemail");
</jsp:scriptlet>

<jsp:scriptlet>
 
</jsp:scriptlet>
<!-- ********************************************************************************************************************************** -->

<!-- ********************************************************************************************************************************** -->
<jsp:scriptlet>
 	String wfname = (String) session.getAttribute("session_wfname");
    String wlname = (String) session.getAttribute("session_wlname");
    String wgender = (String) session.getAttribute("session_wgender");
    String wcity = (String) session.getAttribute("session_wcity");
    
    
    String wabout= (String) session.getAttribute("session_wabout");
    String wprofile_pic = (String) session.getAttribute("session_wprofilepic");
    if (wabout == null || wabout.equals("")) {
        wabout = "";
    }
    String wstate = (String) session.getAttribute("session_wstate");
    if (wstate == null || wstate.equals("")) {
        wstate = "";
    }
    String wexp = (String) session.getAttribute("session_wexp");
    if (wexp == null || wexp.equals("")) {
        wexp = "";
    }
    String wneed = (String) session.getAttribute("session_wneed");
    if (wneed == null || wneed.equals("")) {
        wneed = "";
    }
    String wquantity = (String) session.getAttribute("session_wquantity");
    if (wquantity == null || wquantity.equals("")) {
    	wquantity = "";
    }
    String wcompany = (String) session.getAttribute("session_wcompany");
    if (wcompany == null || wcompany.equals("")) {
    	wcompany = "";
    }
    String wpayment = (String) session.getAttribute("session_wpayment");
    if (wpayment == null || wpayment.equals("")) {
    	wpayment = "";
    }
</jsp:scriptlet>


<jsp:scriptlet>
    if (wfname == null || wfname.equals("")) {
        response.sendRedirect("login_first.jsp");
    }
</jsp:scriptlet>
<!-- ********************************************************************************************************************************** -->

<html>
<head>
<meta charset="ISO-8859-1">

<title>WholeSaler Profile</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
@import url("https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap");
body {
	background: #eee !important;
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
.nav-link active show{
	background-color: #238f35 !important;
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

	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<%@include file="components/n_common.jsp" %>
<body>

<!-- ********************************************************************************************************************************** -->
   <%@include  file="components/wholesaler_navbar.jsp" %>
<!-- ********************************************************************************************************************************** -->
    
   <%
   String image = (String) session.getAttribute("session_wimage");
   %>
	<section  style="margin-top:80px">
		<div class="container">
		
			<div class="bg-white shadow rounded-lg d-block d-sm-flex">
				<div class="profile-tab-nav border-right">
					<div class="p-4">
						<div class="img-circle text-center mb-3">
								<img src="img/wholesaler/<%=image %>" class="card-img img-fluid" style="width:150px;height:150px" alt="Sorry">
						</div>
						<h4 class="text-center"><%= wfname %><%= wlname %></h4>
					</div>
					<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
							<i class="fa fa-home text-center mr-1"></i> 
							Account
						</a>
						<a class="nav-link" id="password-tab" data-toggle="pill" href="#password" role="tab" aria-controls="password" aria-selected="false">
							<i class="fa fa-key text-center mr-1"></i> 
							More Information
						</a>
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#security" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Edit Account Details
						</a>
						
						<a class="nav-link" id="notification-tab" data-toggle="pill" href="#notification" role="tab" aria-controls="notification" aria-selected="false">
							<i class="fa fa-bell text-center mr-1"></i> 
						Check User Data
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
								  	<input type="text" class="form-control" disabled value="<%=wfname %> " >
								<br>
								  	<label>Last Name</label>
								  	<input type="text" class="form-control" value="<%= wlname%>" disabled>
								<br>								
								  	<label>Email</label>
								  	<input type="text" class="form-control" value="<%= session.getAttribute("session_wemail") %>" disabled>
								<br>								
								  	<label>Gender</label>
								  	<input type="text" class="form-control" value="<%= session.getAttribute("session_wgender") %>" disabled>
								
								  
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Company</label>
								  	<input type="text" class="form-control" value="<%= wcompany %>" disabled>
								<br>
								  	<label>State</label>
								  	<input type="text" class="form-control" value="<%= wstate %>" disabled>
								<br>  	
								   <label>City</label>
								  	<input type="text" class="form-control" value="<%= wcity %>" disabled>
								</div>
							</div>
							
						</div>
						
					</div>
					<div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
						<h3 class="mb-4">More Information</h3>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Total Business Experience</label>
								  	<input type="text" class="form-control" disabled value="<%=wexp %> " >
								<br>
								  	<label>Need</label>
								  	<input type="text" class="form-control" value="<%= wneed%>" disabled>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Quantity</label>
								  	<input type="text" class="form-control" value="<%= wquantity %>" disabled>
								<br>
								  	<label>Payment Mode</label>
								  	<input type="text" class="form-control" value="<%= wpayment %>" disabled>
								</div>
							</div>
							<div class="col-md-12">
								
								  	<label>Bio</label>
									<textarea class="form-control" placeholder="<%= wabout %>" disabled></textarea>
								
							</div>
							
						</div>
						
					</div>
					
					
					<div class="tab-pane fade" id="security" role="tabpanel" aria-labelledby="security-tab">
						<form action="wholesaler_profile_about_edit" method="post" enctype="multipart/form-data">
						<h3 class="mb-4">Edit Account Details</h3>
						<div class="row">
							<div class="col-md-6">
							
							
							 
								<div class="form-group">
								  	<label>First Name</label>
								  	<input type="text" class="form-control"  name="name1" value="<%=wfname %> " >
								<br>
								  	<label>Last Name</label>
								  	<input type="text" class="form-control" name="name2" value="<%= wlname%>" >
								<br>								
								  	<label>Email</label>
								  	<input type="text" class="form-control" value="<%= session.getAttribute("session_wemail") %>" disabled>
								<br>
								  	<label>Gender</label>
								  	<input type="text" class="form-control" name="gender1" value="<%= wgender%>" >
								 <br>
								 	<label>Total Business Experience</label>
								  	<input type="text" class="form-control" name="exp1" value="<%=wexp %> " > 
								  <br>
								 	<label>Need</label>
								  	<input type="text" class="form-control" name="need1" value="<%=wneed %> " >  	
								  <br>
								 	<label>Category</label>
								  	<select class="form-control" name="category1">
								  		<option value="Fruits">Fruits</option>
								  		<option value="Crops">Crops</option>
								  		<option value="F&C">Fruits & Crops</option>
								  	</select>
								  	
								</div>
								
						
								
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Company</label>
								  	<input type="text" class="form-control" name="company1" value="<%= wcompany %>" >
								<br>
								  	<label>State</label>
								  	<input type="text" class="form-control" name="state1" value="<%= wstate %>" >
								<br>  	
								   <label>City</label>
								  	<input type="text" class="form-control"  name="city1" value="<%= wcity %>" >
								<br>
										<label>Quantity</label>
								  	<input type="text" class="form-control" name="quan1" value="<%= wquantity %>" >
								<br>
								  	<label>Payment Mode</label>
								  	<input type="text" class="form-control" name="payment1" value="<%= wpayment %>" >
								<br>
									<label>Profile Image</label>
									<input type="file" name="image1" class="form-control">	
								<br>
									<label>Bio</label>
									<textarea class="form-control" name="about1" placeholder="<%= wabout %>" ></textarea>
													
								</div>
							</div>
						
				
							
						</div>
						<div>
							<button class="btn btn-primary">Update</button>
							<button class="btn btn-light">Cancel</button>
						</div>
					</form>
					</div>
					
					<div class="tab-pane fade" id="notification" role="tabpanel" aria-labelledby="notification-tab">
						<h3 class="mb-4">Check User Data</h3>
						<div class="form-group " >
						<a href="wholesaler_data.jsp" class="btn btn-outline-info">Check User Data</a>
			</div></div></div>
			</div>
		</div>
	</section>


	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
	<%@include file="components/n_footer.jsp" %>
</body>
</html>
