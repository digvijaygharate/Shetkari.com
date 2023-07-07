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
<title>Shetkari.com</title>
<%@include file="components/n_common.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat&display=swap');
body{background-color: #eee !important;
font-family: 'Montserrat', sans-serif}
.card{border:none}
.logo{background-color: #eeeeeea8}
.totals tr td{font-size: 13px}.footer{background-color: #eeeeeea8}.
footer span{font-size: 12px}.product-qty span{font-size: 12px;color: #dedbdb}
#hero1
{
margin-top:150px;
}
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></script>
<script src=""></script>
</head>
<body>
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
<div class="container" id="hero1">

        <div class="row d-flex justify-content-center">

            <div class="col-md-8">

                <div class="card">


                        <div class="text-left logo p-2 px-5">

                            <img src="https://i.imgur.com/2zDU056.png" width="50">
                            

                        </div>

                        <div class="invoice p-5">

                            <h5>Your order Confirmed!</h5>
								<%
								String fname=(String)session.getAttribute("session_fname");
								%>
                            <span class="font-weight-bold d-block mt-4">Hello, <%=fname %></span>
                            <span>You order has been confirmed and will be shipped in next two days!</span>

                         






                               


                                <p>We will be sending shipping confirmation email when the item shipped successfully!</p>
                                <p class="font-weight-bold mb-0">Thanks for shopping with us!</p>
                                <span>Shetkari.com</span>



                            

                        </div>


                        <div class="d-flex justify-content-between footer p-3">

                            <span>Need Help? visit our <a href="#"> help center</a></span>
                             <span><a href="tracking.jsp">Tracking Order</a></span>
                            
                        </div>



            
        </div>
                
            </div>
            
        </div>
        
    </div><br><br><br><br>
    
       <%@include file="components/n_footer.jsp" %>
</body>
</html>