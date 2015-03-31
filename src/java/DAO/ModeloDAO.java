/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Marca;
import POJO.Modelo;
import UTIL.HibernateUtil;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author rafael
 */
public class ModeloDAO {
    
    public List<Modelo> listarModelo(Marca marca)
    {
        List<Modelo> modelos = new LinkedList<>();  
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("from Modelo Where marca = :marca");
        query.setParameter("marca", marca);
        modelos = query.list();
        
        return modelos;
    }
}
