<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Details</title>

        <%@include file="components/common_css_js.jsp" %>
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
height: 200vh !important;
}
}
</style>
<!-- ********************************************************************************************************************************** -->
        
    </head>
    <body>
<!-- ********************************************************************************************************************************** -->
        <%@include  file="components/navbar.jsp" %>
<!-- ********************************************************************************************************************************** -->
<section class="h-100 h-custom" id="hero" style="background-color: #8fc4b7;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-8 col-xl-6">
        <div class="card rounded-3">
          <img src="img/register.jpg"
            class="w-100" style="border-top-left-radius: .3rem; height:300px ; border-top-right-radius: .3rem;"
            alt="Sample photo">
            <%@include file="components/message.jsp" %>
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Add Details</h3>

            <form class="px-md-2" method="post" action="wholesaler_add_product">

              <div class="form-outline mb-4">
                <input type="text" id="form3Example1q" class="form-control" name="wfname" placeholder="Enter Wholesaler Name"/>
                <label class="form-label" for="form3Example1q" >Enter Wholesaler Name</label>
                
                 <input type="text" id="form3Example1q" class="form-control" name="wlname" placeholder="Enter Wholesaler Description"/>
                <label class="form-label" for="form3Example1q">Enter Wholesaler Description</label>
                
                 <input type="text" id="form3Example1q" class="form-control" name="wemail" placeholder="Enter Your Email"/>
                <label class="form-label" for="form3Example1q">Email</label>
                
                 <input type="text" id="form3Example1q" class="form-control" name="wpass" placeholder="Enter Your Password" />
                <label class="form-label" for="form3Example1q">Password</label>
                
                 <input type="text" id="form3Example1q" class="form-control"name="wcpass" placeholder="Enter Your Confirm Password"/>
                <label class="form-label" for="form3Example1q">Confirm Password</label>
                
                <input type="text" id="form3Example1q" class="form-control" name="wcity" placeholder="Enter Your City"/>
                <label class="form-label" for="form3Example1q">City</label>
                
                <input type="number" id="form3Example1q" class="form-control" minlength="10" maxlength="10" name="wphone" placeholder="Enter Your Phone Number" />
                <label class="form-label" for="form3Example1q">Phone</label>
                
                 <select class="select form-control" name="wgender" >
                    <option value="1" disabled >Gender</option>
                    <option value="Female">Female</option>
                    <option value="Male">Male</option>
                    <option value="Other">Other</option>
                  </select>
              </div>

              

              <button type="submit" class="btn btn-success btn-lg mb-1">Submit</button>

            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ********************************************************************************************************************************** -->

<!-- ********************************************************************************************************************************** -->
        
<!-- ********************************************************************************************************************************** -->
        
    </body>
</html>
