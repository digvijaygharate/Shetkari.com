<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<jsp:scriptlet>
String wemail1=(String)session.getAttribute("session_wemail");
String email2=(String)session.getAttribute("session_femail");
String email1=(String)session.getAttribute("session_email");
</jsp:scriptlet>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
    background: #ddd3;
    height: auto;
 
    display: initial;
    font-family: Muli;
    font-size: 14px;    
}


.container-fluid {
    margin-top: 150px !important;
    margin-bottom: 80px !important;
}

p {
    font-size: 14px;
    margin-bottom: 7px;
}

.cursor-pointer {
    cursor: pointer;
}

a{
    text-decoration: none !important;
   
}

.bold{
    font-weight: 600;
}

.small{
    font-size: 12px !important;
    letter-spacing: 0.5px !important;
}

.Today{
    color: rgb(83, 83, 83);
}

.btn-outline-primary{
    background-color: #fff !important;
    color:#4bb8a9 !important;
    border:1.3px solid #4bb8a9;
    font-size: 12px;
    border-radius: 0.4em !important;
}

.btn-outline-primary:hover{
    background-color:#4bb8a9  !important;
    color:#fff !important;
    border:1.3px solid #4bb8a9;
}

.btn-outline-primary:focus,
.btn-outline-primary:active {
    outline: none !important;
    box-shadow: none !important;
    border-color: #42A5F5 !important;
}
 
#progressbar {
    margin-bottom: 30px;
    overflow: hidden;
    color: #455A64;
    padding-left: 0px;
    margin-top: 30px
}

#progressbar li {
    list-style-type: none;
    font-size: 13px;
    width: 33.33%;
    float: left;
    position: relative;
    font-weight: 400;
    color: #455A64 !important;
    
}

#progressbar #step1:before {
    content: "1";
    color: #fff;
    width: 29px;
    margin-left: 15px !important;
    padding-left: 11px !important;
}


#progressbar #step2:before {
    content: "2";
    color: #fff;
    width: 29px;

}

#progressbar #step3:before {
    content: "3";
    color: #fff;
    width: 29px;
    margin-right: 15px !important;
    padding-right: 11px !important;
}

#progressbar li:before {
    line-height: 29px;
    display: block;
    font-size: 12px;
    background: #455A64 ;
    border-radius: 50%;
    margin: auto;
}

 #progressbar li:after {
    content: '';
    width: 121%;
    height: 2px;
    background: #455A64;
    position: absolute;
    left: 0%;
    right: 0%;
    top: 15px;
    z-index: -1;
} 

#progressbar li:nth-child(2):after {
    left: 50%;
}

#progressbar li:nth-child(1):after {
    left: 25%;
    width: 121%;
}
#progressbar li:nth-child(3):after {
    left: 25% !important;
    width: 50% !important;
}

#progressbar li.active:before,
#progressbar li.active:after {
    background: #1bbd36; 
}

.card {
    background-color: #fff ;
    box-shadow: 2px 4px 15px 0px rgb(0, 108, 170);
    z-index: 0;
}

small{
    font-size: 12px !important;
}

.a {
    justify-content: space-between !important;
}

.border-line {
    border-right: 1px solid rgb(226, 206, 226)
}

.card-footer img{
    opacity: 0.3;
}

.card-footer h5{
    font-size: 1.1em;
    color: #8C9EFF;
    cursor: pointer;
}
</style>
<%@include file="components/n_common.jsp" %>
</head>
<body style="background-color: #eee">
<!-- ********************************************************************************************************************************** -->
       <jsp:scriptlet>         
    if(email1 !=null )
                
                {
            </jsp:scriptlet>
                    <jsp:include page="components/user_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }else if(email2 !=null ){
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
<div class="container-fluid   justify-content-center col-md-8" >
    <div class="card px-2">
        <div class="card-header bg-white">
          <div class="row justify-content-between">
            <div class="col">
                <center> <h5 class="bold">Order Tracking History</h5></center>
                <p class="text-muted">   <span class="font-weight-bold text-dark"></span> </p></div>
                
          </div>
        </div>
<%

String email=(String)session.getAttribute("session_email");
try
{
	Connection con=DbConnection.getConnect();
	PreparedStatement ps1=con.prepareStatement("select * from payment where pemail=?");
	ps1.setString(1,email);
	ResultSet rs=ps1.executeQuery();
	
	
	
	
	
		while( rs.next())
		{
			//a=rs.getString(2);
			//System.out.println(a);
			//String a=rs.getString(12);
			String b=rs.getString(3);
			//PreparedStatement ps2=con.prepareStatement("select * from cart where cemail=?");
			//ps2.setString(1,email);
			//ResultSet rs1=ps2.executeQuery();
			
	
			
	
	
		//while( rs1.next())
		//{
			
			
			
			
			PreparedStatement ps3=con.prepareStatement("select * from product where pid=?");
			ps3.setString(1,b);
			ResultSet rs3=ps3.executeQuery();
	
	
			
	
	
		while( rs3.next())
		{
			
			
%>


        <div class="card-body">
            <div class="media flex-column flex-sm-row">
                <div class="media-body ">
                    <h5 class="bold"><%= rs.getString(11) %></h5>
                    <p class="text-muted"> Order ID  <span class="font-weight-bold text-dark"> SC<%= rs.getString(1) %></span></p>
                    
                    <p class="text-muted"> Quantity : <%= rs.getString(12) %></p>
                    <h4 class="mt-3 mb-4 bold"> <span class="mt-5">&#x20B9;</span> <%= rs.getString(13) %> <span class="small text-muted"> </span></h4>
                    <p class="text-muted">Tracking Status on : <span class="Today"><%= rs.getString(9) %></span></p>
                      
                </div><img class="align-self-center img-fluid" src="img/products/<%=rs3.getString(14) %>" width="250 " height="250">
            </div>
        </div>
        <div class="row px-3">
            <div class="col">
                <ul id="progressbar" >
                
                
                <% if(rs.getString(10).equals("Ordered"))
                { %>
                <li class="step0 active " id="step1">PLACED</li>
                <%}  
                else{
                	%>
                	<li class="step0 " id="step1">PLACED</li>
                <%
                }%>
                <%
                
                if(rs.getString(10).equals("Shipped"))
                { %>
                
                    <li class="step0 active text-center" id="step2">SHIPPED</li>
                  <% }else
                { %>
                     <li class="step0  text-center" id="step2">SHIPPED</li>
                
                <%} %>
                
                
                <%
                
                if(rs.getString(10).equals("Delivered"))
                { %>
                
                  <li class="step0 active  text-muted text-right" id="step3">DELIVERED</li>
                  <% }else
                { %>
                    <li class="step0  text-muted text-right" id="step3">DELIVERED</li>
                
                <%} %>
                </ul>
                
                <%
                
                if(rs.getString(10).equals("Delivered"))
                { %>
                
                 <h5 class="mb-0"><a href="remove_payment.jsp?id=<%=rs.getString(1)%>">Delete </a></h5>
                  <% }else
                  { %>
                   
                   <%} %>
             
            </div>
        </div>
      

		<div class="card-header bg-white">
          <div class="row justify-content-between">
            <div class="col">
               
                <p class="text-muted">   <span class="font-weight-bold text-dark"></span> </p></div>
                
          </div>
        </div>
  

           <%
           //}
		}
		}
									}
       		catch(Exception e)
       {
       			System.out.println(e);
       }
       		
       		%>  
       		    </div>
</div>
       		 
</body>
</html>