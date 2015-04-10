/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Ocorrencia;
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
public class OcorrenciaDAO {
    
    public boolean cadastrarOcorrencia(Ocorrencia ocorrencia)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try
        {
            trns = session.beginTransaction();
            session.save(ocorrencia);
            session.getTransaction().commit();
            return true;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return false;
        }
    }
    
    public List<Ocorrencia> listarOcorrencias()
    {
        List<Ocorrencia> ocorrencias = new LinkedList<Ocorrencia>();

        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("From Ocorrencia");
            ocorrencias = query.list();
            return ocorrencias;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }
    
    
    public boolean alterarOcorrencia(Ocorrencia ocorrencia)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("Update Ocorrencia set veiculo = :veiculo Where ocorrenciaCodigo = :ocorrenciaCodigo");
            query.setParameter("veiculo", ocorrencia.getVeiculo());
            query.setParameter("ocorrenciaCodigo", ocorrencia.getOcorrenciaCodigo());
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
    
    
}
