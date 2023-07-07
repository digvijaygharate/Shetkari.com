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

<jsp:scriptlet>
    if (fname == null || fname.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>
<!-- ********************************************************************************************************************************** -->

<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
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

</style>

        <%@include file="components/n_common.jsp" %>
<!-- ********************************************************************************************************************************** -->
   
</head>
<body>
<!-- ********************************************************************************************************************************** -->
   <%@include  file="components/user_navbar.jsp" %>
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
		<div class="container">
		
			<div class="bg-white shadow rounded-lg d-block d-sm-flex" >
				<div class="profile-tab-nav border-right">
					<div class="p-4">
						<div class="img-circle text-center mb-3">
							<img src="img/user/<%= image %>" class="card-img img-fluid" style="width:150px;height:150px" alt="Sorry">
						</div>
						<h4 class="text-center"><%= fname %> <%= lname %></h4>
					</div>
					<div class="nav flex-column nav-pills"  id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link active"  id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
							<i class="fa fa-home text-center mr-1" ></i> 
							Account
						</a>
					
						<a class="nav-link" id="security-tab" data-toggle="pill" href="#security" role="tab" aria-controls="security" aria-selected="false">
							<i class="fa fa-user text-center mr-1"></i> 
							Edit Account Details
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
								  	<input type="text" class="form-control" disabled value="<%=fname %> " >
								<br>
								  	<label>Last Name</label>
								  	<input type="text" class="form-control" value="<%= lname%>" disabled>
								<br>								
								  	<label>Email</label>
								  	<input type="text" class="form-control" value="<%= session.getAttribute("session_email") %>" disabled>
								
								  
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  
								
								  	<label>State</label>
								  	<input type="text" class="form-control" value="<%= state %>" disabled>
								<br>  	
								   <label>City</label>
								  	<input type="text" class="form-control" value="<%= city %>" disabled>
								<br>								
								  	<label>Gender</label>
								  	<input type="text" class="form-control" value="<%= session.getAttribute("session_gender") %>" disabled>
								
								</div>
							</div>
							<div class="col-md-12">
								
								  	<label>About</label>
									<textarea class="form-control" placeholder="<%=title %>" disabled></textarea>
								
							</div>
							
						</div>
						
					</div>
					<div class="tab-pane fade" id="security" role="tabpanel" aria-labelledby="security-tab" >
						<form action="user_profile_about_edit" method="post" enctype="multipart/form-data">
						<h3 class="mb-4">Edit Account Details</h3>
						<div class="row">
							<div class="col-md-6">
							
							
							 
								<div class="form-group">
								  	<label>First Name</label>
								  	<input type="text" class="form-control"  name="name1" value="<%=fname %> " >
								<br>
								  	<label>Last Name</label>
								  	<input type="text" class="form-control" name="name2" value="<%= lname%>" >
								<br>								
								  	<label>Email</label>
								  	<input type="text" class="form-control" value="<%= session.getAttribute("session_email") %>" disabled>
								<br>
								  	<label>Gender</label>
								  	<input type="text" class="form-control" name="gender1" value="<%= gender%>" >
								
								 	
								 		
								</div>
								
						
								
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	
								
								  	<label>State</label>
								  	<input type="text" class="form-control" name="state1" value="<%=state %>" >
								<br>  	
								   <label>City</label>
								  	<input type="text" class="form-control"  name="city1" value="<%= city %>" >
								<br>
									<label>Profile Image</label>
									 <input type="file" name="image" class="form-control" value="<%= image %>">		
								<br>
									<label>About</label>
									<textarea class="form-control" name="title1" placeholder="<%= title %>" ></textarea>	 	
								</div>
							</div>
							
							
						
				
							
						</div>
						<div>
							<button class="btn btn-primary">Update</button>
							<button class="btn btn-light">Cancel</button>
						</div>
					</form>
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