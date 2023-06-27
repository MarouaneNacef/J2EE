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
public class Attempts {
    public static boolean check(HttpServletRequest request,int nbr)
    {
        HttpSession session = request.getSession();
        Object nb = session.getAttribute("attempt");
        if(nb == null)
        {
            session.setAttribute("attempt", 1);
            return false;
        }
        int n = (int)nb;
        n++;
        session.setAttribute("attempt", n);
        return n >= nbr;    
    }
    
    public static void reset(HttpServletRequest req)
    {
        HttpSession session = req.getSession();
        session.setAttribute("attempt", 1);
    }
}
