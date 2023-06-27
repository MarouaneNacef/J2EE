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
import models.Client;
import vendor.auth;

/**
 *
 * @author ASUS VivoBook
 */
@WebServlet(name = "DeleteCleint", urlPatterns = {"/deleteCleint"})
public class DeleteCleint extends HttpServlet {
     @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response)
    {
        try
        {
            if(!auth.isLoged(request))
            {
                response.sendRedirect("/");
                return ;
            }
            int id = Integer.parseInt(request.getParameter("id"));
            Client client = Client.find(id);
            client.delete();
            response.sendRedirect("/clientList.jsp");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}