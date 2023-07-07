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
            .navbar .container .navbar-nav .nav-item a:active
        {
        
        	color : #1bbd36;
        	transition:0s;
        }

    
        </style>
        
        

</head>
<body>

<nav class="navbar navbar-expand-lg navbar navbar-light fixed-top" style="background-color: WHITE; height:80px;">
 
            <a class="navbar-brand" href="index.jsp"><h2 ><span class="fa fa-ship" style="color: #1bbd36;"> Shetkari</span><span>.com</span></h2></a>
 			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
   			 <span class="navbar-toggler-icon"></span>
  			</button>
  			
   <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">

              
                
             
            
                
            
				
				

               

            </ul>

            <ul class="navbar-nav ml-auto">






                <li class="nav-item active">
                    <a  class="nav-link" href="#">Hello  Admin </a>
                </li>

                <li class="nav-item active">
                    <a  class="nav-link" href="logout"> Logout </a>
                </li>





            </ul>

        </div>

    </div>
</nav>
</body>
</html>