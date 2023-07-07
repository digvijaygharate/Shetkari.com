<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<jsp:scriptlet>
	String wemail1=(String)session.getAttribute("session_wemail");
    String email=(String)session.getAttribute("session_femail");
    String email1=(String)session.getAttribute("session_email");
</jsp:scriptlet>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');
#team {
    background: #eee !important;
}

.btn-primary:hover,
.btn-primary:focus {
    background-color: #108d6f;
    border-color: #108d6f;
    box-shadow: none;
    outline: none;
}

.btn-primary {
    color: #fff;
    background-color: #007b5e;
    border-color: #007b5e;
}

section {
    padding: 60px 0;
}

section .section-title {
    text-align: center;
    color: #007b5e;
    margin-top: 80px;
    text-transform: uppercase;
}

#team .card {
    border: none;
    background: #ffffff;
}

.image-flip:hover .backside,
.image-flip.hover .backside {
    -webkit-transform: rotateY(0deg);
    -moz-transform: rotateY(0deg);
    -o-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    transform: rotateY(0deg);
    border-radius: .25rem;
}

.image-flip:hover .frontside,
.image-flip.hover .frontside {
    -webkit-transform: rotateY(180deg);
    -moz-transform: rotateY(180deg);
    -o-transform: rotateY(180deg);
    transform: rotateY(180deg);
}

.mainflip {
    -webkit-transition: 1s;
    -webkit-transform-style: preserve-3d;
    -ms-transition: 1s;
    -moz-transition: 1s;
    -moz-transform: perspective(1000px);
    -moz-transform-style: preserve-3d;
    -ms-transform-style: preserve-3d;
    transition: 1s;
    transform-style: preserve-3d;
    position: relative;
}

.frontside {
    position: relative;
    -webkit-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    z-index: 2;
    margin-bottom: 30px;
}

.backside {
    position: absolute;
    top: 0;
    left: 0;
    background: white;
    -webkit-transform: rotateY(-180deg);
    -moz-transform: rotateY(-180deg);
    -o-transform: rotateY(-180deg);
    -ms-transform: rotateY(-180deg);
    transform: rotateY(-180deg);
    -webkit-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
    -moz-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
    box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
}

.frontside,
.backside {
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    backface-visibility: hidden;
    -webkit-transition: 1s;
    -webkit-transform-style: preserve-3d;
    -moz-transition: 1s;
    -moz-transform-style: preserve-3d;
    -o-transition: 1s;
    -o-transform-style: preserve-3d;
    -ms-transition: 1s;
    -ms-transform-style: preserve-3d;
    transition: 1s;
    transform-style: preserve-3d;
}

.frontside .card,
.backside .card {
    min-height: 312px;
}

.backside .card a {
    font-size: 18px;
    color: #007b5e !important;
}

.frontside .card .card-title,
.backside .card .card-title {
    color: #1bbd36 !important;
}

.frontside .card .card-body img {
    width: 120px;
    height: 120px;
    border-radius: 50%;
}

#hero {
  width: 100%;
  height: 50vh;
  background: url("images/login_signin.jpg") top center;
  background-size: cover;
  position: relative;
  background-image: url("img/farmer1.jpg");
  

}
.icon-green
{
	
	color:#1bbd36;
	
}  

</style>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@include file="components/n_common.jsp" %>
</head>
<body>
<!-- ********************************************************************************************************************************** -->
     <jsp:scriptlet>         
    if(email1 !=null )
                
                {
            </jsp:scriptlet>
                    <jsp:include page="components/user_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }else if(email !=null ){
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
<section id="team" class="pb-5">
    <div class="container">
        <h5 class="section-title h1"><span style="color:#1bbd36">Check</span> <span style="color:black">Bidding Product's</span></h5>
      
        <div class="row">
        
        <%
        String femail=(String)session.getAttribute("session_femail");
        %>
        <jsp:scriptlet>
        
                            String wid,wfname1, wlname1, wgender, wemail, wpassword, wcity,wabout,wexp,id,image;
                            try
                            {
                                Connection con=DbConnection.getConnect();
                                
                                PreparedStatement ps=con.prepareStatement(("select * from product where Email=?"));
                                ps.setString(1,email);
                                //PreparedStatement ps1=con1.prepareStatement("select * from about_wholesaler");
                                ResultSet rs=ps.executeQuery();
                             //   ResultSet rs1=ps1.executeQuery();
                                
                                while(rs.next())
                                {
                                  
                              
                                    </jsp:scriptlet>
        
        

	        <div class="col-xs-12 col-sm-6 col-md-4">
                   
             
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img src="img/products/<%= rs.getString(14) %>" class="card-img img-fluid" style="width:200px;height:200px" alt="Sorry">
                                            </p>
                                    <h4 class="card-title"><%=rs.getString(2) %></h4>
                                    <p class="card-text"><%=rs.getString(7) %></p>
                                  	
                                     <a href="navbar_bidding_farmer_desc.jsp?id=<%=rs.getString(15) %>&pid=<%=rs.getString(1) %>" class="btn btn-success">Check Bidding</a>
                                       
                                </div>
                            </div>
                        </div>
           
				            </div>
                   
                   
                    <jsp:scriptlet>
                                }
                            
                            }
                            catch(Exception e)
                            {
                                e.printStackTrace();
                            }
                        </jsp:scriptlet>
                            

               
                    <div class="col-md-2">
                      
                    </div>

             </div></div></section>

  <%@include file="components/n_footer.jsp" %> 

</body>
</html>