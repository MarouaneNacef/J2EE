/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package vendor;

/**
 *
 * @author ASUS VivoBook
 */
public class Sanitizer {
    public static String sanitizeXSS(String str)
    {
        String s = str.replace("<", "&lt;").replace("&", "&amp;");
        return s;
    }
}
