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
import models.Client;
import vendor.Sanitizer;

/**
 *
 * @author ASUS VivoBook
 */
@WebServlet(name = "AddClient", urlPatterns = {"/addClient"})
public class AddClient extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
    {
        try
        {
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            name = Sanitizer.sanitizeXSS(name);
            phone = Sanitizer.sanitizeXSS(phone);
            email = Sanitizer.sanitizeXSS(email);
            
            Client client = new Client(name,phone,email);
            client.save();
            response.sendRedirect("/add.jsp");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
