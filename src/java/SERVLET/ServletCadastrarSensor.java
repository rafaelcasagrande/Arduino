/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.SensorDAO;
import POJO.Logradouro;
import POJO.Sensor;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafael
 */
public class ServletCadastrarSensor extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String ipSensor = request.getParameter("ipSensor").toString();
        String numeroLogradouro = request.getParameter("numeroLogradouro").toString();
        String logradouroCodigo = request.getParameter("logradouroCodigo").toString();
        
        Logradouro logradouro = new Logradouro();
        logradouro.setLogradouroCodigo(Integer.parseInt(logradouroCodigo));
        
        Sensor sensor = new Sensor();
        sensor.setSensorIp(ipSensor);
        sensor.setSensorNumeroLogradouro(numeroLogradouro);
        sensor.setLogradouro(logradouro);
        
        boolean resultado = false;
        SensorDAO sensorDao = new SensorDAO();
        resultado = sensorDao.cadastrarSensor(sensor);
        
        if(resultado)
        {
            response.getWriter().write("true");
        }
        else
        {
            response.getWriter().write("false");
        }
    }
}
