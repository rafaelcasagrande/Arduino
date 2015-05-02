/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.SensorDAO;
import POJO.Sensor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafael
 */
public class ServletExcluirSensor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean resultado = false;
        String codigoSensor = request.getParameter("codigoSensor");
        
        Sensor sensor = new Sensor();
        sensor.setSensorCodigo(Integer.parseInt(codigoSensor));
        
        SensorDAO sensorDao = new SensorDAO();
        resultado = sensorDao.excluirSensor(sensor);
        
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
