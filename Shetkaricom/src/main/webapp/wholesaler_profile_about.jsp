<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:scriptlet>
    String fname = (String) session.getAttribute("session_wfname");
    String lname = (String) session.getAttribute("session_wlname");
    String gender = (String) session.getAttribute("session_wgender");
    String city = (String) session.getAttribute("session_wcity");
    
    
    String about= (String) session.getAttribute("session_wabout");
    String profile_pic = (String) session.getAttribute("session_wprofilepic");
    if (about == null || about.equals("")) {
        about = "";
    }
    String state = (String) session.getAttribute("session_wstate");
    if (state == null || state.equals("")) {
        state = "";
    }
    String exp = (String) session.getAttribute("session_wexp");
    if (exp == null || exp.equals("")) {
        exp = "";
    }
    String need = (String) session.getAttribute("session_wneed");
    if (need == null || need.equals("")) {
        need = "";
    }
    String quantity = (String) session.getAttribute("session_wquantity");
    if (quantity == null || quantity.equals("")) {
    	quantity = "";
    }
    String company = (String) session.getAttribute("session_wcompany");
    if (company == null || company.equals("")) {
    	company = "";
    }
    String payment = (String) session.getAttribute("session_wpayment");
    if (payment == null || payment.equals("")) {
    	payment = "";
    }
</jsp:scriptlet>

<jsp:scriptlet>
    if (fname == null || fname.equals("")) {
        response.sendRedirect("login_first.jsp");
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile About </title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
		   <%@include file="components/common_css_js.jsp" %>
        <script>
            function changeGender()
            {
                document.getElementById('chnggendertf').value = document.getElementById('chnggender').value;
            }
            function changeCity()
            {
                document.getElementById('chngcitytf').value = document.getElementById('chngcity').value;
            }
        </script>
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
 	 height: 185vh;
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
             <%@include  file="components/navbar.jsp" %>
     
<!-- ********************************************************************************************************************************** -->
<section >
    <div class="container">
        <div class="row">
            <div class="col-lg-12 mb-4 mb-sm-5">
                <div class="card card-style1 border-0">
                    <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
                        <div class="row align-items-center">
                            <div class="col-lg-6 mb-4 mb-lg-0">
                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="...">
                            </div>
                            <div class="col-lg-6 px-xl-10">
                                <div class="bg-secondary d-lg-inline-block py-1-9 px-1-9 px-sm-6 mb-1-9 rounded">
                                    <h3 class="h2 text-white mb-0"><%= fname %>&nbsp;<%= lname %></h3>
                                    <span class="text-primary">Edit Profile Details</span>
                                </div>
                                 <form action="wholesaler_profile_about_edit" method="post">
                               <table class="table table-striped">
                               
      								<tbody>
			    						
										
										<tr>
				      						<th scope="row">First Name </th>
											 <td><input type="text" class="form-control" name="name1" value= "<%= fname %>"></td>
										</tr>
										
										<tr>
				      						<th scope="row">Last Name</th>
											 <td><input type="text" class="form-control" name="name2" value= "<%= lname %>"></td>
										</tr>
										
										<tr>
				      						<th scope="row">Gender</th>
											 <td><input type="text" class="form-control" name="gender1" value= "<%= gender %>"></td>										</tr>
										
										<tr>
				      						<th scope="row">Email</th>
											<td><%= session.getAttribute("session_wemail") %></td>
										</tr>
																														
										
										
										<tr>
				      						<th scope="row">City</th>
											<td><input type="text" class="form-control" name="city1" value= "<%= city%>"></td>
										</tr>
										<tr>
				      						<th scope="row">State</th>
											<td><input type="text" class="form-control" name="state1" value= "<%= state%>"></td>
										</tr>
										
										<tr>
				      						<th scope="row">About</th>
											<td><input type="text" class="form-control" name="about1" value= "<%= about%>"></td>
										</tr>
										<tr>
				      						<th scope="row">Total Business Experience</th>
											<td><input type="text" class="form-control" name="exp1" value= "<%= exp%>"></td>
										</tr>
										<tr>
				      						<th scope="row">Need</th>
											<td><input type="text" class="form-control" name="need1" value= "<%= need%>"></td>
										</tr>
										<tr>
				      						<th scope="row">Quantity</th>
											<td><input type="number" class="form-control" name="quan1" value= "<%= quantity%>"></td>
										</tr>
										<tr>
				      						<th scope="row">Company Name</th>
											<td><input type="text" class="form-control" name="company1" value= "<%= company%>"></td>
										</tr>
										<tr>
				      						<th scope="row">Payment Mode</th>
											<td><input type="text" class="form-control" name="payment1" value= "<%= payment%>"></td>
										</tr>
										
										
										
							        </tbody>
                         		</table>       
                               
                                
                            <button >Submit Profile</button>
               </form>
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
