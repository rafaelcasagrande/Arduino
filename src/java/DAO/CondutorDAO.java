/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Condutor;
import UTIL.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author rafael
 */
public class CondutorDAO {
    
    public boolean cadastrarCondutor(Condutor condutor)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            session.save(condutor);
            session.getTransaction().commit();
            return true;
        }  
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
            return false;
        }
    }
}