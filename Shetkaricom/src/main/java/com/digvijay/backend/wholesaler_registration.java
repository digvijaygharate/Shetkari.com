package com.digvijay.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digvijay.connection.DbConnection;

public class wholesaler_registration extends HttpServlet
{
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String fname2=req.getParameter("wfname1");
        String lname2=req.getParameter("wlname1");
        String gender2=req.getParameter("wgender1");
        String email2=req.getParameter("wemail1");
        String pass2=req.getParameter("wpass1");
        String city2=req.getParameter("wcity1");
        
        
        Connection con=null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps=con.prepareStatement("insert into wholesaler(wfname,wlname,wgender, wemail, wpassword, wcity) values(?,?,?,?,?,?)");
            ps.setString(1, fname2);
            ps.setString(2, lname2);
            ps.setString(3, gender2);
            ps.setString(4, email2);
            ps.setString(5, pass2);
            ps.setString(6, city2);
            int i1=ps.executeUpdate();
            
            PreparedStatement ps2=con.prepareStatement("insert into about_wholesaler(wemail, wabout, wstate, wexperience, wneed, wquantity, wcompany, payment,wcategory,wimage) values(?,?,?,?,?,?,?,?,?,?)");
            ps2.setString(1, email2);
            ps2.setString(2, "");
            ps2.setString(3, "");
            ps2.setString(4, "");
            ps2.setString(5, "");
            ps2.setString(6, "");
            ps2.setString(7, "");
            ps2.setString(8, "");
            ps2.setString(9, "");
            ps2.setString(10, "");
            int i2=ps2.executeUpdate();
//            
            PreparedStatement ps3=con.prepareStatement("insert into profile_pics_w(wemail, path) values(?,?)");
            ps3.setString(1, email2);
            ps3.setString(2, "profilepic.png");
            int i3=ps3.executeUpdate();
            
            if(i1>0 && i2>0 && i3>0)
           // if(i1>0 )
            {
                con.commit();
                HttpSession session=req.getSession();
                session.setAttribute("session_wfname", fname2);
                session.setAttribute("session_wlname", lname2);
                session.setAttribute("session_wgender", gender2);
                session.setAttribute("session_wemail", email2);
                session.setAttribute("session_wcity", city2);
              
                
                session.setAttribute("session_wabout", "");
                session.setAttribute("session_wstate", "");
                session.setAttribute("session_wexp", "");
                session.setAttribute("session_wneed", "");
                session.setAttribute("session_wquantity", "");
                session.setAttribute("session_wcompany", "");
                session.setAttribute("session_wpayment", "");
                session.setAttribute("session_wcategory", "");
                session.setAttribute("session_wimage", "");
                
                session.setAttribute("session_wprofilepic", "profilepic.png");
                
                resp.sendRedirect("wholesaler_profile1.jsp");
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