/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Veiculo;
import UTIL.HibernateUtil;
import java.util.LinkedList;
import java.util.List;
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
            
            Query query = session.createQuery("Frin Veiculo Where veiculoPlaca = :placa");
            query.setParameter("placa", veiculo.getVeiculoPlaca());
            Veiculo vei = (Veiculo)query.list().get(0);
            if(vei == null)
            {
                session.save(veiculo);
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
    
    public List<Veiculo> listarVeiculo()
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Veiculo> veiculos = new LinkedList<Veiculo>();
        
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("From Veiculo");
            veiculos = query.list();
            return veiculos;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }
    
    public boolean alterarVeiculo(Veiculo veiculo)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("update Veiculo set veiculoPlaca = :veiculoPlaca, veiculoCor = :veiculoCor, veiculoAno = :veiculoAno, condutor = :condutor, modelo = :modelo Where veiculoCodigo = :veiculoCodigo");
            query.setParameter("veiculoCodigo", veiculo.getVeiculoCodigo());
            query.setParameter("veiculoPlaca", veiculo.getVeiculoPlaca());
            query.setParameter("veiculoCor", veiculo.getVeiculoCor());
            query.setParameter("veiculoAno", veiculo.getVeiculoAno());
            query.setParameter("condutor", veiculo.getCondutor());
            query.setParameter("modelo", veiculo.getModelo());
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
    
    public boolean excluirVeiculo(Veiculo veiculo)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try
        {
            trns = session.beginTransaction();
            Query query = session.createQuery("From Veiculo Where veiculoCodigo = :veiculoCodigo");
            query.setParameter("veiculoCodigo", veiculo.getVeiculoCodigo());
            Veiculo vei = (Veiculo)query.list().get(0);
            session.delete(vei);
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
