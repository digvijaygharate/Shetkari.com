package com.digvijay.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digvijay.connection.DbConnection;

public class user_farmer_mess extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
			PrintWriter out=resp.getWriter();
	        
	        HttpSession session=req.getSession();
	        String email2=(String)session.getAttribute("session_email");
	        
	        String wemail2=(String)session.getAttribute("session_afemail");
	        String wsid2=(String)session.getAttribute("session_farmerid");
	        String date2=(String)session.getAttribute("session_date2");
	        String time2=(String)session.getAttribute("session_time2");
	        String status2=(String)session.getAttribute("session_status2");
	       // String status2=req.getParameter("status");
	        String mess2=req.getParameter("mess");
	        
	        Connection con=null;
	        try
	        {
	            con=DbConnection.getConnect();
	            con.setAutoCommit(false);
	            
	            PreparedStatement ps1=con.prepareStatement("update applied_farmer_user set femail=?,date2=?,time2=?, status2=?, mess2=? where farmerid=?");
	            ps1.setString(1, wemail2);
	            ps1.setString(2, date2);
	            ps1.setString(3, time2);
	            ps1.setString(4, status2);
	            ps1.setString(5, mess2);
	            ps1.setString(6, wsid2);
	            int i1=ps1.executeUpdate();
	            
	         
	            
	            if(i1>0)
	            {
	                con.commit();
	                
	                session.setAttribute("session_afemail", wemail2);
	                session.setAttribute("session_farmerid", wsid2);
	                session.setAttribute("session_date2", date2);
	                session.setAttribute("session_time2", time2);
	                session.setAttribute("session_mess2", mess2);
	                session.setAttribute("session_status2",status2);
	                
	               
	                
	                resp.sendRedirect("user_farmer_applied.jsp");
	            }
	            else
	            {
	                con.rollback();
	                
	                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
	                rd1.include(req, resp);
	                
	                RequestDispatcher rd2=req.getRequestDispatcher("user_farmer_applied.jsp");
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
