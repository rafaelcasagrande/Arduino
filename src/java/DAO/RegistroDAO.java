/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Ocorrencia;
import POJO.Registro;
import POJO.Sensor;
import POJO.Tag;
import UTIL.HibernateUtil;
import java.util.Date;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author rafael
 */
public class RegistroDAO {
    
    private Sensor sensorGlobal;
    private Ocorrencia ocorrenciaGlobal;
    
    public boolean registrar(Tag tagParametro, Sensor sensorParametro)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction trns = null;
        
        try
        {
            
            if(verificarStatusOcorrencia(tagParametro, sensorParametro))
            {
                trns = session.beginTransaction();
                
                Registro registro = new Registro();
                registro.setSensor(sensorGlobal);
                registro.setOcorrencia(ocorrenciaGlobal);
                registro.setRegistroMomento(new Date());
                
                session.save(registro);
                return true;
            }
            else
                return false;
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return false;
        }
    }
    
    private boolean verificarStatusOcorrencia(Tag tagParametro, Sensor sensorParametro)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction trns = null;

        try
        {
            trns = session.beginTransaction();
            
            Tag tagLocal = new Tag();
            Query queryTag = session.createQuery("From Tag Where tagId = :tagId");
            queryTag.setParameter("tagId", tagParametro.getTagId());
            tagLocal = (Tag)queryTag.list().get(0);
            
            ocorrenciaGlobal = new Ocorrencia();
            Query queryOcorrencia = session.createQuery("From Ocorrencia Where veiculo = :veiculo and ocorrenciaStatus = true");
            queryOcorrencia.setParameter("veiculo", tagLocal.getVeiculo());
            ocorrenciaGlobal = (Ocorrencia)queryOcorrencia.list().get(0);
            
            //Não há ocorrências ativas para este veículo
            if(ocorrenciaGlobal == null)
                return false;
            //Há ocorrência ativa para este veículo
            else
            {
                sensorGlobal = new Sensor();
                Query querySensor = session.createQuery("From Sensor Where sensorMacAddress = :sensorMacAddress");
                querySensor.setParameter("sensorMacAdress", sensorParametro.getSensorMacAddress());
                sensorGlobal = (Sensor)querySensor.list().get(0);

                return true;
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            return false;
        }
    }
}
