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
import javax.servlet.http.HttpSession;
import vendor.Attempts;
import vendor.CSRF;

/**
 *
 * @author ASUS VivoBook
 */
@WebFilter(filterName = "LoginFilter", urlPatterns = {"/Login"})
public class LoginFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        try
        {
            HttpServletRequest req= (HttpServletRequest)request;
            HttpServletResponse res = (HttpServletResponse)response;
            if(!CSRF.vildateForm(req))
            {
                res.sendRedirect("/");
                return;
            }
            if(Attempts.check(req,5))
            {
                HttpSession session = req.getSession();
                session.setAttribute("msg", "too many attempt");
                res.sendRedirect("/");
                return;
            }
            chain.doFilter(request, response);
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {}
    
}