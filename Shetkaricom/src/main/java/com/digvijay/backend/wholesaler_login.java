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

public class wholesaler_login extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String email2=req.getParameter("wlemail");
        String pass2=req.getParameter("wlpass");
        
        String fname2="", lname2="",gender2="", city2="";
        
        Connection con = null;
        try
        {
            con=DbConnection.getConnect();
            
            PreparedStatement ps=con.prepareStatement("select * from wholesaler where wemail=? and wpassword=?");
            ps.setString(1, email2);
            ps.setString(2, pass2);
            
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                fname2=rs.getString("wfname");
                lname2=rs.getString("wlname");
                gender2=rs.getString("wgender");
                city2=rs.getString("wcity");
                
                HttpSession session=req.getSession();
                session.setAttribute("session_wfname", fname2);
                session.setAttribute("session_wlname", lname2);
                session.setAttribute("session_wemail", email2);
                session.setAttribute("session_wgender", gender2);
                session.setAttribute("session_wcity", city2);
                
                String title="", state="",exp="",need="",quant="",comp="",payment="";
                PreparedStatement ps2=con.prepareStatement("select * from about_wholesaler where wemail=?");
                ps2.setString(1, email2);
                ResultSet rs2=ps2.executeQuery();
                while(rs2.next())
                {
                    title=rs2.getString("wabout");
                    state=rs2.getString("wstate");
                    exp=rs2.getString("wexperience");
                    need=rs2.getString("wneed");
                    quant=rs2.getString("wquantity");
                    comp=rs2.getString("wcompany");
                    payment=rs2.getString("payment");
                }
                
                session.setAttribute("session_wabout", title);
                session.setAttribute("session_wstate",state);
                session.setAttribute("session_wexp",exp);
                session.setAttribute("session_wneed",need);
                session.setAttribute("session_wquantity",quant);
                session.setAttribute("session_wcompany", comp);
                session.setAttribute("session_wpayment", payment);
                
                String filename="";
                PreparedStatement ps3=con.prepareStatement("select * from profile_pics_w where wemail=?");
                ps3.setString(1, email2);
                ResultSet rs3=ps3.executeQuery();
                while(rs3.next())
                {
                    filename=rs3.getString("path");
                }
                session.setAttribute("session_profilepic", filename);
                
               resp.sendRedirect("wholesaler_profile1.jsp");
            }
            else
            {
                //resp.sendRedirect("login.jsp");
                RequestDispatcher rd1=req.getRequestDispatcher("components/navbar.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd3=req.getRequestDispatcher("components/login_error.jsp");
                rd3.include(req, resp);
                
                RequestDispatcher rd4=req.getRequestDispatcher("wholesaler_login1.jsp");
                rd4.include(req, resp);
                
//                RequestDispatcher rd5=req.getRequestDispatcher("components/footer.jsp");
//                rd5.include(req, resp);
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