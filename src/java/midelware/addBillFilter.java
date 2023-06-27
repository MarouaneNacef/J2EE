/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package midelware;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vendor.CSRF;
import vendor.auth;

/**
 *
 * @author ASUS VivoBook
 */
@WebFilter(filterName = "addBillFilter", urlPatterns = {"/addBill"})
public class addBillFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        if(!CSRF.vildateForm(req))
        {
            res.sendRedirect("/addBill.jsp");
            return ;
        }
        if(!auth.isLoged(req))
        {
            res.sendRedirect("/");
            return;
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
    
}
