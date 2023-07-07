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

public class wholesaler_data_edit extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		PrintWriter out=resp.getWriter();
        
        HttpSession session=req.getSession();
        String email2=(String)session.getAttribute("session_email");
        
        String wemail2=(String)session.getAttribute("session_awemail");
        String wsid2=(String)session.getAttribute("session_wsid");
        String date2=(String)session.getAttribute("session_date1");
        String time2=(String)session.getAttribute("session_time1");
        //String status2=(String)session.getAttribute("session_status1");
        String status2=req.getParameter("status");
        String mess2=(String)session.getAttribute("session_mess");
        
        Connection con=null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps1=con.prepareStatement("update applied_ws_user set wsid=?,date1=?,time1=?, status1=?, mess=? where wemail=?");
            ps1.setString(1, wsid2);
            ps1.setString(2, date2);
            ps1.setString(3, time2);
            ps1.setString(4, status2);
            ps1.setString(5, mess2);
            ps1.setString(6, wemail2);
            int i1=ps1.executeUpdate();
            
         
            
            if(i1>0)
            {
                con.commit();
                
                session.setAttribute("session_awemail", wemail2);
                session.setAttribute("session_wsid", wsid2);
                session.setAttribute("session_date1", date2);
                session.setAttribute("session_time1", time2);
                session.setAttribute("session_mess", mess2);
                session.setAttribute("session_status1",status2);
                
               
                
                resp.sendRedirect("user_wholesaler_applied.jsp");
            }
            else
            {
                con.rollback();
                
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("wholesaler_data.jsp");
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
