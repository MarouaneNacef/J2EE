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
import vendor.auth;

/**
 *
 * @author ASUS VivoBook
 */
@WebServlet(name = "DeleteArticle", urlPatterns = {"/deleteArticle"})
public class DeleteArticle extends HttpServlet {
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
            Article article = Article.find(id);
            article.delete();
            response.sendRedirect("/articles.jsp");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
