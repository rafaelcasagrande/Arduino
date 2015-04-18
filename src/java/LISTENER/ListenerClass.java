/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LISTENER;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class ListenerClass implements ServletContextListener{

    private Connection connection = null;
    private Thread myThread = null;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try
        {
            connection = new Connection();
            myThread = new Thread(connection);
            
            if(!myThread.isAlive())
                myThread.start();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
    @Override
    public void contextDestroyed(ServletContextEvent sce){
        try 
        {
           connection.finalizar();
        } 
        catch (Exception ex) 
        {
            
        }
    }
}
