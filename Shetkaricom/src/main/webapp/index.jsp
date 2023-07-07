
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String email=(String)session.getAttribute("session_wemail");
    String email1=(String)session.getAttribute("session_email");
</jsp:scriptlet>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shetkari.com </title>
        <%@include file="components/common_css_js.jsp" %>
	 <link rel="stylesheet" href="templatemo-style.css">     
	                               <!-- Templatemo style -->
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
.parent {
   background-image: url("img/farmer1.jpg");
   background-size: cover;
   height: 500px;
   position: relative;
}
.text{
   color:white;
   position: absolute;
}
.top-left{
   top:0;
   left:0;
}
.cont{
    margin-top:50px;
    
}

.counter-box {
	display: block;
	background: #f6f6f6;
	padding: 40px 20px 37px;
	text-align: center
}

.counter-box p {
	margin: 5px 0 0;
	padding: 0;
	color: #909090;
	font-size: 18px;
	font-weight: 500
}

.counter-box i {
	font-size: 60px;
	margin: 0 0 15px;
	color: #d2d2d2
}

.counter { 
	display: block;
	font-size: 32px;
	font-weight: 700;
	color: #666;
	line-height: 28px
}

.counter-box.colored {
      background: green;
      color : white;
}

.counter-box.colored p,
.counter-box.colored i,
.counter-box.colored .counter {
	color: #fff
}
	</style>
    </head>
    <body>
    
    <jsp:scriptlet>         
    if(email1 !=null )
                
                {
            </jsp:scriptlet>
                    <jsp:include page="components/user_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }else if(email !=null ){
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
<div class="parent">
   <div class="text top-left">
	
		<div class="container">
			<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-11">
		<br><br><br><br>
			<h4 class="display-3" style="color: #388E3C;" ><b>Welcome to Shetkari.com </b></h4>
			<p ><h6>Farmers' markets can offer farmers increased profit over selling to wholesalers, food processors, or large grocery firms. 
			By selling directly to consumers, produce often needs less transport, less handling, less refrigeration and less time in storage.
			</h6></p><p><h6>By selling in an outdoor market, the cost of land, buildings, lighting and air-conditioning is also reduced or eliminated. 
			Farmers may also retain profit on produce not sold to consumers, by selling the excess to canneries and other food-processing firms. 
			</h6></p>
			
			<button type="button" class="btn btn-success"><span class="fa fa-angle-double-right fa-spin"></span> Read More</button>&nbsp;&nbsp;
			<a href="login_first.jsp" class="btn btn-success"><span class="fa fa-user-circle fa-spin"></span> Login</a>&nbsp;&nbsp;
			<a href="registration_first.jsp" class="btn btn-success"><span class="fa fa-user-plus fa-spin"></span> Signup</a>
			</div>
		</div>
		</div>
	</div>
	
</div>


<!-- 
<div class="container-fluid p-0 m-0" >

	<div class="jumbotron banner">
		<div class="container">
		
			<h4 class="display-3">Welcome to Shetkari.com </h4>
			<p>Farmers' markets can offer farmers increased profit over selling to wholesalers, food processors, or large grocery firms. 
			By selling directly to consumers, produce often needs less transport, less handling, less refrigeration and less time in storage.
			</p><p>By selling in an outdoor market, the cost of land, buildings, lighting and air-conditioning is also reduced or eliminated. 
			Farmers may also retain profit on produce not sold to consumers, by selling the excess to canneries and other food-processing firms. 
			</p>
			
			<button type="button" class="btn btn-outline-primary"><span class="fa fa-angle-double-right fa-spin"></span> Read More</button>
			<a href="login_first.jsp" class="btn btn-outline-primary"><span class="fa fa-user-circle fa-spin"></span> Login</a>
			<a href="registration_first.jsp" class="btn btn-outline-primary"><span class="fa fa-user-plus fa-spin"></span> Signup</a>
			
		</div>
	</div>
</div>
 -->
<!-- ********************************************************************************************************************************** -->
<div class="container ">
        <h2 class="text-center font-weight-bold my-5" style="color: green;">Best Services For You</h2>
        <div class="row">
            <div data-aos="fade-up" data-aos-delay="0" data-aos-duration="1000" data-aos-once="true" class="col-md-4 text-center">
                <img src="img/Farmer.png" alt="Anti-spam" class="mx-auto" style="height:100px">
                <h4 style="color: green;">Farmer</h4>
                <p style="color: green;">A farmer is a person who runs and works on a farm. Farmers work in some aspect of agriculture, growing vegetables, grains, or fruit; or raising animals for milk, eggs, or meat.</p>
            </div>
            <div data-aos="fade-up" data-aos-delay="200" data-aos-duration="1000" data-aos-once="true" class="col-md-4 text-center">
                <img src="img/office.png" alt="Phishing Detect" class="mx-auto" style="height:100px">
                <h4 style="color: green;">WholeSaler</h4>
                <p style="color: green;">A wholesaler is a company or individual that purchases great quantities of products from manufacturers, farmers, other producers, and vendors. Wholesalers store them in warehouses and sell them on to retailers and businesses.</p>
            </div>
            <div data-aos="fade-up" data-aos-delay="400" data-aos-duration="1000" data-aos-once="true" class="col-md-4 text-center">
                <img src="img/shopkeeper.png" alt="Smart Scan" class="mx-auto" style="height:100px">
                <h4 style="color: green;">ShopKeeper</h4>
                <p style="color: green;">Storekeeping is the process of maintaining safe custody of all raw materials, supplies, finished products, purchased items and other store-related inventories</p>
            </div>
        </div><br>
    </div>
<!-- ********************************************************************************************************************************** -->
<div class="container-fluid" style="background-color:green">
	<div class="row">
		<div class="col-md-6 m-0 p-0 ">
			<img src="img/why.jpg" alt="Anti-spam" class="mx-auto" style="width:100% ">
		</div>
		<div class="col-md-6">
		<br>
		<center><h2 style="color:white">Why Shetkari.com</h2></center><br>
		<center>
		<p style="color:white">Shetakari.com helps to the Indian farmers to make the
		   effective cultivation by providing up-to-date information and make a path to
		   earn more money from Indian villages by sell their products to different cities
		   online. Here if suppose some village farmers want to use this facility and
want to learn how is it possible and how they can use Shetakari.com to sell
their products, If they have knowledge of computer then they can directly
register in the site and sell their product otherwise they can contact with our
professional speakers. On the other side, wholesaler from town can also
register and buy products as per their needs. Farmers are notified whenever
dealers publish an advertisement or offer on the website through SMS
message.</p></center>
		</div>
	
	</div>

</div>
<!-- ********************************************************************************************************************************** -->

<div class="container cont" >
    <center><h1 style="color:green">About Our Shetkari.com</h1></center><br>
    <div class="row" >

	<div class="four col-md-3">
		<div class="counter-box colored">
			<i class="fa fa-thumbs-o-up"></i>
			<span class="counter">2147</span>
			<p>Happy Customers</p>
		</div>
	</div>
	<div class="four col-md-3">
		<div class="counter-box">
			<i class="fa fa-group"></i>
			<span class="counter">3275</span>
			<p>Registered Users</p>
		</div>
	</div>
	<div class="four col-md-3 ">
		<div class="counter-box colored">
			<i class="fa  fa-shopping-cart"></i>
			<span class="counter">289</span>
			<p>Available Products</p>
		</div>
	</div>
	<div class="four col-md-3">
		<div class="counter-box">
			<i class="fa  fa-user"></i>
			<span class="counter">1563</span>
			<p>Farmers & WholeSalers</p>
		</div>
	</div>
  </div>	
</div><br>  	<br>
<!-- ********************************************************************************************************************************** -->

		
		
<!-- ********************************************************************************************************************************** -->
 	
<!-- ********************************************************************************************************************************** -->
 
 
 <!-- ********************************************************************************************************************************** -->
 <%@include file="components/footer.jsp" %>
<!-- ********************************************************************************************************************************** -->
 	<script>
$(document).ready(function() {

    $('.counter').each(function () {
$(this).prop('Counter',0).animate({
    Counter: $(this).text()
}, {
    duration: 4000,
    easing: 'swing',
    step: function (now) {
        $(this).text(Math.ceil(now));
    }
});
});

});  

</script>
        <%@include  file="components/common_modals.jsp" %>
<!-- ********************************************************************************************************************************** -->
 
    </body>
</html>
