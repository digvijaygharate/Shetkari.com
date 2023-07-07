package com.digvijay.backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digvijay.connection.DbConnection;

public class Delete_wholesaler_farmer_applied extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		 HttpSession session=req.getSession();
	        String email=(String) session.getAttribute("session_femail");
	        
	        String wid=req.getParameter("wid1");
	        
	        Connection con=null;
	        try
	        {
	            con=DbConnection.getConnect();
	            con.setAutoCommit(false);
	            
	            PreparedStatement ps=con.prepareStatement("delete from applied_ws_farmer where wemail5=? and wsid5=?");
	            ps.setString(1, email);
	            ps.setString(2, wid);
	            int i=ps.executeUpdate();
	            if(i>0)
	            {
	                con.commit();
	                
	                resp.sendRedirect("farmer_wholesaler_applied.jsp");
	            }
	            else
	            {
	                con.rollback();
	                
	                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
	                rd1.include(req, resp);
	                RequestDispatcher rd2=req.getRequestDispatcher("navbar_wholesaler_desc_farmer.jsp?wid="+wid);
	                rd2.include(req, resp);
	            }
	        }
	        catch(Exception e)
	        {
	            try
	            {
	                con.rollback();
	                
	                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
	                rd1.include(req, resp);
	                RequestDispatcher rd2=req.getRequestDispatcher("navbar_wholesaler_desc_farmer.jsp?wid="+wid);
	                rd2.include(req, resp);
	            }
	            catch(Exception ee)
	            {
	                ee.printStackTrace();
	            }
	            e.printStackTrace();
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

