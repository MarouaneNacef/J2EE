/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ASUS VivoBook
 */
public class Facture {
    public int N_facture;
    public String date_facture;
    public String mode_paiment;
    public int Client_id;
    
    public ArrayList<LigneFacture> ligneFacture;
    
    public Facture(String date_facture, String mode_paiment,int Client_id)
    {
        this.date_facture = date_facture;
        this.mode_paiment = mode_paiment;
        this.Client_id = Client_id;
    }
    
    public boolean save()
    {
        try
        {
            PreparedStatement st = DBConnection.connection().prepareStatement("insert into facture (date_facture,mode_paiment,Client_id) values (?,?,?)",Statement.RETURN_GENERATED_KEYS);
            st.setString(1, this.date_facture);
            st.setString(2, this.mode_paiment);
            st.setInt(3, this.Client_id);
            st.executeUpdate();
            ResultSet set = st.getGeneratedKeys();
            int id=0;
            if(set.next())
                id = set.getInt(1);
            this.N_facture =id;
            return true;
        }catch(Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }
    
    public static Facture find(int id)
    {
        try
        {
            PreparedStatement st = DBConnection.connection().prepareStatement("select * from facture where N_facture = ?");
            st.setInt(1, id);
            ResultSet set = st.executeQuery();
            if(set.next())
            {
                Facture facture = new Facture(set.getString("date_facture"),set.getString("mode_paiment"),set.getInt("Client_id"));
                facture.N_facture = set.getInt("N_Facture");
                facture.ligneFacture = LigneFacture.all(facture.N_facture);
                return facture;
            }
            return null;
        }catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
    }
    
    public static ArrayList<Facture> all()
    {
        try
        {
            ArrayList<Facture> all = new ArrayList<Facture>();
            PreparedStatement st = DBConnection.connection().prepareStatement("select * from facture");
            ResultSet set = st.executeQuery();
            while(set.next())
            {
                Facture facture = new Facture(set.getString("date_facture"),set.getString("mode_paiment"),set.getInt("Client_id"));
                facture.N_facture = set.getInt("N_Facture");
                facture.ligneFacture = LigneFacture.all(facture.N_facture);
                all.add(facture);
            }
            return all;
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
            PreparedStatement st = DBConnection.connection().prepareStatement("delete from facture where N_facture = ?");
            st.setInt(1,this.N_facture);
            st.executeUpdate();
            return true;
        }catch(Exception e)
        {
            e.printStackTrace();
            return false;
        }
    }
}
