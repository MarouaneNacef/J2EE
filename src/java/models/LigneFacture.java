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
public class LigneFacture {
    public int ref_article;
    public int N_facture;
    public int quantity;
    public int id;
    
    public LigneFacture(int ref_article,int N_facture,int quantity)
    {
        this.ref_article = ref_article;
        this.N_facture = N_facture;
        this.quantity = quantity;
    }
    
    public boolean save()
    {
        try
        {
            PreparedStatement st = DBConnection.connection().prepareStatement("insert into ligne_facture(ref_article,N_facture,quantity) values (?,?,?)");
            st.setInt(1,this.ref_article);
            st.setInt(2,this.N_facture);
            st.setInt(3, this.quantity);
            st.executeUpdate();
            return true;
        }catch(Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }
    
    public static ArrayList<LigneFacture> all(int idFacture)
    {
        try
        {
            ArrayList<LigneFacture> all = new ArrayList<LigneFacture>();
            PreparedStatement st = DBConnection.connection().prepareStatement("select * from ligne_facture where N_facture = ?");
            st.setInt(1, idFacture);
            ResultSet set = st.executeQuery();
            while(set.next())
            {
                LigneFacture lf = new  LigneFacture( set.getInt("ref_article"), set.getInt("N_facture"),set.getInt("quantity"));
                lf.id = set.getInt("id");
                all.add(lf);
            }
            return all;
        }catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
            
}
