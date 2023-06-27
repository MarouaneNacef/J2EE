/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ASUS VivoBook
 */
public class Client {
    public int id;
    public  String name;
    public  String phone;
    public String email;
    
    private Connection connection;
    
    public Client(String name,String phone,String email)
    {
        this.email = email;
        this.phone = phone;
        this.name = name;
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost/cawa","root", "");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public void save()
    {
        try
        {
            PreparedStatement st = this.connection.prepareStatement("insert into client (name,phone,email) values (?,?,?)");
            st.setString(1, this.name);
            st.setString(2, this.phone);
            st.setString(3,this.email);
            st.executeUpdate();
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public static Client find(int id)
    { 
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/cawa","root", "");
            PreparedStatement st = connection.prepareStatement("select * from client where id = ?");
            st.setInt(1,id);
            ResultSet set = st.executeQuery();
            while(set.next())
            {
                Client client = new Client(set.getString("name"),set.getString("phone"),set.getString("email"));
                client.id = set.getInt("id");
                return client;
            }
            return null;
            
        }catch(Exception e)
        {
            return null;
        }
    }
    
    public static ArrayList<Client> all()
    {
        ArrayList<Client> clients = new ArrayList<Client>();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/cawa","root", "");
            PreparedStatement st = connection.prepareStatement("select * from client");
            ResultSet set = st.executeQuery();
            while(set.next())
            {
                Client client = new Client(set.getString("name"),set.getString("phone"),set.getString("email"));
                client.id = set.getInt("id");
                clients.add(client);
            }
            return clients;
        }catch(Exception e)
        {
            return null;
        }
    }
    
    public boolean update()
    {
        try
        {
            PreparedStatement st = this.connection.prepareStatement("update client set name=?, phone=?, email=? where id=?");
            st.setString(1, this.name);
            st.setString(2, this.phone);
            st.setString(3,this.email);
            st.setInt(4, this.id);
            st.executeUpdate();
            return true;
            
        }catch(Exception e)
        {
           return false;
        }
    }
    
    public boolean delete()
    {
        try
        {
            PreparedStatement st = this.connection.prepareStatement("delete from client where id = ?");
            st.setInt(1,this.id);
            st.executeUpdate();
            return true;
        }catch(Exception e)
        {
            return false;
        }
    }
}
