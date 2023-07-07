<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<!-- For Icons -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
<style>
	#hero {
  width: 100%;
  height: 100vh;
  background: url("images/login_signin.jpg") top center;
  background-size: cover;
  position: relative;
  background-image: url("img/farmer1.jpg");
  
}

#hero:before {
  content: "";
  background: rgba(0, 0, 0, 0.6);
  position: absolute;
  bottom: 0;
  top: 0;
  left: 0;
  right: 0;
}

#hero .container {
  position: relative;
  padding-top: 74px;
  text-align: center;
}

#hero h1 {
  margin: 0;
  font-size: 56px;
  font-weight: 700;
  line-height: 64px;
  color: #fff;
  font-family: "Poppins", sans-serif;
}

#hero h1 span {
  color: #ffc451;
}

#hero h2 {
  color: rgba(255, 255, 255, 0.9);
  margin: 10px 0 0 0;
  font-size: 24px;
}

#hero .icon-box {
  padding: 30px 20px;
  transition: ease-in-out 0.3s;
  border: 1px solid rgba(255, 255, 255, 0.3);
  height: 100%;
  text-align: center;
}

#hero .icon-box i {
  font-size: 32px;
  line-height: 1;
  color: #ffc451;
}

#hero .icon-box h3 {
  font-weight: 700;
  margin: 10px 0 0 0;
  padding: 0;
  line-height: 1;
  font-size: 20px;
  line-height: 26px;
}

#hero .icon-box h3 a {
  color: #ffff;
  transition: ease-in-out 0.3s;
}

#hero .icon-box h3 a:hover {
  color: #ffc451;
  text-decoration: none;
}

#hero .icon-box:hover {
  border-color: white;
  transform: scale(1.05);
  box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
  background-color :black;
  
  
}

@media (min-width: 1024px) {
  #hero {
    background-attachment: fixed;
  }
}

@media (max-width: 768px) {
  #hero {
    height: auto;
  }

  #hero h1 {
    font-size: 28px;
    line-height: 36px;
  }

  #hero h2 {
    font-size: 20px;
    line-height: 24px;
  }
}
.icon-green
{
	color : green;
	font-size: 25px;
}


</style>		
</head>
<body>
<!-- ********************************************************************************************************************************** -->
  <%@include file="components/navbar.jsp" %>
<!-- ********************************************************************************************************************************** -->

<section id="hero" class="d-flex align-items-center justify-content-center img-fluid">
    <div class="container" data-aos="fade-up">

      <div class="row justify-content-center " data-aos="fade-up" data-aos-delay="150">
        <div class="col-xl-6 col-lg-8">
          <h1><span style="color:#1bbd36">SHETKARI</span>.COM</h1>
          <h2>Please Login Here </h2>
        </div>
      </div>

      <div class="row gy-4 mt-5 justify-content-center" data-aos="zoom-in" data-aos-delay="250">
        <div class="col-xl-2 col-md-4">
          <div class="icon-box">
            <i class="fa fa-users icon"></i>
           <a href="user_login.jsp">   <h3>User</a></h3>
          </div>
        </div>
        <div class="col-xl-2 col-md-4">
          <div class="icon-box">
            <i class="fa fa-ship icon"></i>
         <a href="farmer_login.jsp">  <h3>Farmer</a></h3>
          </div>
        </div>
        <div class="col-xl-2 col-md-4">
          <div class="icon-box">
            <i class="fa fa-universal-access icon"></i>
            <a href="wholesaler_login.jsp">  <h3>WholeSaler</a></h3>
          </div>
        </div>
        <div class="col-xl-2 col-md-4">
          <div class="icon-box">
            <i class="fa fa-shopping-basket icon-green "></i>
          <a href="registration_shopkeeper.jsp">  <h3>Shopkeeper</a></h3>
          </div>
        </div>
           <div class="col-xl-2 col-md-4">
          <div class="icon-box">
            <i class="fa fa-shopping-basket icon-green "></i>
          <a href="admin_login.jsp">  <h3>Admin</a></h3>
          </div>
        </div>
      <!--   <div class="col-xl-2 col-md-4">
          		<div class="icon-box">
            		<i class="ri-database-2-line"></i>
            			<h3><a href="">Nemos Enimade</a></h3>
          		</div>
        	</div>
        --> 
      </div>

    </div>
  </section><!-- End Hero -->

  <main id="main">

<!-- ********************************************************************************************************************************** -->
 <!-- ======= Footer ======= -->
    <%@include file="components/n_footer.jsp" %>
  <!-- End Footer -->
  
  
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>