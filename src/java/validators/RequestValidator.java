/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validators;

import javax.servlet.http.HttpServletRequest;



public class RequestValidator {
    
    HttpServletRequest request;
    
    public RequestValidator(HttpServletRequest request)
    {
        this.request = request;
    }
    
    public boolean InputExistes(String input)
    {
        String str = this.request.getParameter(input);
        return str == null;
    }
}
