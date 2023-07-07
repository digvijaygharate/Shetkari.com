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
    email=(String)session.getAttribute("session_wemail");
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
       <h5 class="section-title h1"><span style="color:#1bbd36">Check</span> <span style="color:black">WholeSaler Status</span></h5>
        <div class="row">
        
        
                        <jsp:scriptlet>
                            String wsid="",wfname1, wlname1, wgender,img, wemail, wpassword, wcity,wabout,wexp,id,status;
                            try
                            {
                                Connection con=DbConnection.getConnect();
                                
                                PreparedStatement ps=con.prepareStatement("select * from applied_ws_user where wemail=?");
                                ps.setString(1, email1);
                                
                                ResultSet rs=ps.executeQuery();
                                while(rs.next())
                                {
                                    wsid=rs.getString("wsid");
                                	status=rs.getString("status1");
                                    
                                    
                                    PreparedStatement ps2=con.prepareStatement("select * from about_wholesaler where wemail=?");
                                    ps2.setString(1, wsid);
                                    ResultSet rs2=ps2.executeQuery();
                                    while(rs2.next())
                                    { 
                                    	wabout=rs2.getString("wabout");
                                     	wexp=rs2.getString("wexperience");
                                     	img=rs2.getString("wimage");
                                     	wemail=rs.getString("wemail");
                                        
                                     	
                                     	PreparedStatement ps3=con.prepareStatement("select * from wholesaler where wemail=?");
                                        ps3.setString(1, wsid);
                                        ResultSet rs3=ps3.executeQuery();
                                        while(rs3.next())
                                        { 
                                        	wfname1=rs3.getString("wfname");
                                        	wlname1=rs3.getString("wlname");
                                        	wemail=rs.getString("wemail");
                                      
                                    </jsp:scriptlet>
                        
                          <div class="col-xs-12 col-sm-6 col-md-4">
               				 <div class="image-flip" >
                   					 <div class="mainflip flip-0">
                   
                   
             
                             <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="img/wholesaler/<%= img %>" alt="card image"></p>
                                    <h4 class="card-title"><%= wfname1 %> <%= wlname1 %></h4>
                                    <p class="card-text"><%= wabout %></p>
                               <jsp:scriptlet>
                                    if(status.equals("Pending"))
                                    {
                                    </jsp:scriptlet>
                                    	 <p class="card-text" style="color: red">Request : <b><%= status %></b></p>
                                    <jsp:scriptlet>
                                    }else
                                    {
                                    	</jsp:scriptlet>
                                     <p class="card-text" style="color: green">Request : <b><%= status %></b></p>
                                    <jsp:scriptlet>
                                    }
                                    </jsp:scriptlet>
                                </div>
                            </div>
                        </div>
                         <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title"><%= wfname1 %> <%= wlname1 %></h4>
                                  
                                    <p class="card-text"><%= wabout %></p>
                                      <p class="card-text"><b>Business Experience :</b> <%= wexp %></p>
                                      
                                      
                                       
                             <jsp:scriptlet>
                                    if(status.equals("Pending"))
                                    {
                                    </jsp:scriptlet>
                                    	   <ul class="list-inline">
                                        <li class="list-inline-item">
                                        
					        			 <button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModal1" >Send Message</button>
                                        </li>
                                    
                                    </ul>
                                    <jsp:scriptlet>
                                    }else
                                    {
                                    	</jsp:scriptlet>
                                  <ul class="list-inline">
                                        <li class="list-inline-item">
                                        
					        			 <a href="chatwithwholesaler.jsp?id=<%= rs.getString(3) %>&id1=<%=rs.getString(1) %>" type="button" class="btn btn-light" >Chat With WholeSaler</a>
                                        </li>
                                    
                                    </ul>
                                    <jsp:scriptlet>
                                    }
                                    </jsp:scriptlet>
                                </div>
                            </div>
                        </div>
                        
                        
                          
                       </div>
				             </div></div>
				             

				             
				             
                        
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