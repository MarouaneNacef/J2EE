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
import models.Facture;
import vendor.Sanitizer;

/**
 *
 * @author ASUS VivoBook
 */
@WebServlet(name = "addBill", urlPatterns = {"/addBill"})
public class addBill extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
    {
        String date_facture = request.getParameter("date");
        date_facture = Sanitizer.sanitizeXSS(date_facture);
        String mode_paiment = request.getParameter("method");
        mode_paiment = Sanitizer.sanitizeXSS(mode_paiment);
        int Client_id = Integer.parseInt(request.getParameter("client"));
        Facture f = new Facture(date_facture,mode_paiment,Client_id);
        f.save();
        try
        {
            response.sendRedirect("/addLine.jsp?id="+f.N_facture);
            return;
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
}
