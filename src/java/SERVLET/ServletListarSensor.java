/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.SensorDAO;
import POJO.Sensor;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafael
 */
public class ServletListarSensor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        SensorDAO sensorDao = new SensorDAO();
        List<Sensor> sensores = new LinkedList<Sensor>();
        sensores = sensorDao.listarSensor();
        
        JsonObject jsonObject;
        List<JsonObject> jsonObjectList = new LinkedList<JsonObject>();
        for(Sensor sensor:sensores)
        {
            jsonObject = new JsonObject();
            jsonObject.addProperty("sensorCodigo", sensor.getSensorCodigo());
            jsonObject.addProperty("sensorMacAddress", sensor.getSensorMacAddress());
            jsonObject.addProperty("sensorNumeroLogradouro", sensor.getSensorNumeroLogradouro());
            jsonObject.addProperty("logradouroCep", sensor.getLogradouro().getLogradouroCep());
            jsonObject.addProperty("logradouroCodigo", sensor.getLogradouro().getLogradouroCodigo());
            jsonObject.addProperty("logradouroNome", sensor.getLogradouro().getLogradouroNome());
            jsonObject.addProperty("bairroNome", sensor.getLogradouro().getBairro().getBairroNome());
            jsonObject.addProperty("cidadeNome", sensor.getLogradouro().getBairro().getCidade().getCidadeNome());
            jsonObject.addProperty("estadoNome", sensor.getLogradouro().getBairro().getCidade().getEstado().getEstadoNome());
            jsonObjectList.add(jsonObject);
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObjectList.toString());
    }
}
