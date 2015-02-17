/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Marca;
import UTIL.HibernateUtil;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author rafael
 */
public class MarcaDAO {
    
    public List<Marca> listarMarcas()
    {
        
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Marca> marcas = new LinkedList<Marca>();
        
        try
        {
            trns = session.beginTransaction();          
            marcas = session.createQuery("from Marca").list();
            return marcas;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    } 
}
