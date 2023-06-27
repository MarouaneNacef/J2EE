/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ASUS VivoBook
 */
public class DBConnection {
    private static  Connection connection = null;
    public static Connection connection () throws ClassNotFoundException, SQLException
    {
        if(connection == null)
        {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/cawa","root", "");
        }
        return connection;
    }
}
