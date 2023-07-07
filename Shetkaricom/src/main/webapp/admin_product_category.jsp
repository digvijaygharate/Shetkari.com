<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product Category</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
        
        #hero {
  width: 100%;
  height: 100vh;

  background-size: cover;
  position: relative;
  background-color: #eee !important;
  }
#rcorners1 {
  border-radius: 25px;
  background: #73AD21;
  padding: 20px;
  width: 700px;
  height: 350px;
 
}
        </style>
    </head>

    <body id="hero">
        <div class="vh-100 d-flex justify-content-center align-items-center " >
            <div style="background-color :white; padding:15px; " id="rcorners1" >
                <div class="mb-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="text-success" width="75" height="75"
                        fill="green" class="bi bi-check-circle-fill" style="margin-top:40px;"viewBox="0 0 16 16">
                        <path
                            d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
                    </svg>
                </div>
                <div class="text-center">
                    <h1>Add Product Category </h1>
                    <%
							int pid=1;
							try
							{
								Connection con=DbConnection.getConnect();
								Statement s=con.createStatement();
								ResultSet rs=s.executeQuery("select * from category");
								while(rs.next())
								{
									pid=rs.getInt(1);
									pid=pid+1000;
								}
							}
							catch(Exception e)
							{
								
							}
					%>
                   <form action="addnewcategoryaction.jsp" method="post" >
										<input type="hidden" name="id" value="<% out.print(pid); %>">
						<div class="row">
						
						
							
							
							 
								
								  
								  	<center><input type="text" class="form-control"  name="pname" required  ></center>
								<br>
								<br>
							
							
								<div>
							<button class="btn btn-primary">Add</button>
							<button class="btn btn-light">Cancel</button>
						</div>
								</div>
								</form>
               
                </div>
                
                
                
                
                
            </div>
 </div>
 
 
 
  <div class="vh-10 d-flex justify-content-center align-items-center " style="margin-bottom:50px" >
            <div style="background-color :white; padding:15px; " id="rcorners1" >
                <div class="mb-4 text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="text-success" width="75" height="75"
                        fill="green" class="bi bi-check-circle-fill" style="margin-top:40px;"viewBox="0 0 16 16">
                        <path
                            d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
                    </svg>
                </div>
                <div class="text-center">
                    <h1>All Product Category </h1>
                    <%
							//int pid=1;
							try
							{
								Connection con=DbConnection.getConnect();
								Statement s=con.createStatement();
								ResultSet rs=s.executeQuery("select * from category");
								%>
									
							
			
                  
						
						<select>
						<%
							while(rs.next())
								{
								%>	
						<option><%=rs.getString(2) %></option>
						<%
						}
						 %>
						</select>
							
							
							 
								
								  
								  	<%
							}
							catch(Exception e)
							{
								
							}
							%>	
               
                </div>
                
                
                
                
                
            </div>
 </div>
 
 
     </body>

</html>