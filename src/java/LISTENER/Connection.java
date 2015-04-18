/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LISTENER;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import DAO.RegistroDAO;
import POJO.Sensor;
import POJO.Tag;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

/**
 *
 * @author rafael
 */
public class Connection implements Runnable{

    private Socket connectionSocket = null;
    private boolean resultado = false;
    
    @Override
    public void run()
    {
        try
        {
            String clientString;
            ServerSocket welcomeSocket = new ServerSocket(4098); 
            connectionSocket = welcomeSocket.accept();
        
            while(true)
            {
                BufferedReader infoFromClient = new BufferedReader(new InputStreamReader(connectionSocket.getInputStream()));
                clientString = infoFromClient.readLine();
                System.out.println("Received: " + clientString);
                
                if(clientString.contains("@"))
                {
                    String[] dadosRecebidos = clientString.split("@");
                    String tagId = dadosRecebidos[0];
                    String macAddress = dadosRecebidos[1];
                    resultado = registrarDelito(tagId, macAddress);
                    System.out.println(resultado);
                }
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
    
    public void finalizar()
    {
        try
        {
            connectionSocket.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
    
    private boolean registrarDelito(String tagId, String macAddress)
    {
        Sensor sensor = new Sensor();
        sensor.setSensorMacAddress(macAddress);
        
        Tag tag = new Tag();
        tag.setTagId(tagId);
        
        boolean resultado = false;
        RegistroDAO registroDao = new RegistroDAO();
        resultado = registroDao.registrar(tag, sensor);
        
        return resultado;
    }
}
