
<!DOCTYPE html>
<jsp:scriptlet>
    String fname1=(String)session.getAttribute("session_fname");
    
</jsp:scriptlet>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <%@include file="common_css_js.jsp" %>
</head>
<body>
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html"><span class="fa fa-ship"></span><span> Shetkari.</span>com</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a href="n_index.jsp" class="active">Home</a></li>

          <li ><a href="#"><span>About Us</span></a></li>

		  <li><a href="Contact.html">Contact Us</a></li>
          <li><a href="navbar_wholesaler1.jsp">WholeSaler</a></li>
          <li><a href="portfolio.html">Farmer</a></li>
          <li><a href="pricing.html">ShopKeeper</a></li>
          <li>    <a  class="nav-link" href="user_wholesaler_applied.jsp" >  <i class="fa fa-cart-plus"  style="font-size: 20px;"></i> <span class="ml-0 cart-items">( 0 )</span>  </a>
                </li>
          <li><a href="registration_first.jsp">Logout</a></li>
      	
        
          
          
         

        </ul>
     
      </nav><!-- .navbar -->
		
   
    </div>
      <marquee><h6 class="logo "><a href="user_profile.jsp">Hello <span><%= fname1 %></span> Welcome to Shetkari.com</a></h6></marquee>
  </header><!-- End Header -->
</body>
</html>