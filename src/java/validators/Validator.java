/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package validators;

import java.util.regex.Pattern;

/**
 *
 * @author ASUS VivoBook
 */
public class Validator {
    public static boolean isNumber(String nbr)
    {
        try
        {
            Double.parseDouble(nbr);
            return true;
        }catch(Exception e)
        {
            return false;
        }
    }
    
    public static boolean isEmail(String email)
    {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+
                            "[a-zA-Z0-9_+&*-]+)*@" +
                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
                            "A-Z]{2,7}$";
                              
        Pattern pat = Pattern.compile(emailRegex);
        if (email == null)
            return false;
        return pat.matcher(email).matches();
    }
}
