<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:scriptlet>
	String wemail1=(String)session.getAttribute("session_wemail");
    String email=(String)session.getAttribute("session_femail");
    String email1=(String)session.getAttribute("session_email");
</jsp:scriptlet>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shetkari.com</title>
<%@include file="components/n_common.jsp" %>
<style>

@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');
#team {
    background: #eee !important;
   
}

.btn-primary:hover,
.btn-primary:focus {
    background-color: #108d6f;
    border-color: #108d6f;
    box-shadow: none;
    outline: none;
}

.btn-primary {
    color: #fff;
    background-color: #007b5e;
    border-color: #007b5e;
}

section {
    padding: 60px 0;
}

section .section-title {
    text-align: center;
    color: #007b5e;
    margin-top: 80px;
    text-transform: uppercase;
}

#team .card {
    border: none;
    background: #ffffff;
}

.image-flip:hover .backside,
.image-flip.hover .backside {
    -webkit-transform: rotateY(0deg);
    -moz-transform: rotateY(0deg);
    -o-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    transform: rotateY(0deg);
    border-radius: .25rem;
}

.image-flip:hover .frontside,
.image-flip.hover .frontside {
    -webkit-transform: rotateY(180deg);
    -moz-transform: rotateY(180deg);
    -o-transform: rotateY(180deg);
    transform: rotateY(180deg);
}

.mainflip {
    -webkit-transition: 1s;
    -webkit-transform-style: preserve-3d;
    -ms-transition: 1s;
    -moz-transition: 1s;
    -moz-transform: perspective(1000px);
    -moz-transform-style: preserve-3d;
    -ms-transform-style: preserve-3d;
    transition: 1s;
    transform-style: preserve-3d;
    position: relative;
}

.frontside {
    position: relative;
    -webkit-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    z-index: 2;
    margin-bottom: 30px;
}

.backside {
    position: absolute;
    top: 0;
    left: 0;
    background: white;
    -webkit-transform: rotateY(-180deg);
    -moz-transform: rotateY(-180deg);
    -o-transform: rotateY(-180deg);
    -ms-transform: rotateY(-180deg);
    transform: rotateY(-180deg);
    -webkit-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
    -moz-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
    box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
}

.frontside,
.backside {
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    backface-visibility: hidden;
    -webkit-transition: 1s;
    -webkit-transform-style: preserve-3d;
    -moz-transition: 1s;
    -moz-transform-style: preserve-3d;
    -o-transition: 1s;
    -o-transform-style: preserve-3d;
    -ms-transition: 1s;
    -ms-transform-style: preserve-3d;
    transition: 1s;
    transform-style: preserve-3d;
}

.frontside .card,
.backside .card {
    min-height: 312px;
}

.backside .card a {
    font-size: 18px;
    color: #007b5e !important;
}

.frontside .card .card-title,
.backside .card .card-title {
    color: #1bbd36 !important;
}

.frontside .card .card-body img {
    width: 120px;
    height: 120px;
    border-radius: 50%;
}

#hero {
  width: 100%;
  height: 50vh;
  background: url("images/login_signin.jpg") top center;
  background-size: cover;
  position: relative;
  background-image: url("img/farmer1.jpg");
  

}
.icon-green
{
	
	color:#1bbd36;
	
}  

</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<!-- ********************************************************************************************************************************** -->
     <jsp:scriptlet>         
    if(email1 !=null )
                
                {
            </jsp:scriptlet>
                    <jsp:include page="components/user_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }else if(email !=null ){
            </jsp:scriptlet>
                    <jsp:include page="components/farmer_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            else if(wemail1 !=null ){
                </jsp:scriptlet>
                        <jsp:include page="components/wholesaler_navbar.jsp"></jsp:include>
                <jsp:scriptlet>
                	
                }else{
                
            </jsp:scriptlet>
                    <jsp:include page="components/navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
<!-- ********************************************************************************************************************************** -->

 
   <section id="team" class="pb-2 ">
   
    <div class="container">
          <%
String msg=request.getParameter("msg");
if("added".equals(msg))
{
%>

<div class="alert alert-success alert-dismissible fade show" role="alert" style="margin-top:30px;">
    <strong>Product added successfully!</strong> 
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%} %>

<%
if("exist".equals(msg))
{
%>

<div class="alert alert-success alert-dismissible fade show" role="alert" style="margin-top:30px;">
    <strong>Product already exist in you cart! Quantity  increased!</strong> 
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%} %>

<%
if("invalid".equals(msg))
{
%>

<div class="alert alert-success alert-dismissible fade show" role="alert" style="margin-top:30px;">
    <strong>Sorry! Something Went Wrong!</strong> 
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%} %>

    
        <h5 class="section-title h1"><span style="color:#1bbd36">Farmer</span> <span style="color:black"> Products</span></h5>
      
       
      
        <div class="row">
   
<div class="container py-2">
    <div class="row justify-content-center">
         
<%
	try{
		Connection con=DbConnection.getConnect();
		Statement s=con.createStatement();
		ResultSet rs=s.executeQuery("select * from product where puactive='Available'");
		while(rs.next())
		{
			
%>
        


    
  
     <div class="col-xs-12 col-sm-6 col-md-4" >
                <div class="image-flip"  >
                    <div class="mainflip flip-0">
                   
                   
             
                             <div class="frontside" >
                            <div class="card" style="height:350px">
                                <div class="card-body text-center">
                                    <p>  <img src="img/products/<%=rs.getString(14) %>" class="card-img img-fluid" style="width:150px;height:150px" alt="Sorry">
                                              </p>
                                    <h4 class="card-title"><%= rs.getString(2) %></h4>
                                    <p class="card-text"><%= rs.getString(12) %></p>
                                    <a href="#" class="btn btn-success">Check More Details</a>
                                </div>
                            </div>
                        </div>
                         <div class="backside" >
                            <div class="card">
                                <div class="card-body  mt-4">
                                    <h4 class="card-title text-center"><%= rs.getString(2) %> </h4>
                                     <p class="card-text text-center"><%= rs.getString(12) %></p>
                                    <p class="card-text"><b> Product Category : </b><%= rs.getString(3) %></p>
                                    <p class="card-text"><b>Product Price : </b> <%= rs.getString(4) %>  RS.</p>
                                      <p class="card-text"><b>Product Quantity : </b>  <%= rs.getString(5)  %> <%= rs.getString(6)  %> </p>
                                      <p class="card-text"><b>Payment Mode : </b> <%= rs.getString(13) %></p>
                                      
                                      
                                       
                                    <ul class="list-inline text-center" >
                                        <li class="list-inline-item">
                                         
                                          <a href="add_to_cart_action.jsp?id=<%= rs.getString(1) %>" class="btn btn-light">Add To Cart</a>
                                        
                                           </li>
                                    
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        
                          
                       </div>
				             </div></div>
                                             
                            

               
                
<%
		}
		}catch(Exception e){
			
		}
%>
    <div class="col-md-2">
                      
                    </div>
 </div></div></div>
      </div>
</section>

<!-- ********************************************************************************************************************************** -->
 <!-- ======= Footer ======= -->
    <%@include file="components/n_footer.jsp" %>
  <!-- End Footer -->
</body>
</html>