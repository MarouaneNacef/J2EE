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
import models.LigneFacture;

/**
 *
 * @author ASUS VivoBook
 */
@WebServlet(name = "addLine", urlPatterns = {"/addLine"})
public class addLine extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
    {
        int ref_article = Integer.parseInt(request.getParameter("article"));
        int N_facture = Integer.parseInt(request.getParameter("bill"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        LigneFacture l = new LigneFacture(ref_article,N_facture,quantity);
        l.save();
        try
        {
            response.sendRedirect("/addLine.jsp?id="+N_facture);
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
