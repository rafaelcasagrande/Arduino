/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Veiculo;
import UTIL.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author rafael
 */
public class VeiculoDAO {
    
    public boolean cadastrarVeiculo (Veiculo veiculo)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            trns = session.beginTransaction();
            session.save(veiculo);
            session.getTransaction().commit();
            return true;
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return false;
        }
    }
    
    public Veiculo buscarPlaca (String placa)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Veiculo veiculo = new Veiculo();
        
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("From Veiculo Where veiculoPlaca = :veiculoPlaca");
            query.setParameter("veiculoPlaca", placa);
            veiculo = (Veiculo)query.list().get(0);
            return veiculo;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }
}
