
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="components/n_common.jsp" %>
<!-- ********************************************************************************************************************************** -->
<style>
#hero {
  width: 100%;
  height: 100vh;
  background: url("images/login_signin.jpg") top center;
  background-size: cover;
  position: relative;
  background-image: url("img/farmer1.jpg");
}
@media (min-width: 1025px) {
.h-custom {
height: 140vh !important;
}
}
</style>
<!-- ********************************************************************************************************************************** -->
        
    </head>
    <body>
        <%@include  file="components/navbar.jsp" %>
<!-- ********************************************************************************************************************************** -->
<section class="h-100 h-custom " id="hero" style="background-color: #8fc4b7;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-8 col-xl-6">
        <div class="card rounded-3">
          <img src="img/register.jpg"
            class="w-100" style="border-top-left-radius: .3rem; height:300px ;border-top-right-radius: .3rem;"
            alt="Sample photo">
            <%@include file="components/message.jsp" %>
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Login Here</h3>

            <form class="px-md-2" method="post" action="admin_login">

              <div class="form-outline mb-4">
                <input type="text" id="form3Example1q" class="form-control" name="ulemail" placeholder="Enter Your Email"/>
                <label class="form-label" for="form3Example1q" >Enter Your Email</label>
                
                 <input type="text" id="form3Example1q" class="form-control" name="ulpass" placeholder="Enter Your Password"/>
                <label class="form-label" for="form3Example1q">Enter Your Password</label>
                <br>
               
                </div>

              
<center>
              <button type="submit" class="btn btn-outline-success ">Submit</button>
               <button type="reset" class="btn btn-outline-primary">Reset</button>
              <br>
			   <a href="register.jsp">If not registered click here</a>
        </center>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ********************************************************************************************************************************** -->
 <!-- ======= Footer ======= -->
    <%@include file="components/n_footer.jsp" %>
  <!-- End Footer -->



    </body>
</html>
