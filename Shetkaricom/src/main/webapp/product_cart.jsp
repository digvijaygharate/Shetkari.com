<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>

<jsp:scriptlet>
String wemail1=(String)session.getAttribute("session_wemail");
String email2=(String)session.getAttribute("session_femail");
String email1=(String)session.getAttribute("session_email");
</jsp:scriptlet>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shetkari.com</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@include file="components/n_common.jsp" %>
<style>
@media (min-width: 1025px) {
.h-custom {
height: 100vh !important;
}
}
</style>
</head>
<body>
<!-- ********************************************************************************************************************************** -->
       <jsp:scriptlet>         
    if(email1 !=null )
                
                {
            </jsp:scriptlet>
                    <jsp:include page="components/user_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }else if(email2 !=null ){
            </jsp:scriptlet>
                    <jsp:include page="components/farmer_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            else if(wemail1 !=null ){
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
<section class="" style="background-color: #eee; margin-top:70px;">
  <div class="container">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="card">
          <div class="card-body p-4">

            <div class="row">

              <div class="col-lg-12">
                <h5 class="mb-3"><a href="#!" class="text-body"><i
                      class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                <hr>

                <div class="d-flex justify-content-between align-items-center mb-4">
                  <div>
                    <p class="mb-1">Shopping cart</p>
                    <p class="mb-0"></p>
                  </div>
                  <div>
                   <div class="d-flex flex-row align-items-center">
                        <div style="width: 100px;">
                          <p class="fw-normal mb-0">Quantity</p>
                        </div>
                        <div style="width: 80px;">
                          <p class="mb-0">Price</p>
                        </div>
                          <div style="width: 180px;">
                          <p class="mb-0">Total</p>
                        </div>
                        
                        <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                      </div>
                  </div>
                </div>

<%
String email=(String)session.getAttribute("session_email");
int total=0;
int sno=0;
try
{
	Connection con=DbConnection.getConnect();
	Statement s=con.createStatement();
	ResultSet rs1=s.executeQuery("select sum(ctotal) from cart where cemail='"+email+"' and caddress is null");
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}

%>
     
      <% 
      ResultSet rs=s.executeQuery("select * from product inner join cart on product.pid=cart.cproduct_id and cart.cemail='"+email+"' and cart.caddress is NULL"); 
      while(rs.next())
      {
 
			sno=sno+1;
			
		%>

                <div class="card mb-3">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div class="d-flex flex-row align-items-center">
                        <div>
                         <img src="img/products/<%=rs.getString(14) %>" class="card-img img-fluid" style="width:100px;height:100px" alt="Sorry">
                                          
                        </div>
                        <div class="ms-3">
                          <h5><%=rs.getString(2) %></h5>
                          <p class="small mb-0"><%=rs.getString(3) %></p>
            <!--   <a href="" class="button"  data-toggle="modal" data-target="#exampleModal">Add Quantity</a>
            -->
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center">
                        <div style="width: 80px; margin-top:5px">
                        <h5> <a href="incdecquantityaction.jsp?id=<%= rs.getString(1)%>&quantity=inc"><i class='fa fa-plus-circle'> </i></a> <%=rs.getString(18) %>&nbsp;  
                         <a href="incdecquantityaction.jsp?id=<%= rs.getString(1)%>&quantity=dec"><i class='fa fa-minus-circle'></i></a>
           				</h5>
                        <!--   <h5 class="fw-normal mb-0"><%=rs.getString(18) %></h5>
                         -->
                        </div>
                        <div style="width: 80px;">
                          <h5 class="mb-0"><%=rs.getString(19) %></h5>
                        </div>
                          <div style="width: 80px;">
                          <h5 class="mb-0"><%=rs.getString(20) %></h5>
                        </div>
                        <div style="width: 80px;">
                          <h5 class="mb-0"><a href="remove_cart.jsp?id=<%=rs.getString(1)%>">Remove </a></h5>
                        </div>
                        <a href="#!" style="color: #cecece;"><i class="fas fa-trash-alt"></i></a>
                      </div>
                    </div>
                  </div>
                </div>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Quantity</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form class="px-md-2" method="post" action="product_cart_action.jsp">
      <div class="modal-body">
 		
 		<input type="text" class="form-control" required name="quant1" value="<%=rs.getString(18) %> " > 
 		<input type="hidden" class="form-control" required name="pid1" value="<%=rs.getString(17) %> " > 
 		<input type="hidden" class="form-control" required name="email1" value="<%=rs.getString(16) %> " > 
 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
      </form>
    </div>
  </div>
</div>

 <%
      }


}catch(Exception e)
{
	
}

%>        
              
   <div class="container">
      	<center>
      	<a href="paymet.jsp" class="btn btn-outline-success form-control">Total: <%out.print(total); %> / Proceed To Payment</a>  
      	
      <!-- 	<a href="checkout.html" class="btn btn-light">Proceed To Order</a>             
      	 -->
      	</center>
      </div>
               

              </div>
              
              
            

            </div>

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