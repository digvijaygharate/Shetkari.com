package com.digvijay.backend;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.digvijay.connection.DbConnection;

public class user_profile_pic_update extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
			HttpSession session=req.getSession();
	        String email=(String)session.getAttribute("session_email");
	        
	        String file_name = null;
	        try
	        {
	            DiskFileItemFactory factory=new DiskFileItemFactory();
	            ServletFileUpload sfu=new ServletFileUpload(factory);
	            List<FileItem> items=sfu.parseRequest((RequestContext) req);
	            FileItem item=items.get(0);
	            String file_path=item.getName();
	            File file=new File(file_path);
	            file_name=file.getName();
	            
	            File f1=new File(PathDetails.PROFILE_PIC_PATH+file_name);
	            item.write(f1);
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
	            
	            PreparedStatement ps=con.prepareStatement("update profile_pics set path=? where email=?");
	            ps.setString(1, file_name);
	            ps.setString(2, email);
	            
	            int i=ps.executeUpdate();
	            if(i>0)
	            {
	                session.setAttribute("session_profilepic", file_name);
	                con.commit();
	                resp.sendRedirect("user_profile_pic_edit.jsp");
	            }
	            else
	            {
	                con.rollback();
	                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
	                rd1.include(req, resp);
	                
	                RequestDispatcher rd2=req.getRequestDispatcher("user_profile_pic_edit.jsp");
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
	                
	                RequestDispatcher rd2=req.getRequestDispatcher("user_profile_pic_edit.jsp");
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

