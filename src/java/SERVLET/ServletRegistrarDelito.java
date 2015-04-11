/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.RegistroDAO;
import POJO.Sensor;
import POJO.Tag;

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
public class ServletRegistrarDelito extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String tagId = request.getParameter("tagId");
        String sensorMacAddress = request.getParameter("sensorMacAddress");

        Sensor sensor = new Sensor();
        sensor.setSensorMacAddress(sensorMacAddress);
        
        Tag tag = new Tag();
        tag.setTagId(tagId);
        
        boolean resultado = false;
        RegistroDAO registroDao = new RegistroDAO();
        resultado = registroDao.registrar(tag, sensor);
        
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
