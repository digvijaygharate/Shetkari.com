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
    String wfname = (String) session.getAttribute("session_wfname");
    String wlname = (String) session.getAttribute("session_wlname");
    String wemail=(String) session.getAttribute("session_wemail");
    String wgender = (String) session.getAttribute("session_wgender");
    String wcity = (String) session.getAttribute("session_wcity");
    String wprofile_pic = (String) session.getAttribute("session_wprofilepic");
    
    String wabout = (String) session.getAttribute("session_wabout");
    String wstate = (String) session.getAttribute("session_wstate");
    String wexp = (String) session.getAttribute("session_wexp");
    String wneed = (String) session.getAttribute("session_wneed");
    String wquantity = (String) session.getAttribute("session_wquantity");
    String wcompany = (String) session.getAttribute("session_wcompany");
    String wpayment = (String) session.getAttribute("session_wpayment");
</jsp:scriptlet>

<jsp:scriptlet>
    if (wfname == null || wfname.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>
<!-- ********************************************************************************************************************************** -->

<html>
<head>
<meta charset="ISO-8859-1">
<title>WholeSaler Profile</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/style.css" />
   <%@include file="components/common_css_js.jsp" %>
<!-- ********************************************************************************************************************************** -->
<style>
body{margin-top:0px;}
.card-style1 {
    box-shadow: 0px 0px 10px 0px rgb(89 75 128 / 9%);
}
.border-0 {
    border: 0!important;
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: 0.25rem;
}

section {
    padding: 120px 0;
    overflow: hidden;
    background: #fff;
    background-image: url("img/farmer1.jpg");
     width: 100%;
  height: 165vh;
  
  background-size: cover;
  position: relative;
}
.mb-2-3, .my-2-3 {
    margin-bottom: 2.3rem;
}

.section-title {
    font-weight: 600;
    letter-spacing: 2px;
    text-transform: uppercase;
    margin-bottom: 10px;
    position: relative;
    display: inline-block;
}
.text-primary {
    color: #ceaa4d !important;
}
.text-secondary {
    color: #15395A !important;
}
.font-weight-600 {
    font-weight: 600;
}
.display-26 {
    font-size: 1.3rem;
}

@media screen and (min-width: 992px){
    .p-lg-7 {
        padding: 4rem;
    }
}
@media screen and (min-width: 768px){
    .p-md-6 {
        padding: 3.5rem;
    }
}
@media screen and (min-width: 576px){
    .p-sm-2-3 {
        padding: 2.3rem;
    }
}
.p-1-9 {
    padding: 1.9rem;
}

.bg-secondary {
    background: #15395A !important;
}
@media screen and (min-width: 576px){
    .pe-sm-6, .px-sm-6 {
        padding-right: 3.5rem;
    }
}
@media screen and (min-width: 576px){
    .ps-sm-6, .px-sm-6 {
        padding-left: 3.5rem;
    }
}
.pe-1-9, .px-1-9 {
    padding-right: 1.9rem;
}
.ps-1-9, .px-1-9 {
    padding-left: 1.9rem;
}
.pb-1-9, .py-1-9 {
    padding-bottom: 1.9rem;
}
.pt-1-9, .py-1-9 {
    padding-top: 1.9rem;
}
.mb-1-9, .my-1-9 {
    margin-bottom: 1.9rem;
}
@media (min-width: 992px){
    .d-lg-inline-block {
        display: inline-block!important;
    }
}
.rounded {
    border-radius: 0.25rem!important;
}
</style>
<!-- ********************************************************************************************************************************** -->
   
</head>
<body>
<!-- ********************************************************************************************************************************** -->
   <%@include  file="components/wholesaler_navbar.jsp" %>
 
 <nav aria-label="breadcrumb" >
  <ol class="breadcrumb m-0">
    <li class="breadcrumb-item"><a href="wholesaler_profile.jsp">Home</a></li>
    <li class="breadcrumb-item"><a href="wholesaler_profile.jsp">Profile</a></li>
    <li class="breadcrumb-item"><a href="wholesaler_data.jsp">Check Data</a></li>
       
  </ol>
</nav>
      
<!-- ********************************************************************************************************************************** -->
<section >
    <div class="container">
        <div class="row">
            <div class="col-lg-12 mb-4 mb-sm-5" >
                <div class="card card-style1 border-0" >
                    <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7" >
                        <div class="row align-items-center">
                            <div class="col-lg-6 mb-4 mb-lg-0">
                              <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="..."> 
                            
                            </div>
                            <div class="col-lg-6 px-xl-10">
                                <div class="bg-secondary d-lg-inline-block py-1-9 px-1-9 px-sm-6 mb-1-9 rounded">
                                    <h3 class="h2 text-white mb-0"><%= wfname %>&nbsp;<%= wlname %></h3>
                                    <span class="text-primary"><%=wcity %></span>
                                </div>
                               <table class="table table-striped">
      								<tbody>
			    						
										
										<tr>
				      						<th scope="row">First Name </th>
											<td><%= wfname %></td>
										</tr>
										
										<tr>
				      						<th scope="row">Last Name</th>
											<td><%= wlname %></td>
										</tr>
										
										<tr>
				      						<th scope="row">Gender</th>
											<td><%= wgender %></td>
										</tr>
										
										<tr>
				      						<th scope="row">Email</th>
											<td><%= wemail %></td>
										</tr>
																														
										<tr>
				      						<th scope="row">Company Name</th>
											<td><%= wcompany %></td>
										</tr>
										
										<tr>
				      						<th scope="row">City</th>
											<td><%= wcity %></td>
										</tr>
										
										<tr>
				      						<th scope="row">State</th>
											<td><%= wstate %></td>
										</tr>
										
										<tr>
				      						<th scope="row">About</th>
											<td><%= wabout %></td>
										</tr>
										
										<tr>
				      						<th scope="row">Total Business Experience</th>
											<td><%= wexp %></td>
										</tr>
										
										<tr>
				      						<th scope="row">Need</th>
											<td><%= wneed %></td>
										</tr>
										
										<tr>
				      						<th scope="row">Quantity</th>
											<td><%= wquantity %></td>
										</tr>
										
										
										<tr>
				      						<th scope="row">Payment Mode</th>
											<td><%= wpayment %></td>
										</tr>
							        </tbody>
                         		</table>       
                               
                                
                            <a href="wholesaler_profile_about.jsp"><button>Edit Profile</button></a>
               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
            
        </div>
    </div>
</section>

<!-- ********************************************************************************************************************************** -->

<!-- ********************************************************************************************************************************** -->

</body>
</html>