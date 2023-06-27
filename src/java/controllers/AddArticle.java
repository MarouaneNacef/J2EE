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
import models.Article;
import vendor.Sanitizer;

/**
 *
 * @author ASUS VivoBook
 */
@WebServlet(name = "AddArticle", urlPatterns = {"/addArticle"})
public class AddArticle extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
    {
        try
        {
            String name = request.getParameter("name");
            name = Sanitizer.sanitizeXSS(name);
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            float prix = Float.parseFloat(request.getParameter("prix"));
            Article article = new Article(name,quantity,prix);
            article.save();
            response.sendRedirect("/add.jsp");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
