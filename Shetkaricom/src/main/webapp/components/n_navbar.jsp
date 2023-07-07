<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="common_css_js.jsp" %>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #388E3C;">
 
       <a class="navbar-brand" href="index.jsp"><span class="fa fa-ship" style="color: white;"> Shetkari.com</span></a>
  			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   			 <span class="navbar-toggler-icon"></span>
  			</button>
  			
   <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="n_index.jsp" style="color: white;">Home <span class="sr-only">(current)</span></a>
                </li>
                 <li class="nav-item active">
                    <a style="color: white;" class="nav-link" href="navbar_wholesaler1.jsp">WholeSaler <span class="sr-only"></span></a>
                </li>
                
                <li class="nav-item active">
                    <a style="color: white;" class="nav-link" href="n_index.jsp">About Us <span class="sr-only"></span></a>
                </li>
                <li class="nav-item active">
                    <a style="color: white;" class="nav-link" href="contact.jsp">Contact Us <span class="sr-only"></span></a>
                </li>
				
				

               

            </ul>

            <ul class="navbar-nav ml-auto">


                <li class="nav-item active">
                    <a style="color: white;" class="nav-link" href="#!" data-toggle="modal" data-target="#cart">  <i class="fa fa-cart-plus"  style="font-size: 20px;"></i> <span class="ml-0 cart-items">( 0 )</span>  </a>
                </li>



                <li class="nav-item active">
                    <a style="color: white;" class="nav-link" href="login_first.jsp"><span class="fa fa-user-circle"></span> Login </a>
                </li>

                <li class="nav-item active">
                    <a style="color: white;" class="nav-link" href="registration_first.jsp"><span class="fa fa-user-plus"></span> Register </a>
                </li>





            </ul>

        </div>

    </div>
</nav>
</body>
</html>