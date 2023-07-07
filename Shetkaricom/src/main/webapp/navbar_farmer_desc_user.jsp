<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Farmer Description</title>
<style>
@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');
#team {
    background: #eee !important;
    margin-top:20px;
}
.card {
  max-width: 40em;
  flex-direction: row;
  background-color: #696969;
  border: 0;
  box-shadow: 0 7px 7px rgba(0, 0, 0, 0.18);
  margin: 1em auto;
}
.card.dark {
  color: #fff;
}
.card.card.bg-light-subtle .card-title {
  color: dimgrey;
}

.card img {
  max-width: 25%;
  margin: auto;
  padding: 0.5em;
  border-radius: 0.7em;
}
.card-body {
  display: flex;
  justify-content: space-between;
}
.text-section {
  max-width: 60%;
}
.cta-section {
  max-width: 40%;
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  justify-content: space-between;
}
.cta-section .btn {
  padding: 0.3em 0.5em;
  /* color: #696969; */
}
.card.bg-light-subtle .cta-section .btn {
  background-color: #898989;
  border-color: #898989;
}
@media screen and (max-width: 475px) {
  .card {
    font-size: 0.9em;
  }
  
}


</style>
<%@include file="components/n_common.jsp" %>
<jsp:declaration>
	String wid1;
	 String wemail2;
</jsp:declaration>

<jsp:scriptlet>
		String email=(String)session.getAttribute("session_femail");
		wid1=request.getParameter("id");
		 String email2=(String)session.getAttribute("session_email");
		 wemail2=(String)session.getAttribute("session_wemail");
</jsp:scriptlet>

</head>
<body>
<!-- ********************************************************************************************************************************** -->
    <jsp:scriptlet>         
    if(email2 !=null )
                
                {
            </jsp:scriptlet>
                    <jsp:include page="components/user_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }else if(email !=null ){
            </jsp:scriptlet>
                    <jsp:include page="components/farmer_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }else if(wemail2 !=null ){
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

<div class="row " id="team">

                    <div class="col-md-2">
                       
                    </div>
                    <div class="col-md-8" style=" margin-top: 70px">
                    
                        <div class="row">
                        
        <h5 class="section-title h1"><span style="color:#1bbd36">Farmer</span> <span style="color:black">Details</span></h5>
      
       
						<jsp:scriptlet>
						String img="", id="",about="",fname="",lname="",gender="",email1="",city="",state="",exp="",need="",quan="",comp="",pay="";
							try
							{
								Class.forName("com.mysql.jdbc.Driver");
       							Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
								PreparedStatement ps=con.prepareStatement("select * from about_farmer where femail=?");
								PreparedStatement ps1=con.prepareStatement("select * from farmer where femail=?");
								ps.setString(1,wid1);
								ResultSet rs=ps.executeQuery();
								ps1.setString(1,wid1);
								ResultSet rs1=ps1.executeQuery();
								while((rs.next())&&(rs1.next()))
								{
									about=rs.getString("fabout");
									fname=rs1.getString("ffname");
									lname=rs1.getString("flname");
									gender=rs1.getString("fgender");
									email1=rs1.getString("femail");
									city=rs1.getString("fcity");
									state=rs.getString("fstate");
									exp=rs.getString("fexperience");
									need=rs.getString("fneed");
									quan=rs.getString("fquantity");
									comp=rs.getString("wcompany");
									pay=rs.getString("fpayment");
									img=rs1.getString("fimage");
							}
								
								
								
								
							}
							catch(Exception e)
							{
								e.printStackTrace();
								
							}
						</jsp:scriptlet>
						
							  <div class="container">
							  
					  <div class="card dark" style="color:black">
					    <img src="img/social.png" class="card-img-top" alt="...">
					      <h5 class="card-title text-center" ><%=fname %> <%=lname %> <br></h5>
					      	<p class="card-text text-center" ><%=about %> <br></p>
					    <div class="card-body">
					      <div class="text-section">
					      
					      	
					      	<p class="card-text"><b>Gender : </b><%=gender %> <br></p>
					      	<p class="card-text" ><b>Email : </b><%=email1 %> <br></p>
					      	<p class="card-text" ><b>Company Name :</b> <%=comp %> <br></p>
					      	<p class="card-text" ><b>City :</b> <%=city %> <br></p>
					      	<p class="card-text" ><b>State :</b> <%=state %> <br></p>
					      	<p class="card-text" ><b>Business Experience :</b> <%=exp %> <br></p>
					      	<p class="card-text"><b>Crop Needs :</b> <%=need %> <br></p>
					      	<p class="card-text" ><b>Crop Quantity :</b> <%= quan%> <br></p>
					      	<p class="card-text"><b>Payment Mode :</b> <%=pay %> <br></p>
					      
					      </div>
					      
					       <jsp:scriptlet>
                                    if ( email2==null)  {
                                   
                            </jsp:scriptlet>
                            
					      <div class="cta-section">
					        <div></div>
					        <a href="login_first.jsp" class="btn btn-light">Login to apply</a>
					      </div>
					             <jsp:scriptlet>
                                    
                                    } else {
                                        Connection con1=null;
                                        try
                                        {
                                            con1=DbConnection.getConnect();
                                            PreparedStatement ps1=con1.prepareStatement("select * from applied_farmer_user where femail=? and farmerid=?");
                                            ps1.setString(1, email2);
                                            ps1.setString(2, wid1);
                                            ResultSet rs1=ps1.executeQuery();
                                            if(rs1.next())
                                            {
                                                </jsp:scriptlet>
					             
					             
						      <div class="cta-section">
						        <div></div>
						       <br>
						           <form action="Delete_farmer_user_applied" method="post">
						           <center><span style="color: red"> Already Contact With Wholesaler </span></center>  
                                        <input type="hidden" value="<jsp:expression>wid1</jsp:expression>" name="wid1" />
                                      <center>  <input type="submit" value="Delete this Application" class="btn btn-danger" /></center>
                                    </form>
						      </div>  
					             
					             
					              <jsp:scriptlet>
                                            }
                                            else
                                            {
                                                </jsp:scriptlet>
                                                
					             
					             <div class="cta-section">
						        <div></div>
						       
						           <form action="apply_for_farmer_user" method="post">
                                        <input type="hidden" value="<jsp:expression>wid1</jsp:expression>" name="wid1" />
                                        <input type="submit" value="Apply" class="btn btn-danger" />
                                    </form>
						      </div>  
					             
					             <jsp:scriptlet>
                                            }
                                        }
                                        catch(Exception e)
                                        {
                                            e.printStackTrace();
                                        }
                            </jsp:scriptlet>
                            
                            <jsp:scriptlet>
                }
                                    
                            </jsp:scriptlet>
					      
					      
					    </div>
					  </div>
					
							
					
					 </div>
                    </div>
                    <div class="col-md-2">
                      
                    </div>
                </div>
                </div>
<!-- ********************************************************************************************************************************** -->
        <%@include  file="components/n_footer.jsp" %>
<!-- ********************************************************************************************************************************** -->
               

</body>
</html>