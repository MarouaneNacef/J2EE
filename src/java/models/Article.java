/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ASUS VivoBook
 */
public class Article {
    
    public int Ref_article;
    public String nom_article;
    public int quantity;
    public float prix_vente;
    
    public Article(String nom_article,int quantity,float prix_vente)
    {
        this.nom_article = nom_article;
        this.quantity = quantity;
        this.prix_vente = prix_vente;
    }
    
    public boolean save()
    {
        try
        {
            PreparedStatement st = DBConnection.connection().prepareStatement("insert into article (nom_article,quantity,prix_vente) values (?,?,?)");
            st.setString(1, this.nom_article);
            st.setInt(2, this.quantity);
            st.setFloat(3, this.prix_vente);
            st.executeUpdate();
            return true;
        }catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }
    
    public static Article find(int id)
    {
        try
        {
            PreparedStatement st = DBConnection.connection().prepareStatement("select * from article where Ref_article = ?");
            st.setInt(1, id);
            ResultSet set = st.executeQuery();
            
            while(set.next())
            {
                Article article = new Article(set.getString("nom_article"),set.getInt("quantity"),set.getFloat("prix_vente"));
                article.Ref_article = set.getInt("Ref_article");
                return article;
            }
            return null;
        }catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
        
    }
    
    public static ArrayList<Article> all()
    {
        try
        {
            PreparedStatement st = DBConnection.connection().prepareStatement("select * from article");
            ResultSet set = st.executeQuery();
            ArrayList<Article> articles = new ArrayList<Article>();
            while(set.next())
            {
                Article article = new Article(set.getString("nom_article"),set.getInt("quantity"),set.getFloat("prix_vente"));
                article.Ref_article = set.getInt("Ref_article");
                articles.add(article);
            }
            return articles;
        }catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    public boolean delete()
    {
        try
        {
            PreparedStatement st = DBConnection.connection().prepareStatement("delete from article where Ref_article = ?");
            st.setInt(1, this.Ref_article);
            st.executeUpdate();
            return true;
        }catch(Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }
}
