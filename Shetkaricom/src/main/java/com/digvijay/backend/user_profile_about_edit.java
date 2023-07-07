package com.digvijay.backend;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.digvijay.connection.DbConnection;

@MultipartConfig
public class user_profile_about_edit extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		 PrintWriter out=resp.getWriter();
	        
	        HttpSession session=req.getSession();
	        String email2=(String)session.getAttribute("session_email");
	        
	        String fname2=req.getParameter("name1");
	        String lname2=req.getParameter("name2");
	        String city2=req.getParameter("city1");
	        String gender2=req.getParameter("gender1");
	        String title2=req.getParameter("title1");
	        String state2=req.getParameter("state1");
	        
	        Part file=req.getPart("image");
			String imageFileName=file.getSubmittedFileName();  
			String uploadPath="D:\\Jsp Eclipse\\Shetkaricom\\src\\main\\webapp\\img\\user\\"+imageFileName;  
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
	        
	        Connection con=null;
	        try
	        {
	            con=DbConnection.getConnect();
	            con.setAutoCommit(false);
	            
	            PreparedStatement ps1=con.prepareStatement("update register set fname=?,lname=?,gender=?, city=?  where email=?");
	            ps1.setString(1, fname2);
	            ps1.setString(2, lname2);
	            ps1.setString(3, gender2);
	            ps1.setString(4, city2);
	            ps1.setString(5, email2);
	            int i1=ps1.executeUpdate();
	            
	            PreparedStatement ps2=con.prepareStatement("update about_user set state=?, about=?, image=? where email=?");
	            ps2.setString(1, state2);
	            ps2.setString(2, title2);
	            ps2.setString(3, imageFileName);
	            ps2.setString(4, email2);
	            int i2=ps2.executeUpdate();
	            
	            if(i1>0 && i2>0)
	            {
	                con.commit();
	                
	                session.setAttribute("session_fname", fname2);
	                session.setAttribute("session_lname", lname2);
	                session.setAttribute("session_email", email2);
	                session.setAttribute("session_gender", gender2);
	                session.setAttribute("session_city", city2);
	                
	                session.setAttribute("session_state", state2);
	                session.setAttribute("session_title", title2);
	                session.setAttribute("session_image", imageFileName);
	                
	                resp.sendRedirect("user_profile.jsp");
	            }
	            else
	            {
	                con.rollback();
	                
	                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
	                rd1.include(req, resp);
	                
	                RequestDispatcher rd2=req.getRequestDispatcher("user_profile_about.jsp");
	                rd2.include(req, resp);
	            }
	        }
	        catch(Exception e)
	        {
	            try
	            {
	                con.rollback();
	            }
	            catch(Exception ee)
	            {
	                ee.printStackTrace();
	            }
	            out.print(e);
	        }
	        finally
	        {
	            try
	            {
	                con.close();
	            }
	            catch(Exception e)
	            {
	                e.printStackTrace();
	            }
	        }
	    
	}
}
