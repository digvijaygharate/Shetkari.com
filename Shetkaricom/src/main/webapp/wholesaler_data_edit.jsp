<%@page import="java.sql.DriverManager"%>
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
   
    String wfname = (String) session.getAttribute("session_uawid");
    String email1=(String)session.getAttribute("session_wemail");
</jsp:scriptlet>

<jsp:scriptlet>
 
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
#hero {
  width: 100%;
  height: 100vh;
  background: url("images/login_signin.jpg") top center;
  background-size: cover;
  position: relative;
  background-image: url("img/farmer1.jpg");
}
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
      
<!-- ********************************************************************************************************************************** -->
<div class="container-fluid" id="hero">
	<div class="row">

		<table class="table">
		
  <thead>
    <tr>
    <th scope="col"></th>
      <th scope="col">Requested ID</th>
      <th scope="col">WholeSaler Id</th>
      <th scope="col">Date</th>
      <th scope="col">Time</th>
      <th scope="col">Status</th>
      <th scope="col">Message</th>
      <th scope="col">Submit</th>
    			
    </tr>
  </thead>


<jsp:scriptlet>
						String id="",date="",time="",wsid="",status="",mess="";
							try
							{
								Class.forName("com.mysql.jdbc.Driver");
       							Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
								PreparedStatement ps1=con.prepareStatement("select * from applied_ws_user where wsid=?");
								ps1.setString(1,email1);
								ResultSet rs=ps1.executeQuery();
								
								while(rs.next())
								{
									id=rs.getString("wemail");
									date=rs.getString("date1");
									time=rs.getString("time1");
									wsid=rs.getString("wsid");
									status=rs.getString("status1");
									mess=rs.getString("mess");
		</jsp:scriptlet>
		
		<tbody>
    <tr>
    
      <th scope="row"></th>
    
      <td> <%=id%> </td>
      <td> <%=wsid%> </td>
      <td> <%=date%> </td>
      <td> <%=time%> </td>
   
     <td>  <button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModal1">Change Status</button>
     </td>
	   <td><%=mess %>
       <td><button class="btn btn-outline-info" >Submit </button></td>

      
    </tr>
    
     </tbody>
		<jsp:scriptlet>						
								
								
								}
								
								
								
								
							}
							catch(Exception e)
							{
								e.printStackTrace();
								
							}
						</jsp:scriptlet>
									

 
</table>
	  
	</div>

</div>
<!-- ********************************************************************************************************************************** -->
<!-- ********************************************************************************************************************************** -->
<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Please Change The Status</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form class="px-md-2" method="post" action="wholesaler_data_edit">
      <div class="modal-body">
       
    <select  class="form-select" name="status" >
		  <option value="Approved">Approved</option>
		  <option value="Reject">Reject</option>
		  <option value="Pending">Pending</option>
		  <option value="Pending" disabled selected><%=status %></option>
	  </select>
   
      
      
      </div>
    
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
          	<button type="submit" class="btn btn-outline-success">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
<!-- ********************************************************************************************************************************** -->

</body>
</html>