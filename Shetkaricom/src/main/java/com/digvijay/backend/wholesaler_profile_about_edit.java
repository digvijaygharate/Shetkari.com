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
public class wholesaler_profile_about_edit extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		 PrintWriter out=resp.getWriter();
	        
	        HttpSession session=req.getSession();
	        String email2=(String)session.getAttribute("session_wemail");
	        
	        String fname2=req.getParameter("name1");
	        String lname2=req.getParameter("name2");
	        String city2=req.getParameter("city1");
	        String gender2=req.getParameter("gender1");
	        String about2=req.getParameter("about1");
	        String state2=req.getParameter("state1");
	        String exp2=req.getParameter("exp1");
	        String need2=req.getParameter("need1");
	        String quan2=req.getParameter("quan1");
	        String company2=req.getParameter("company1");
	        String payment2=req.getParameter("payment1");
	        String category2=req.getParameter("category1");
	        
	        
	        Part file=req.getPart("image1");
			String imageFileName=file.getSubmittedFileName();  
			String uploadPath="D:\\Jsp Eclipse\\Shetkaricom\\src\\main\\webapp\\img\\wholesaler\\"+imageFileName;  
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
	            
	            PreparedStatement ps1=con.prepareStatement("update wholesaler set wfname=?,wlname=?,wgender=?, wcity=?  where wemail=?");
	            ps1.setString(1, fname2);
	            ps1.setString(2, lname2);
	            ps1.setString(3, gender2);
	            ps1.setString(4, city2);
	            ps1.setString(5, email2);
	            int i1=ps1.executeUpdate();
	            
	            PreparedStatement ps2=con.prepareStatement("update about_wholesaler set wabout=?, wstate=?, wexperience=?, wneed=?, wquantity=?, wcompany=?, payment=?, wcategory=?,wimage=? where wemail=?");
	            ps2.setString(1, about2);
	            ps2.setString(2, state2);
	            ps2.setString(3, exp2);
	            ps2.setString(4, need2);
	            ps2.setString(5, quan2);
	            ps2.setString(6, company2);
	            ps2.setString(7, payment2);
	            ps2.setString(8, category2);
	            ps2.setString(9, imageFileName);
	            ps2.setString(10, email2);
	            int i2=ps2.executeUpdate();
	            
	            if(i1>0 && i2>0)
	            {
	                con.commit();
	                
	                session.setAttribute("session_wfname", fname2);
	                session.setAttribute("session_wlname", lname2);
	                session.setAttribute("session_wemail", email2);
	                session.setAttribute("session_wgender", gender2);
	                session.setAttribute("session_wcity", city2);
	                
	                session.setAttribute("session_wabout", about2);
	                session.setAttribute("session_wstate",state2);
	                session.setAttribute("session_wexp",exp2);
	                session.setAttribute("session_wneed",need2);
	                session.setAttribute("session_wquantity",quan2);
	                session.setAttribute("session_wcompany", company2);
	                session.setAttribute("session_wpayment", payment2);
	                session.setAttribute("session_wcategory", category2);
	                session.setAttribute("session_wimage", imageFileName);
	                
	                resp.sendRedirect("wholesaler_profile1.jsp");
	            }
	            else
	            {
	                con.rollback();
	                
	                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
	                rd1.include(req, resp);
	                
	                RequestDispatcher rd2=req.getRequestDispatcher("wholesaler_profile1.jsp");
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
