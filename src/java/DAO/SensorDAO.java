/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Sensor;
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
public class SensorDAO {
    
    public boolean cadastrarSensor (Sensor sensor)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try
        {
            session.beginTransaction();
            session.save(sensor);
            session.getTransaction().commit();
            return true;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return false;
        }
    }
    
    public List<Sensor> listarSensor()
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Sensor> sensores = new LinkedList<Sensor>();
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("From Sensor");
            sensores = query.list();
            return sensores;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }
    
    public boolean alterarSensor(Sensor sensor)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
  
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("Update Sensor set sensorMacAddress = :sensorMacAddress, sensorNumeroLogradouro = :sensorNumeroLogradouro, logradouro = :logradouro, sensorLatitude = :latitude, sensorLongitude = :longitude Where sensorCodigo = :sensorCodigo");
            query.setParameter("sensorMacAddress", sensor.getSensorMacAddress());
            query.setParameter("sensorNumeroLogradouro", sensor.getSensorNumeroLogradouro());
            query.setParameter("logradouro", sensor.getLogradouro());
            query.setParameter("latitude", sensor.getSensorLatitude());
            query.setParameter("longitude", sensor.getSensorLongitude());
            query.setParameter("sensorCodigo", sensor.getSensorCodigo());
 
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
    
    public Sensor consultarSensor(String macAddress)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Sensor sensor = new Sensor();
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("From Sensor Where sensorMacAddress = :sensorMacAddress");
            query.setParameter("sensorMacAddress", macAddress);
            sensor = (Sensor)query.list().get(0);
            return sensor;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return null;
        }
    }
    
    public boolean excluirSensor(Sensor sensor)
    {
        Transaction trns = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
  
        try
        {
            session.beginTransaction();
            Query query = session.createQuery("From Sensor Where sensorCodigo = :sensorCodigo");
            query.setParameter("sensorCodigo", sensor.getSensorCodigo());
            Sensor sen = (Sensor)query.list().get(0);
            session.delete(sen);
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
