package com.digvijay.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digvijay.connection.DbConnection;

public class admin_login extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String email2=req.getParameter("ulemail");
        String pass2=req.getParameter("ulpass");
        
        String fname2="", lname2="",gender2="", city2="";
        
        Connection con = null;
        try
        {
            con=DbConnection.getConnect();
            
            PreparedStatement ps=con.prepareStatement("select * from admin where email=? and pass=?");
            ps.setString(1, email2);
            ps.setString(2, pass2);
         //   PreparedStatement ps1=con.prepareStatement("select * from register where email='admin@gmail.com' and password='admin'");
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
               // fname2=rs.getString("fname");
               // lname2=rs.getString("lname");
               // gender2=rs.getString("gender");
                //city2=rs.getString("city");
                
//                HttpSession session=req.getSession();
//                session.setAttribute("session_fname", fname2);
//                session.setAttribute("session_lname", lname2);
//                session.setAttribute("session_email", email2);
//                session.setAttribute("session_gender", gender2);
//                session.setAttribute("session_city", city2);
                
//                String state="", title="", image="";
//                PreparedStatement ps2=con.prepareStatement("select * from about_user where email=?");
//                ps2.setString(1, email2);
//                ResultSet rs2=ps2.executeQuery();
//                while(rs2.next())
//                {
//                	state=rs2.getString("state");
//                    title=rs2.getString("about");
//                    image=rs2.getString("image");
//                }
//                
//                session.setAttribute("session_title", title);
//                session.setAttribute("session_state", state);
//                session.setAttribute("session_image", image);
////                
//                String filename="";
//                PreparedStatement ps3=con.prepareStatement("select * from profile_pics where email=?");
//                ps3.setString(1, email2);
//                ResultSet rs3=ps3.executeQuery();
//                while(rs3.next())
//                {
//                    filename=rs3.getString("path");
//                }
//                session.setAttribute("session_profilepic", filename);
//                
               resp.sendRedirect("admin.jsp");
            }
            else
            {
                //resp.sendRedirect("login.jsp");
                RequestDispatcher rd1=req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("menubar.jsp");
                rd2.include(req, resp);
                
                RequestDispatcher rd3=req.getRequestDispatcher("loginerror.jsp");
                rd3.include(req, resp);
                
                RequestDispatcher rd4=req.getRequestDispatcher("logindiv.jsp");
                rd4.include(req, resp);
                
                RequestDispatcher rd5=req.getRequestDispatcher("footer.jsp");
                rd5.include(req, resp);
            }
        }
        catch(Exception e)
        {
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
