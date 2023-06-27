/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package vendor;

import java.util.Random;

/**
 *
 * @author ASUS VivoBook
 */
public class STR {
    public static String random(int length)
    {
        String random = "";
        Random rnd = new Random();
        for(int i = 0;i<length;i++)
        {
            int n = rnd.nextInt(90)+35;
            random += (char)(n);
        }
        return random;
    }
}
