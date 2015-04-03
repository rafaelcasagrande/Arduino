/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Tag;
import UTIL.HibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author rafael
 */
public class TagDao {
    
    public boolean cadastrarTag(Tag tag)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        
        try
        {
            trns = session.beginTransaction();
            session.save(tag);
            session.getTransaction().commit();
            return true;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return false;
        }
    }
}
