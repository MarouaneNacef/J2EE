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
import validators.RequestValidator;
import vendor.CSRF;
import vendor.auth;

/**
 *
 * @author ASUS VivoBook
 */
@WebFilter(filterName = "AddArticleFilter", urlPatterns = {"/addArticle"})
public class AddArticleFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse) response;
        HttpServletRequest req = (HttpServletRequest) request;
        
        if(!CSRF.vildateForm(req))
        {
            res.sendRedirect("/addArticle.jsp");
            return ;
        }
        if(!auth.isLoged(req))
        {
            res.sendRedirect("/");
            return ;
        }
        RequestValidator r = new RequestValidator(req);
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}
