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
public class auth {
    public static boolean isLoged(HttpServletRequest request)
    {
        HttpSession ss = request.getSession(false);
    if(ss == null || ss.getAttribute("session_id") == null)
    {
        return false;
    }
    return true;
    }
}
