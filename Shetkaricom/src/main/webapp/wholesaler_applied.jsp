<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:declaration>
String email;
</jsp:declaration>
<jsp:scriptlet>
	String wemail1=(String)session.getAttribute("session_wemail");
    email=(String)session.getAttribute("session_femail");
    String email1=(String)session.getAttribute("session_email");
</jsp:scriptlet>

<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
   <%@include file="components/n_common.jsp" %>
<style>

@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');
#team {
    background: #eee !important;
    margin-top:75px;
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
    margin-bottom: 50px;
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
    color: #007b5e !important;
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
                    <jsp:include page="components/farmer_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }else if(wemail1 !=null ){
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
       <h5 class="section-title h1"><span style="color:#1bbd36">Appiled</span> <span style="color:black">Farmer</span></h5>
      
        <div class="row">
        
        
                        <jsp:scriptlet>
                            String wsid="",wfname1, wlname1, wgender, wemail, wpassword, wcity,wabout,wexp,id,status,image;
                            try
                            {
                                Connection con=DbConnection.getConnect();
                                
                                PreparedStatement ps=con.prepareStatement("select * from applied_farmer_wholesaler where femail1=?");
                                ps.setString(1, wemail1);
                                
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    wsid=rs.getString("farmerid1");
                                	status=rs.getString("status3");
                                    
                                    
                                    PreparedStatement ps2=con.prepareStatement("select * from about_farmer where femail=?");
                                    ps2.setString(1, wsid);
                                    ResultSet rs2=ps2.executeQuery();
                                    while(rs2.next())
                                    { 
                                    	wabout=rs2.getString("fabout");
                                     	wexp=rs2.getString("fexperience");
                                     	image=rs2.getString("fimage");
                                        wemail=rs.getString("femail1");
                                        
                                     	PreparedStatement ps3=con.prepareStatement("select * from farmer where femail=?");
                                        ps3.setString(1, wsid);
                                        ResultSet rs3=ps3.executeQuery();
                                        while(rs3.next())
                                        { 
                                        	wfname1=rs3.getString("ffname");
                                        	wlname1=rs3.getString("flname");
                                        	wemail=rs.getString("femail1");
                                      
                                    </jsp:scriptlet>
                        
                          <div class="col-xs-12 col-sm-6 col-md-4">
               				 <div class="image-flip" >
                   					 <div class="mainflip flip-0">
                   
                   
             
                             <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                   <p><img src="img/farmer/<%=image %>" class="card-img img-fluid" style="width:150px;height:150px" alt="Sorry">
                                            </p>
                                    <h4 class="card-title"><%= wfname1 %> <%= wlname1 %></h4>
                                    <p class="card-text"><%= wabout %></p>
                                    <a href="https://www.fiverr.com/share/qb8D02" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                                </div>
                            </div>
                        </div>
                         <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title"><%= wfname1 %> <%= wlname1 %></h4>
                                  
                                    <p class="card-text"><%= wabout %></p>
                                      <p class="card-text"><b>Business Experience :</b> <%= wexp %></p>
                                      
                                      
                                       
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                        <button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModal">Check Status</button>
					        			 <button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModal1" >Send Message</button>
                                        </li>
                                    
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        
                          
                       </div>
				             </div></div>
				             
<!-- Modals -->				             
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Please Check Status</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form class="px-md-2" method="post" action="apply_for_wholesaler_user">
      <div class="modal-body">
        <p>Requested Wholesaler Status : <b><%= status %></b></p>
      </div>
      <div class="modal-footer">
       <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
       
      </div>
      </form>
    </div>
  </div>
</div>
				             
				             
                        
                        <jsp:scriptlet>
                                        }
                                    }
                                }
                            }
                            catch(Exception e)
                            {
                                out.print(e);
                            }
                        </jsp:scriptlet>
                            
                        
                    <div class="col-md-2">
                      
                    </div>
                    </div>
                    </div>
                    </section>


<!-- ********************************************************************************************************************************** -->
<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Send Meassage To WholeSaler</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form class="px-md-2" method="post" action="user_wholesaler_mess">
      <div class="modal-body">
       
        <textarea maxlength="500" style="height: 200px" name="mess" class="form-control"></textarea>
   
      
      
      </div>
    
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-success" data-dismiss="modal">Close</button>
          	<button type="submit" class="btn btn-outline-success">Submit</button>
      </div>
      </form>
    </div>
  </div>
</div>
			    <%@include file="components/n_footer.jsp" %>    
</body>
</html>