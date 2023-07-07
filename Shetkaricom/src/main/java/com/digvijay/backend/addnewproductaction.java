package com.digvijay.backend;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.digvijay.connection.DbConnection;

@MultipartConfig
public class addnewproductaction extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		resp.setContentType("text/html");
	   PrintWriter out=resp.getWriter();
	   HttpSession session=req.getSession();
	   String email=(String)session.getAttribute("session_femail");  
	   
		String id=req.getParameter("pid");
		String name=req.getParameter("pname");
		String cat=req.getParameter("pcategory");
		String about=req.getParameter("pabout");
		String pay=req.getParameter("ppayment");
		
		String uquan=req.getParameter("puquantity");
		String uunit=req.getParameter("puunit");
		String uprice=req.getParameter("puprice");
		String uactive=req.getParameter("puactive");
		
		String wquan=req.getParameter("pwquantity");
		String wunit=req.getParameter("pwunit");
		String wprice=req.getParameter("pwprice");
		String wactive=req.getParameter("pwactive");
		
		
		Part file=req.getPart("image");
		String imageFileName=file.getSubmittedFileName();  
		String uploadPath="D:\\Jsp Eclipse\\Shetkaricom\\src\\main\\webapp\\img\\products\\"+imageFileName;  
		try
		{

		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();

		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();

		}

		catch(Exception e)
		{
			e.printStackTrace();
		}


		try
		{
			Connection con=DbConnection.getConnect();
			PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, cat);
			ps.setString(4, uprice);
			ps.setString(5,uquan);
			ps.setString(6, uunit);
			ps.setString(7, uactive);
			ps.setString(8, wprice);
			ps.setString(9,wquan);
			ps.setString(10, wunit);
			ps.setString(11, wactive);
			ps.setString(12, about);
			ps.setString(13, pay);
			ps.setString(14,imageFileName);
			ps.setString(15, email);
			ps.executeUpdate();
			resp.sendRedirect("farmer_profile.jsp?msg=done");
					
		}
		catch(Exception e)
		{
			System.out.print(e);
			resp.sendRedirect("farmer_profile.jsp?msg=fail");
			
		}
		
	}
}
