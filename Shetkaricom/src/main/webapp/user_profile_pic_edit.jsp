<%-- 
    Document   : Profile
    Created on : 21 Nov, 2020, 4:08:36 PM
    Author     : Deepak
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.digvijay.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Smart Programming - Upload Profile Pic </title>

         <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
<!-- ********************************************************************************************************************************** -->
    
       
        
        
      <div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-3">Image Upload</p>

						<%
						String msg = (String) session.getAttribute("msg");
						if (msg != null) {
						%>
						<h4 class="text-center text-success"><%=msg%></h4>
						<%
						session.removeAttribute("msg");
						}
						%>

						<form method="post" action="upload_file" enctype="multipart/form-data">
							<div class="mb-3">
								<label>Image</label> <input type="file" name="files"
									class="form-control">
							</div>

							<div class="mb-3">
								<label>Remark</label> <input type="text" name="remark"
									class="form-control">
							</div>
							<div class="text-center">
								<button class="btn btn-primary">Upload</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>


		<table class="table mt-4">
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Ramark</th>

				</tr>
			</thead>
			<tbody>

				<%
				Connection con = DbConnection.getConnect();

				
				
				PreparedStatement ps1 = con.prepareStatement("select * from img_details");
				ResultSet rs = ps1.executeQuery();

				while (rs.next()) {
				%>
				<tr>

					<%
					if (rs.getString("img_name").endsWith(".pdf")) {
					%>

					<th scope="row"><img alt="" src="imgs/pdf.png" width="200px"
						height="100px"></th>


					<%
					} else if (rs.getString("img_name").endsWith(".xlsx")) {
					%>

					<th scope="row"><img alt="" src="imgs/xls.jpg" width="200px"
						height="100px"></th>


					<%
					} else {
					%>
					<th scope="row"><img alt=""
						src="imgs/<%=rs.getString("img_name")%>" width="200px"
						height="100px"></th>
					<%
					}
					%>




					<td><%=rs.getString("remark")%></td>

				</tr>
				<%
				}
				%>
</tbody></table></div>
    </body>
</html>
