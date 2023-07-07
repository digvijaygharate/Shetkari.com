<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:scriptlet>
    String email=(String)session.getAttribute("session_wemail");
    String email1=(String)session.getAttribute("session_email");
    String femail1=(String)session.getAttribute("session_femail");
</jsp:scriptlet>

<html>
<head>
<meta charset="ISO-8859-1">
<title>WholeSalers</title>
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
                    <jsp:include page="components/wholesaler_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }else if(femail1 !=null ){
                    </jsp:scriptlet>
                            <jsp:include page="components/farmer_navbar.jsp"></jsp:include>
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
       <h5 class="section-title h1"><span style="color:#1bbd36">Our</span> <span style="color:black">WholeSaler</span></h5>
        <div class="row">
        
<jsp:scriptlet>
if(email!=null){
</jsp:scriptlet>
                      
                        <jsp:scriptlet>
                            String image, wid,wfname1, wlname1, wgender, wemail, wpassword, wcity,wabout,wexp,id;
                            try
                            {
                                Connection con=DbConnection.getConnect();
                                Connection con1=DbConnection.getConnect();
                                PreparedStatement ps=con.prepareStatement(("select * from wholesaler join about_wholesaler on wholesaler.wemail=about_wholesaler.wemail"));
                                //PreparedStatement ps1=con1.prepareStatement("select * from about_wholesaler");
                                ResultSet rs=ps.executeQuery();
                             //   ResultSet rs1=ps1.executeQuery();
                                
                                while(rs.next())
                                {
                                    wid=rs.getString("wid");
                                    wfname1=rs.getString("wfname");
                                    wlname1=rs.getString("wlname");
                                    wgender=rs.getString("wgender");
                                    wemail=rs.getString("wemail");
                                    wpassword=rs.getString("wpassword");
                                    wcity=rs.getString("wcity");
                                    wabout=rs.getString("wabout");
                                	wexp=rs.getString("wexperience");
                                	image=rs.getString("wimage");
                                	id=rs.getString("id");
                              
                                    </jsp:scriptlet>
	        <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                   
                   
             
                             <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img src="img/wholesaler/<%=image %>" class="card-img img-fluid" style="width:150px;height:150px" alt="Sorry">
                                          </p>
                                    <h4 class="card-title"><%= wfname1 %> <%= wlname1 %></h4>
                                    <p class="card-text"><%= wabout %></p>
                                    <a href="#" class="btn btn-success">Check More Details</a>
                                </div>
                            </div>
                        </div>
                         <div class="backside">
                            <div class="card">
                                <div class="card-body  mt-4">
                                    <h4 class="card-title text-center"><%= wfname1 %> <%= wlname1 %></h4>
                                    <p class="card-text text-center"><b></b> <%= wabout %></p>
                                    <p class="card-text"><b>Email : </b><%= wemail %></p>
                                     <p class="card-text"><b>Gender : </b><%= wgender %></p>
                                      <p class="card-text"><b>Business Experience :</b> <%= wexp %> Years</p>
                                      
                                      
                                       
                                    <ul class="list-inline text-center">
                                        <li class="list-inline-item">
                                            <a href="navbar_wholesaler_desc.jsp?id=<jsp:expression>wemail</jsp:expression>" class="btn btn-light">See Full Details</a>
                                        </li>
                                    
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        
                          
                       </div>
				             </div></div>
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


 <jsp:scriptlet>
}else if(femail1!=null)
{
 </jsp:scriptlet>
  <jsp:scriptlet>
                            String image, wid,wfname1, wlname1, wgender, wemail, wpassword, wcity,wabout,wexp,id;
                            try
                            {
                                Connection con=DbConnection.getConnect();
                                Connection con1=DbConnection.getConnect();
                                PreparedStatement ps=con.prepareStatement(("select * from wholesaler join about_wholesaler on wholesaler.wemail=about_wholesaler.wemail"));
                                //PreparedStatement ps1=con1.prepareStatement("select * from about_wholesaler");
                                ResultSet rs=ps.executeQuery();
                             //   ResultSet rs1=ps1.executeQuery();
                                
                                while(rs.next())
                                {
                                    wid=rs.getString("wid");
                                    wfname1=rs.getString("wfname");
                                    wlname1=rs.getString("wlname");
                                    wgender=rs.getString("wgender");
                                    wemail=rs.getString("wemail");
                                    wpassword=rs.getString("wpassword");
                                    wcity=rs.getString("wcity");
                                    wabout=rs.getString("wabout");
                                	wexp=rs.getString("wexperience");
                                	id=rs.getString("id");
                              		image=rs.getString("wimage");
                                    </jsp:scriptlet>
	        <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                   
                   
             
                             <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img src="img/wholesaler/<%=image %>" class="card-img img-fluid" style="width:150px;height:150px" alt="Sorry">
                                          </p>
                                    <h4 class="card-title"><%= wfname1 %> <%= wlname1 %></h4>
                                    <p class="card-text"><%= wabout %></p>
                                    <a href="#" class="btn btn-success">Check More Details</a>
                                </div>
                            </div>
                        </div>
                         <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title"><%= wfname1 %> <%= wlname1 %></h4>
                                    <p class="card-text"><b></b> <%= wcity %></p>
                                    <p class="card-text"><%= wabout %></p>
                                      <p class="card-text"><b>Business Experience :</b> <%= wexp %></p>
                                      
                                      
                                       
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a href="navbar_wholesaler_desc_farmer.jsp?id=<jsp:expression>wemail</jsp:expression>" class="btn btn-light">See Full Details</a>
                                        </li>
                                    
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        
                          
                       </div>
				             </div></div>
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
                    
 
 
 <jsp:scriptlet>
}else
{
 </jsp:scriptlet>
 
 
   <jsp:scriptlet>
                            String image,wid,wfname1, wlname1, wgender, wemail, wpassword, wcity,wabout,wexp,id;
                            try
                            {
                                Connection con=DbConnection.getConnect();
                                Connection con1=DbConnection.getConnect();
                                PreparedStatement ps=con.prepareStatement(("select * from wholesaler join about_wholesaler on wholesaler.wemail=about_wholesaler.wemail"));
                                //PreparedStatement ps1=con1.prepareStatement("select * from about_wholesaler");
                                ResultSet rs=ps.executeQuery();
                             //   ResultSet rs1=ps1.executeQuery();
                                
                                while(rs.next())
                                {
                                    wid=rs.getString("wid");
                                    wfname1=rs.getString("wfname");
                                    wlname1=rs.getString("wlname");
                                    wgender=rs.getString("wgender");
                                    wemail=rs.getString("wemail");
                                    wpassword=rs.getString("wpassword");
                                    wcity=rs.getString("wcity");
                                    wabout=rs.getString("wabout");
                                	wexp=rs.getString("wexperience");
                                	image=rs.getString("wimage");
                                	id=rs.getString("id");
                              
                                    </jsp:scriptlet>
	        <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                   
                   
             
                             <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img src="img/wholesaler/<%=image %>" class="card-img img-fluid" style="width:150px;height:150px" alt="Sorry">
                                    </p>      <h4 class="card-title"><%= wfname1 %> <%= wlname1 %></h4>
                                    <p class="card-text"><%= wabout %></p>
                                    <a href="#" class="btn btn-success">Check More Details</a>
                                </div>
                            </div>
                        </div>
                         <div class="backside">
                            <div class="card">
                                <div class="card-body  mt-4">
                                     <h4 class="card-title text-center"><%= wfname1 %> <%= wlname1 %></h4>
                                    <p class="card-text text-center"><b></b> <%= wabout %></p>
                                    <p class="card-text"><b>Email : </b><%= wemail %></p>
                                     <p class="card-text"><b>Gender : </b><%= wgender %></p>
                                      <p class="card-text"><b>Business Experience :</b> <%= wexp %> Years</p>
                                      
                                      
                                       
                                    <ul class="list-inline text-center">
                                        <li class="list-inline-item">
                                            <a href="navbar_wholesaler_desc_user.jsp?id=<jsp:expression>wemail</jsp:expression>" class="btn btn-light">See Full Details</a>
                                        </li>
                                    
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        
                          
                       </div>
				             </div></div>
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
                    
 
 
 <jsp:scriptlet>
}
 </jsp:scriptlet>    
 
 
                 
               
                </div>
                </div>
                </section>
              
<!-- ********************************************************************************************************************************** -->
       <%@include file="components/n_footer.jsp" %>    
<!-- ********************************************************************************************************************************** -->

</body>
</html>