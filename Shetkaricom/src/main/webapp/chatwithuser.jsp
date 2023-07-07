<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<jsp:declaration>
	String id5,id1;
</jsp:declaration>

<jsp:scriptlet>
	String wemail1=(String)session.getAttribute("session_wemail");
    String email=(String)session.getAttribute("session_femail");
    String email1=(String)session.getAttribute("session_email");
    
    id5=request.getParameter("id");
    id1=request.getParameter("id1");
    //pid5=request.getParameter("pid");
</jsp:scriptlet>
<style>
.gradient-custom-2 {
/* fallback for old browsers */
background: #eee !important;

/* Chrome 10-25, Safari 5.1-6 */
background: -webkit-linear-gradient(to right, rgba(251, 194, 235, 1), rgba(166, 193, 238, 1));

/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
background: linear-gradient(to right, rgba(251, 194, 235, 1), rgba(166, 193, 238, 1))
}

</style>
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


<section class="h-100 gradient-custom-2">
  <div class="container-fluid py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-lg-9 col-xl-7">
    
        
            
        <div class="p-4" style="background-color: #f8f9fa;">
            
			          <%
       try{
       		Connection con=DbConnection.getConnect();
       		//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shetkaricom","root","root");
       		PreparedStatement ps3=con.prepareStatement("select * from farmerchat where receiver=?");
			ps3.setString(1, id1);
       		ResultSet rs3=ps3.executeQuery();
       		while(rs3.next())
       		{
       %>
			       
			          
			         
			          
			              <%
			              String a=rs3.getString(1);
			    	if(email.equals(a))
			    	{
			    		%>
			    
			    	  <div class="d-flex justify-content-between">
				              <p class="small mb-1">You</p>
				              <p class="small mb-1 text-muted"></p>
				            </div>
				            <div class="d-flex flex-row justify-content-start">
				              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava5-bg.webp"
				                alt="avatar 1" style="width: 45px; height: 100%;">
				              <div>
				                <p class="small p-2 ms-3 mb-3 rounded-3" style="background-color: #f5f6f7;">
				                <%= rs3.getString(2) %>
				                </p>
				              </div>
				            </div>
            
			    <%
			    	}else{
			    
			    %>  
			       
			    	<div class="d-flex justify-content-between">
			              <p class="small mb-1 text-muted"></p>
			              <p class="small mb-1"><a href="navbar_wholesaler_desc_farmer.jsp?id=<%= rs3.getString(1) %>" ><%= rs3.getString(1) %></a></p>
			            </div>
			            <div class="d-flex flex-row justify-content-end mb-4 pt-1">
			              <div>
			                <p class="small p-2 me-3 mb-3 text-white rounded-3 bg-warning"><%= rs3.getString(2) %></p>
			              </div>
			              <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6-bg.webp"
			                alt="avatar 1" style="width: 45px; height: 100%;">
			            </div>
			       <%
			    	}
			       %>
			          
			          
			        
			     <%}
       }
       		catch(Exception e)
       {
       			System.out.println(e);
       }
       		
       		%> 
			    
			 
			 
			 
			 
			 <form action="chatwithuseraction.jsp" method="post">
			 	<div class="input-group mb-3">
					  <input type="hidden" name="id" value="<% out.print(email); %>">
					  <input type="hidden" value="<jsp:expression>id5</jsp:expression>" name="id5" />
						<input type="hidden" value="<jsp:expression>id1</jsp:expression>" name="id1" />
					  <input type="text" class="form-control" name="mess1" required placeholder="Type text here..."  aria-describedby="basic-addon1">
						<div class="input-group-prepend">
					   	 <button class="input-group-text " id="basic-addon1" >Send &nbsp;  <i class="fa fa-send-o"></i> </button>
					  	</div>
					  
				</div>
			 </form>
			  </div>
			   
			          
          </div>
        </div>
        
   
        
        
        
      </div>
    </div>
  </div>
</section>
  <%@include file="components/n_footer.jsp" %> 
</body>
</html>