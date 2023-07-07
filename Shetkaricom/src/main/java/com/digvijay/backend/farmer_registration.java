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
public class farmer_registration extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		 resp.setContentType("text/html");
	        PrintWriter out=resp.getWriter();
	        
	        String fname2=req.getParameter("ffname1");
	        String lname2=req.getParameter("flname1");
	        String gender2=req.getParameter("fgender1");
	        String email2=req.getParameter("femail1");
	        String pass2=req.getParameter("fpass1");
	        String city2=req.getParameter("fcity1");
	        
//	        Part file=req.getPart("image");
//			String imageFileName=file.getSubmittedFileName();  
//			String uploadPath="D:\\Jsp Eclipse\\Shetkaricom\\src\\main\\webapp\\img\\farmer\\"+imageFileName;  
//			try
//			{
//
//			FileOutputStream fos=new FileOutputStream(uploadPath);
//			InputStream is=file.getInputStream();
//
//			byte[] data=new byte[is.available()];
//			is.read(data);
//			fos.write(data);
//			fos.close();
//
//			}
//
//			catch(Exception e)
//			{
//				e.printStackTrace();
//			}
//			
			
	        Connection con=null;
	        try
	        {
	            con=DbConnection.getConnect();
	            con.setAutoCommit(false);
	            
	            PreparedStatement ps=con.prepareStatement("insert into farmer(ffname,flname,fgender, femail, fpassword, fcity) values(?,?,?,?,?,?)");
	            ps.setString(1, fname2);
	            ps.setString(2, lname2);
	            ps.setString(3, gender2);
	            ps.setString(4, email2);
	            ps.setString(5, pass2);
	            ps.setString(6, city2);
	            int i1=ps.executeUpdate();
	            
	            PreparedStatement ps2=con.prepareStatement("insert into about_farmer(femail, fabout, fstate, fexperience, favailable, fquantity,funit, fpayment,fimage) values(?,?,?,?,?,?,?,?,?)");
	            ps2.setString(1, email2);
	            ps2.setString(2, "");
	            ps2.setString(3, "");
	            ps2.setString(4, "");
	            ps2.setString(5, "");
	            ps2.setString(6, "");
	            ps2.setString(7, "");
	            ps2.setString(8, "");
	            ps2.setString(9, "");
	            int i2=ps2.executeUpdate();
//	            
//	            PreparedStatement ps3=con.prepareStatement("insert into profile_pics_w(wemail, path) values(?,?)");
//	            ps3.setString(1, email2);
//	            ps3.setString(2, "profilepic.png");
//	            int i3=ps3.executeUpdate();
//	            
	            if(i1>0 && i2>0 )
//	            if(i1>0 )
	            {
	                con.commit();
	                HttpSession session=req.getSession();
	                session.setAttribute("session_ffname", fname2);
	                session.setAttribute("session_flname", lname2);
	                session.setAttribute("session_fgender", gender2);
	                session.setAttribute("session_femail", email2);
	                session.setAttribute("session_fcity", city2);
	               // session.setAttribute("session_fimage", imageFileName);
	              
	                
	                session.setAttribute("session_fabout", "");
	                session.setAttribute("session_fstate", "");
	                session.setAttribute("session_fexp", "");
	                session.setAttribute("session_favailable", "");
	                session.setAttribute("session_fquantity", "");
	                session.setAttribute("session_fpayment", "");
	                session.setAttribute("session_fimage", "");
	                session.setAttribute("session_funit", "");
	                
	                session.setAttribute("session_fprofilepic", "profilepic.png");
	                
	                resp.sendRedirect("farmer_profile.jsp");
	            }
	            else
	            {
	                con.rollback();
	                out.println("Failed");
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
