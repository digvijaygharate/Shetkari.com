package com.digvijay.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digvijay.connection.DbConnection;

public class apply_for_farmer_user extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String mess=req.getParameter("mess");
		
		HttpSession session=req.getSession();
        String email=(String) session.getAttribute("session_email");
        
        String wid=req.getParameter("wid1");
        
        Date d=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("dd-MM-yyyy");
        String date1=sdf1.format(d);
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        String time1=sdf2.format(d);
        String status1="Pending";
        Connection con=null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps=con.prepareStatement("insert into applied_farmer_user(femail, farmerid, date2, time2, status2, mess2) values(?,?,?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, wid);
            ps.setString(3, date1);
            ps.setString(4, time1);
            ps.setString(5, status1);
            ps.setString(6, mess);
            
     
           
            
            int i=ps.executeUpdate();
            if(i>0)
            {
                con.commit();
                session.setAttribute("session_afemail", email);
                session.setAttribute("session_farmerid", wid);
                session.setAttribute("session_date2", date1);
                session.setAttribute("session_time2", time1);
                session.setAttribute("session_mess2", mess);
                session.setAttribute("session_status2",status1);
                
                
//                
//                RequestDispatcher rd1=req.getRequestDispatcher("ws_success_applied.jsp");
//                rd1.include(req, resp);
                RequestDispatcher rd2=req.getRequestDispatcher("user_farmer_applied.jsp?wid="+wid);
                rd2.include(req, resp);
            }
            else
            {
                con.rollback();
                
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                RequestDispatcher rd2=req.getRequestDispatcher("navbar_farmer_desc_user.jsp?wid="+wid);
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
                RequestDispatcher rd2=req.getRequestDispatcher("navbar_farmer_desc_user.jsp?wid="+wid);
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


