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
<%@include file="components/n_common.jsp" %>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif
}

.container {
    margin: 30px auto;
}

.container .card {
    width: 100%;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
    background: #fff;
    border-radius: 0px;
}

body {
    background: #eee
}



.btn.btn-primary {
    background-color: #ddd;
    color: black;
    box-shadow: none;
    border: none;
    font-size: 20px;
    width: 100%;
    height: 100%;
}

.btn.btn-primary:focus {
    box-shadow: none;
}

.container .card .img-box {
    width: 80px;
    height: 50px;
}

.container .card img {
    width: 100%;
    object-fit: fill;
}

.container .card .number {
    font-size: 24px;
}

.container .card-body .btn.btn-primary .fab.fa-cc-paypal {
    font-size: 32px;
    color: #3333f7;
}

.fab.fa-cc-amex {
    color: #1c6acf;
    font-size: 32px;
}

.fab.fa-cc-mastercard {
    font-size: 32px;
    color: red;
}

.fab.fa-cc-discover {
    font-size: 32px;
    color: orange;
}

.c-green {
    color: green;
}

.box {
    height: 40px;
    width: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #ddd;
}

.btn.btn-primary.payment {
    background-color: #1c6acf;
    color: white;
    border-radius: 0px;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 24px;
}


.form__div {
    height: 50px;
    position: relative;
    margin-bottom: 24px;
}

.form-control {
    width: 100%;
    height: 45px;
    font-size: 14px;
    border: 1px solid #DADCE0;
    border-radius: 0;
    outline: none;
    padding: 2px;
    background: none;
    z-index: 1;
    box-shadow: none;
}

.form__label {
    position: absolute;
    left: 16px;
    top: 10px;
    background-color: #fff;
    color: #80868B;
    font-size: 16px;
    transition: .3s;
    text-transform: uppercase;
}

.form-control:focus+.form__label {
    top: -8px;
    left: 12px;
    color: #1A73E8;
    font-size: 12px;
    font-weight: 500;
    z-index: 10;
}

.form-control:not(:placeholder-shown).form-control:not(:focus)+.form__label {
    top: -8px;
    left: 12px;
    font-size: 12px;
    font-weight: 500;
    z-index: 10;
}

.form-control:focus {
    border: 1.5px solid #1A73E8;
    box-shadow: none;
}
</style>
</head>
<body style="background-color: #eee;">
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
<div class="container" style="margin-top:110px">
        <form action="payment_action.jsp" class="form">
        <div class="row">
            
           
           
            <div class="col-12 mt-4">
                <div class="card p-3">
                    <h4>Payment</h4>
                </div>
            </div>
            <div class="col-12">
                <div class="card p-3">
                    <div class="card-body  p-0">
                        <p>
                            <a class="btn btn-outline-success  d-flex align-items-center justify-content-between"
                                data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="true"
                                aria-controls="collapseExample">
                                <span>Product Summary</span>
                              
                            </a>
                        </p>
                        <div class="collapse p-3 pt-0" id="collapseExample">
                            <div class="row">
                                <div class="col-8">
                                    <p >Summary</p>
                                    
                                    
									<%
										String email=(String)session.getAttribute("session_email");
									String a;
									try
									{
										Connection con=DbConnection.getConnect();
										PreparedStatement ps1=con.prepareStatement("select * from cart where cemail=?");
										ps1.setString(1,email);
										ResultSet rs=ps1.executeQuery();
										
										
										
										
										
							       		while( rs.next())
							       		{
							       			a=rs.getString(2);
							       			System.out.println(a);
							       			
							       			PreparedStatement ps2=con.prepareStatement("select * from product where pid=?");
											ps2.setString(1,a);
											
											ResultSet rs1=ps2.executeQuery();
											
								       		while( rs1.next())
								       		{
                                    %>
                                    <input type="hidden" value="<%=rs1.getString(1) %>" name="pid" >
                                    <p class="mb-0"><span>Product : </span><span class="c-green"> <%=rs1.getString(2) %></span></p>
                                    <input type="hidden" value="<%=rs1.getString(2) %>" name="pname" >
                                     <p class="mb-0"><span>Quantity : </span><span
                                            class="c-green"><%=rs.getString(3) %></span></p>
                                   <input type="hidden" value="<%=rs.getString(3) %>" name="pquan" >            
                                    <p class="mb-0"><span>Price : </span><span
                                            class="c-green"><%=rs.getString(5) %></span></p>
                                             <input type="hidden" value="<%=rs.getString(5) %>" name="pprice" >     
                                    <p class="mb-0"><%=rs1.getString(12) %></p>
                                        <br>
                                       <%}
       }
									}
       		catch(Exception e)
       {
       			System.out.println(e);
       }
       		
       		%>  
                                        
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body  p-0">
                        <p>
                            <a class="btn btn-outline-success p-2 w-100 h-100 d-flex align-items-center justify-content-between"
                                data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="true"
                                aria-controls="collapseExample">
                                <span >Credit Card</span>
                               
                            </a>
                        </p>
                        <div class="collapse show p-3 pt-0" id="collapseExample">
                            <div class="row">
                                <div class="col-lg-5 mb-lg-0 mb-3">
                                    <p > Profile Summary</p>
                                    <%
										
									try
									{
										Connection con=DbConnection.getConnect();
										PreparedStatement ps5=con.prepareStatement("select * from 	register where email=?");
										ps5.setString(1,email);
										ResultSet rs5=ps5.executeQuery();
										
										
										
										
										
							       		while( rs5.next())
							       		{
							       			
                                    %>
                                    
                                    
                                    <p ><span >User Name : </span><span class="c-green"><%= rs5.getString(2) %> <%= rs5.getString(3) %></span>
                                    </p>
                                    <p >
                                        <span >Email : </span>
                                           <input type="hidden" value="<%=rs5.getString(5) %>" name="pemail" > 
                                        <span class="c-green"><%= rs5.getString(5) %></span>
                                    </p>
                                    <p class="mb-0">City : <span class="c-green"><%= rs5.getString(7) %></span></p>
                                        <input type="hidden" value="<%=rs5.getString(7) %>" name="pcity" >    
                                          <%
       }
									}
       		catch(Exception e)
       {
       			System.out.println(e);
       }
       		
       		%>  
                                </div>
                                <div class="col-lg-7">
                               
                                        <div class="row">
                                     
                                    
                                            <div class="col-12">
                                                <div class="form__div">
                                                    <input type="number" name="name1" required class="form-control" placeholder=" ">
                                                    <label for="" class="form__label">Card Number</label>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form__div">
                                                    <input type="number" name="name2" required class="form-control" placeholder=" ">
                                                    <label for="" class="form__label">MM / yy</label>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form__div">
                                                    <input type="Password" class="form-control" name="name3" placeholder=" " required> 
                                                    <label for="" class="form__label">cvv code</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form__div">
                                                    <input type="text" class="form-control" placeholder=" "name="name4" required>
                                                    <label for="" class="form__label">name on the card</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                            <button type="submit" class="btn btn-outline-success w-100">Submit</button>
                                                
                                            </div>
                                        </div>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
          </form>
    </div>
    <br>
       <%@include file="components/n_footer.jsp" %>
    
</body>
</html>