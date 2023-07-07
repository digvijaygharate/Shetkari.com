<!DOCTYPE html>

<jsp:scriptlet>
    String fname1=(String)session.getAttribute("session_fname");
    
</jsp:scriptlet>

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

<nav class="navbar navbar-expand-lg navbar navbar-light fixed-top"  style="background-color: WHITE; height:80px;">
 
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
                    <a  class="nav-link" id="btn" href="contact.jsp"> Contact Us <span class="sr-only"></span></a>
                </li>
                
   			 <li class="dropdown nav-item"><a href="#">Farmer</a>
        	    <ul>
           		   <li><a href="navbar_farmer.jsp">Farmer</a></li>
           		  
           		   <li><a href="user_farmer_applied.jsp">Check Applied</a></li>
              	
           		 </ul>
        	  </li>               
        	   <li class="dropdown nav-item"><a href="#">WholeSaler</a>
        	    <ul>
           		   <li><a href="navbar_wholesaler1.jsp">WholeSaler</a></li>
           		   <li><a href="user_wholesaler_applied.jsp">Check Applied</a></li>
              
           		 </ul>
        	  </li>
   			
        	   <li class="dropdown nav-item"><a href="#">Product</a>
        	    <ul>
           		   
           		    <li><a href="user_farmer_products.jsp">Products</a></li>
              		  <li><a href="product_cart.jsp">Product Cart</a></li>
              		   <li><a href="tracking.jsp">Tracking Order</a></li>
           		 </ul>
        	  </li>      
        	  
        	    <li class="dropdown nav-item"><a href="#">Change Language</a>
        	    <ul>
           		   
           		    <li><a id="myid1"></a></li>
              		
           		 </ul>
        	  </li>          
               
             
				

               

            </ul>

            <ul class="navbar-nav ml-auto">


               



                <li class="nav-item active">
                    <a  class="nav-link" href="user_profile.jsp">Hello  <%= fname1 %> </a>
                </li>

                <li class="nav-item active">
                    <a  class="nav-link" href="logout"> Logout </a>
                </li>





            </ul>

        </div>

    </div>
    
    
</nav>

<script>
document.getElementById("btn").addEventListener("click",()=>{

    var m="If you have any query please fill the form ";
    const utterance =new SpeechSynthesisUtterance(m);
    utterance.pitch=1;
    utterance.rate=0.6;
    utterance.volume=1;
    utterance.voice=window.speechSynthesis.getVoices()[1];
    speechSynthesis.speak(utterance);
});

</script>
<script src="http://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate"></script>

<script>

	function loadGoogleTranslate()

	{

		new google.translate.TranslateElement("myid1")

	}

</script>
</body>
</html>