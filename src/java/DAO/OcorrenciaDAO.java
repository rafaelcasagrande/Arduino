/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Ocorrencia;
import UTIL.HibernateUtil;;
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
            
            Query query = session.createQuery("From Ocorrencia Where veiculo = :veiculo and ocorrenciaStatus = 'true'");
            query.setParameter("veiculo", ocorrencia.getVeiculo());
            Ocorrencia ocorr = (Ocorrencia)query.list().get(0);
            if(ocorr == null)
            {
                session.save(ocorrencia);
                session.getTransaction().commit();
                return true;
            }
            else
            {
                return false;
            }
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
            Query query = session.createQuery("From Ocorrencia Where ocorrenciaStatus = 'true'");
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
            Query query = session.createQuery("Update Ocorrencia set veiculo = :veiculo, ocorrenciaStatus = :ocorrenciaStatus Where ocorrenciaCodigo = :ocorrenciaCodigo");
            query.setParameter("veiculo", ocorrencia.getVeiculo());
            query.setParameter("ocorrenciaCodigo", ocorrencia.getOcorrenciaCodigo());
            query.setParameter("ocorrenciaStatus", ocorrencia.getOcorrenciaStatus());
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
    
    
    public Ocorrencia consultarOcorrencia(int codigoOcorrencia)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Ocorrencia ocorrencia = new Ocorrencia();
        
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("From Ocorrencia Where ocorrenciaCodigo = :ocorrenciaCodigo");
            query.setParameter("ocorrenciaCodigo", codigoOcorrencia);
            
            ocorrencia = (Ocorrencia)query.list().get(0);
            return ocorrencia;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }
    
    public boolean excluirOcorrencia(Ocorrencia ocorrencia)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("From Ocorrencia Where ocorrenciaCodigo = :ocorrenciaCodigo");
            query.setParameter("ocorrenciaCodigo", ocorrencia.getOcorrenciaCodigo());
            Ocorrencia ocorr = (Ocorrencia)query.list().get(0);
            session.delete(ocorr);
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
