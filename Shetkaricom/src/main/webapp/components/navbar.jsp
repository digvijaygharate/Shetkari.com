<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="common_css_js.jsp" %>
        
        <style>
        .navbar .container .navbar-nav .nav-item a
        {
        	color:black;
        }
    
        
        .navbar .container .navbar-nav .nav-item a:hover
        {
        
        	color : #1bbd36;
        	transition:0s;
        }

    
        </style>



</head>
<body>

<nav class="navbar  navbar-expand-lg navbar navbar-light fixed-top" style="background-color: WHITE; height:75px;" >
 
       <a class="navbar-brand" href="index.jsp"><h2 ><span class="fa fa-ship" style="color: #1bbd36;"> Shetkari</span><span>.com</span></h2></a>
  			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   			 <span class="navbar-toggler-icon"></span>
  			</button>
  			
   <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="n_index.jsp" "> Home <span class="sr-only">(current)</span></a>
                </li>
                 <li class="nav-item active">
                    <a  class="nav-link" href="n_index.jsp"> About Us <span class="sr-only"></span></a>
                </li>
                <li class="nav-item active">
                    <a  class="nav-link" href="contact.jsp"> Contact Us <span class="sr-only"></span></a>
                </li>
                
   			 <li class="dropdown nav-item"><a href="#">Farmer</a>
        	    <ul>
           		   <li><a href="navbar_farmer.jsp">Farmer</a></li>
           		    <li><a href="user_farmer_products.jsp">Products</a></li>
           		 
           		 </ul>
        	  </li>               
        	   <li class="dropdown nav-item"><a href="#">WholeSaler</a>
        	    <ul>
           		   <li><a href="navbar_wholesaler1.jsp">WholeSaler</a></li>
           		
              
           		 </ul>
        	  </li>
   				 <li class="dropdown nav-item"><a href="#">ShopKeeper</a>
        	    <ul>
           		   <li><a href="about.html">ShopKeeper</a></li>
           		 
              
           		 </ul>
        	  </li>
               
             
				

               

            </ul>
            <ul class="navbar-nav ml-auto">


                <li class="nav-item ">
                    <a  class="nav-link" href="#!" data-toggle="modal" data-target="#cart">   <span class="ml-0 cart-items"></span>  </a>
                </li>



                <li class="nav-item">
                    <a  class="nav-link" href="login_first.jsp">  Login </a>
                </li>

                <li class="nav-item ">
                    <a  class="nav-link" href="registration_first.jsp"> Register </a>
                </li>





            </ul>

        </div>

    </div>
</nav>


</body>
</html>