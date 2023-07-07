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

public class farmer_login extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        
        String email2=req.getParameter("flemail");
        String pass2=req.getParameter("flpass");
        
        String fname2="", lname2="",gender2="", city2="";
        
        Connection con = null;
        try
        {
            con=DbConnection.getConnect();
            
            PreparedStatement ps=con.prepareStatement("select * from farmer where femail=? and fpassword=?");
            ps.setString(1, email2);
            ps.setString(2, pass2);
            
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                fname2=rs.getString("ffname");
                lname2=rs.getString("flname");
                gender2=rs.getString("fgender");
                city2=rs.getString("fcity");
                
                HttpSession session=req.getSession();
                session.setAttribute("session_ffname", fname2);
                session.setAttribute("session_flname", lname2);
                session.setAttribute("session_femail", email2);
                session.setAttribute("session_fgender", gender2);
                session.setAttribute("session_fcity", city2);
                
                String title="", state="",exp="",need="",quant="",comp="",payment="",unit="";
                PreparedStatement ps2=con.prepareStatement("select * from about_farmer where femail=?");
                ps2.setString(1, email2);
                ResultSet rs2=ps2.executeQuery();
                while(rs2.next())
                {
                    title=rs2.getString("fabout");
                    state=rs2.getString("fstate");
                    exp=rs2.getString("fexperience");
                    need=rs2.getString("favailable");
                    quant=rs2.getString("fquantity");
                    unit=rs2.getString("funit");
                    payment=rs2.getString("fpayment");
                    comp=rs2.getString("fimage");
                }
                
                session.setAttribute("session_fabout", title);
                session.setAttribute("session_fstate",state);
                session.setAttribute("session_fexp",exp);
                session.setAttribute("session_favailable",need);
                session.setAttribute("session_fquantity",quant);
                session.setAttribute("session_funit",unit);
                session.setAttribute("session_fimage", comp);
                session.setAttribute("session_fpayment", payment);
                
                String filename="";
                PreparedStatement ps3=con.prepareStatement("select * from profile_pics_w where wemail=?");
                ps3.setString(1, email2);
                ResultSet rs3=ps3.executeQuery();
                while(rs3.next())
                {
                    filename=rs3.getString("path");
                }
                session.setAttribute("session_profilepic", filename);
                
               resp.sendRedirect("farmer_profile.jsp");
            }
            else
            {
                //resp.sendRedirect("login.jsp");
                //RequestDispatcher rd1=req.getRequestDispatcher("components/navbar.jsp");
                //rd1.include(req, resp);
                
                RequestDispatcher rd3=req.getRequestDispatcher("components/login_error.jsp");
                rd3.include(req, resp);
                
                RequestDispatcher rd4=req.getRequestDispatcher("farmer_login.jsp");
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
