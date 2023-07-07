<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:scriptlet>
    String email=(String)session.getAttribute("session_wemail");
</jsp:scriptlet>

<html>
<head>
<meta charset="ISO-8859-1">
<title>WholeSalers</title>
<style>

.card {
  max-width: 40em;
  flex-direction: row;
  background-color: #696969;
  border: 0;
  box-shadow: 0 7px 7px rgba(0, 0, 0, 0.18);
  margin: 3em auto;
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

#hero {
  width: 100%;
  height: 50vh;
  background: url("images/login_signin.jpg") top center;
  background-size: cover;
  position: relative;
  background-image: url("img/farmer1.jpg");
}

</style>
<%@include file="components/common_css_js.jsp" %>

</head>
<body>
<!-- ********************************************************************************************************************************** -->
       <jsp:scriptlet>
                if(email == null ? email == null : email.trim().equals("null"))
                {
            </jsp:scriptlet>
                <jsp:include page="components/navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }
                else
                {
            </jsp:scriptlet>
                    <jsp:include page="components/wholesaler_navbar.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
<!-- ********************************************************************************************************************************** -->

  <div class="row ">
                    <div class="col-md-2">
                       
                    </div>
                    <div class="col-md-8" style=" margin-top: 10px">
                        <div class="row">
                        <jsp:scriptlet>
                            String wid,wfname1, wlname1, wgender, wemail, wpassword, wcity,wabout,wexp,id;
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
                              
                                    </jsp:scriptlet>
	           <div class="container " >
					  <div class="card dark"style="background-color:green" >
					    <img src="img/social.png" class="card-img-top" alt="...">
					    <div class="card-body">
					      <div class="text-section">
					        <h5 class="card-title"><%=wfname1 %> <%=wlname1 %><br></h5>
					        <p class="card-text" > <%= wabout %></p>
					         <p class="card-text" >Business Experience : <%= wexp %></p>
					      </div>
					      <div class="cta-section">
					        <div></div>
					        <a href="navbar_wholesaler_desc.jsp?id=<jsp:expression>wemail</jsp:expression>" class="btn btn-light">See Full Details</a>
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
                            
                        </div>
                    </div>
                    <div class="col-md-2">
                      
                    </div>
                </div>
                </div>
<!-- ********************************************************************************************************************************** -->
           
<!-- ********************************************************************************************************************************** -->

</body>
</html>