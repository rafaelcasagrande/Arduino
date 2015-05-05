/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Condutor;
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
public class CondutorDAO {
    
    public boolean cadastrarCondutor(Condutor condutor)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        try
        {
            trns = session.beginTransaction();
            
            Query query = session.createQuery("From Condutor Where condutorCpf = :cpf");
            query.setParameter("cpf", condutor.getCondutorCpf());
            Condutor cond = (Condutor)query.list().get(0);
            if(cond == null)
            {
                session.save(condutor);
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
            System.out.println(ex.getMessage());
            return false;
        }
    }
    
    public Condutor consultarDocumentos(String numeroDocumento, String tipo)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();

        Condutor condutor = new Condutor();
        
        if (tipo.equals("cpf"))
        {
            Query query = session.createQuery("from Condutor Where condutorCpf = :condutorCpf");
            query.setParameter("condutorCpf", numeroDocumento);
            condutor = (Condutor)query.list().get(0);
        }
        else
        {
            Query query = session.createQuery("from Condutor Where condutorHabilitacao = :condutorHabilitacao");
            query.setParameter("condutorHabilitacao", numeroDocumento);
            condutor = (Condutor)query.list().get(0);
        }
        return condutor;
    }
    
    public List<Condutor> listarCondutor()
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Condutor> condutores = new LinkedList<Condutor>();
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("From Condutor");
            condutores = query.list();
            return condutores;         
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }
    
    public boolean alterarCondutor(Condutor condutor)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("update Condutor set logradouro = :logradouro, condutorHabilitacao = :condutorHabilitacao, condutorCpf = :condutorCpf, condutorDataNascimento = :condutorDataNascimento, condutorNome = :condutorNome, condutorNumeroLogradouro = :condutorNumeroLogradouro Where condutorCodigo = :codigoCondutor");
            query.setParameter("codigoCondutor", condutor.getCondutorCodigo());
            query.setParameter("logradouro", condutor.getLogradouro());
            query.setParameter("condutorHabilitacao", condutor.getCondutorHabilitacao());
            query.setParameter("condutorCpf", condutor.getCondutorCpf());
            query.setParameter("condutorDataNascimento", condutor.getCondutorDataNascimento());
            query.setParameter("condutorNome", condutor.getCondutorNome());
            query.setParameter("condutorNumeroLogradouro", condutor.getCondutorNumeroLogradouro());
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
    
    public boolean excluirCondutor(Condutor condutor)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("From Condutor Where condutorCodigo = :condutorCodigo");
            query.setParameter("condutorCodigo", condutor.getCondutorCodigo());
            Condutor con = (Condutor)query.list().get(0);
            session.delete(con);
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
