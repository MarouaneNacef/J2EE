/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vendor.Attempts;
import vendor.STR;

/**
 *
 * @author ASUS VivoBook
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
    {
        try
        {
            HttpSession session = request.getSession();
            String user = request.getParameter("user");
            String passwd = request.getParameter("passwd");
            if(user.equals("admin") && passwd.equals("admin"))
            {
                String session_id = STR.random(40);
                session.setAttribute("session_id",session_id);
                Attempts.reset(request);
                response.sendRedirect("/home.jsp");
            }
            else
            {
                session.setAttribute("msg", "wrong credentials");
                response.sendRedirect("/");
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
    
    
