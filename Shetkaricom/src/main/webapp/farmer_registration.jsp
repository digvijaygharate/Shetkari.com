<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Farmer Registration</title>

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
height: 200vh !important;
}
}
</style>
<!-- ********************************************************************************************************************************** -->
 <script>
            function val(v)
            {
                document.getElementById(v).innerHTML="";
            }
            function validation1()
            {
                var flag=true;
                
                var ffname2=document.regform.ffname1.value;
                var flname2=document.regform.flname1.value;
                var fgender2=document.regform.fgender1.value;
                var femail2=document.regform.femail1.value;
                var fpass2=document.regform.fpass1.value;
           
                var fcity2=document.regform.fcity1.value;
                //var gender2=document.regform.gender1.value;
                //var fields2=document.regform.field1.value;
              
                
                var name_pattern=/^[a-zA-Z ]{3,30}$/;
                var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                
               
                
                if(!ffname2.match(name_pattern))
                {
                    document.getElementById('wfname_error').innerHTML="First Name is not properly formated";
                    flag=false;
                }
                if(ffname2==="")
                {
                    document.getElementById('wfname_error').innerHTML="First Name cannot be empty";
                    flag=false;
                }
                if(!flname2.match(name_pattern))
                {
                    document.getElementById('wlname_error').innerHTML="Last Name is not properly formated";
                    flag=false;
                }
                if(flname2==="")
                {
                    document.getElementById('wlname_error').innerHTML="Last Name cannot be empty";
                    flag=false;
                }
                if(fgender2==="Select Gender")
                {
                    document.getElementById('gender_error').innerHTML="Please select gender";
                    flag=false;
                }
                
                if(!femail2.match(email_pattern))
                {
                    document.getElementById('email_error').innerHTML="Email is not properly formatted";
                    flag=false;
                }
                if(femail2==="")
                {
                    document.getElementById('email_error').innerHTML="Email cannot be empty";
                    flag=false;
                }
                
                if(!fpass2.match(password_pattern))
                {
                    document.getElementById('password_error').innerHTML="Password is not properly formatted (should contain 0-9,special characters)";
                    flag=false;
                }
                if(fpass2==="")
                {
                    document.getElementById('password_error').innerHTML="Password cannot be empty";
                    flag=false;
                }
                
               
                
                
               
                if(fcity2==="")
                {
                    document.getElementById('city_error').innerHTML="Please select the city";
                    flag=false;
                }
                return flag;
               
            }
        </script>

<!-- ********************************************************************************************************************************** -->
        
    </head>
    <body>
<!-- ********************************************************************************************************************************** -->
        <%@include  file="components/navbar.jsp" %>
<!-- ********************************************************************************************************************************** -->
<section class="h-100 h-custom"id="hero" style="background-color: #8fc4b7;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-8 col-xl-6">
        <div class="card rounded-3">
          <img src="img/register.jpg"
            class="w-100" style="border-top-left-radius: .3rem;height:300px ; border-top-right-radius: .3rem;"
            alt="Sample photo">
            <%@include file="components/message.jsp" %>
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Farmer Registration Info</h3>

            <form class="px-md-2" name="regform" onsubmit="return validation1()" method="post" action="farmer_registration" >

             
								<input type="text" class="form-control" placeholder="Enter First Name" name="ffname1" class="reglog_tf_design" onkeyup="val('wname_error')" /> <span id="wfname_error" style="color: red"> </span> <br>
                                <input type="text" class="form-control" placeholder="Enter Last Name" name="flname1" class="reglog_tf_design" onkeyup="val('wname_error')" /> <span id="wlname_error" style="color: red"> </span> <br>
                                <select name="fgender1" class="reglog_tf_design form-control" >
                                    <option  > Select Gender </option>
                                    <option value="Male"> Male </option>
                                    <option value="Female"> Female </option>
                                    <option value="Other"> Other </option>
                                </select>  <span id="gender_error" style="color: red"> </span> <br>
                              
                                <input type="text" class="form-control" placeholder="Enter Email" name="femail1" class="reglog_tf_design" onkeyup="val('email_error')" />  <span id="email_error" style="color: red"> </span><br>
                                <input type="password" class="form-control" placeholder="Enter Password" name="fpass1" class="reglog_tf_design" onkeyup="val('password_error')" />  <span id="password_error" style="color: red"> </span><br> 
                                <input type="text" class="form-control" placeholder="Enter Your City " name="fcity1" class="reglog_tf_design" onkeyup="val('email_error')" />  
                                <span id="city_error" style="color: red"> </span><br>
                                
                                	
								  	
                               
                                <input type="submit" value="Register" class="btn btn-primary" />   
                                
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ********************************************************************************************************************************** -->
 <%@include  file="components/n_footer.jsp" %>
<!-- ********************************************************************************************************************************** -->
        
<!-- ********************************************************************************************************************************** -->
        
    </body>
</html>
