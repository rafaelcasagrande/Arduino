/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Tag;
import UTIL.HibernateUtil;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
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
    
    public List<Tag> listarTag()
    {
        List<Tag> tags = new LinkedList<Tag>();
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("From Tag");
            tags = query.list();
            return tags;
        }
        catch(Exception ex)
        {
             return null;
        }
    }
    
    public boolean alterarTag(Tag tag)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("Update Tag set tagId = :tagId, veiculo = :veiculo Where tagCodigo = :tagCodigo");
            query.setParameter("tagId", tag.getTagId());
            query.setParameter("veiculo", tag.getVeiculo());
            query.setParameter("tagCodigo", tag.getTagCodigo());
            query.executeUpdate();
            session.getTransaction().commit();
            return true;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return false;
        }
    }
    
    public Tag consultarTag(String tagId)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Tag tag = new Tag();
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("From Tag Where tagId = :tagId");
            query.setParameter("tagId", tagId);
            tag = (Tag)query.list().get(0);
            return tag;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }
    
    public boolean excluirTag(Tag tag)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("From Tag Where tagCodigo = :tagCodigo");
            query.setParameter("tagCodigo", tag.getTagCodigo());
            Tag ta = (Tag)query.list().get(0);
            session.delete(ta);
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
