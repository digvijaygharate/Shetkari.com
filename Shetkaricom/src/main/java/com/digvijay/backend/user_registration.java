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

public class user_registration extends HttpServlet
{
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String fname2=req.getParameter("ufname1");
        String lname2=req.getParameter("ulname1");
        String gender2=req.getParameter("ugender1");
        String email2=req.getParameter("uemail1");
        String pass2=req.getParameter("upass1");
        String city2=req.getParameter("ucity1");
        
        
        Connection con=null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps=con.prepareStatement("insert into register(fname,lname,gender, email, password, city) values(?,?,?,?,?,?)");
            ps.setString(1, fname2);
            ps.setString(2, lname2);
            ps.setString(3, gender2);
            ps.setString(4, email2);
            ps.setString(5, pass2);
            ps.setString(6, city2);
            int i1=ps.executeUpdate();
            
            PreparedStatement ps2=con.prepareStatement("insert into about_user(email,state, about, image) values(?,?,?,?)");
            ps2.setString(1, email2);
            ps2.setString(2, "");
            ps2.setString(3, "");
            ps2.setString(4, "");
            int i2=ps2.executeUpdate();
            
            PreparedStatement ps3=con.prepareStatement("insert into profile_pics(email, path) values(?,?)");
            ps3.setString(1, email2);
            ps3.setString(2, "profilepic.png");
            int i3=ps3.executeUpdate();
//            
            if(i1>0 && i2>0 && i3>0)
        //    if(i1>0 && i3>0)
            {
                con.commit();
                HttpSession session=req.getSession();
                session.setAttribute("session_fname", fname2);
                session.setAttribute("session_lname", lname2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_city", city2);
              
                
                session.setAttribute("session_title", "");
                session.setAttribute("session_image", "");
                session.setAttribute("session_state", "");
                
                session.setAttribute("session_profilepic", "profilepic.png");
                
                resp.sendRedirect("sucess.jsp");
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

