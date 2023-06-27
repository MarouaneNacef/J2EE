/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package vendor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS VivoBook
 */
public class CSRF {
    public static boolean vildateForm(HttpServletRequest req)
    {
        HttpSession session = req.getSession(false);
        if(session == null)
        {
            return false;
        }
        Object obj_csrf = session.getAttribute("csrf");
            if(obj_csrf != null)
            {
                String CSRF = (String)obj_csrf;
                if(!CSRF.equals(req.getParameter("csrf")))
                {
                   
                    return false;
                }
            }else
            {
                return false;
            }
        return true;
    }
    
    public static String generate(HttpServletRequest req)
    {
        String token = STR.random(40);
        HttpSession session = req.getSession();
        session.setAttribute("csrf", token);
        return token;
    }
}
