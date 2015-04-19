/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.RegistroDAO;
import POJO.Registro;
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
public class ServletListarDelito extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Registro> registros = new LinkedList<Registro>();
        
        RegistroDAO registroDao = new RegistroDAO();
        
        registros = registroDao.listarRegistros();
        
        List<JsonObject> jsonObjectList = new LinkedList<JsonObject>();
        JsonObject jsonObject;
        
        for(Registro registro:registros)
        {
            String[] momento = registro.getRegistroMomento().toString().split(" ");
            String[] date = momento[0].split("-");
            String dateTime = date[2] + "-" + date[1] + "-" + date[0] + " " + momento[1];
            
            jsonObject = new JsonObject();
            jsonObject.addProperty("sensorLatitude", registro.getSensor().getSensorLatitude());
            jsonObject.addProperty("sensorLongitude", registro.getSensor().getSensorLongitude());
            jsonObject.addProperty("sensorMacAddress", registro.getSensor().getSensorMacAddress());
            jsonObject.addProperty("ocorrenciaCodigo", registro.getOcorrencia().getOcorrenciaCodigo());
            jsonObject.addProperty("veiculoAno", registro.getOcorrencia().getVeiculo().getVeiculoAno());
            jsonObject.addProperty("veiculoCor", registro.getOcorrencia().getVeiculo().getVeiculoCor());
            jsonObject.addProperty("veiculoPlaca", registro.getOcorrencia().getVeiculo().getVeiculoPlaca());
            jsonObject.addProperty("modeloNome", registro.getOcorrencia().getVeiculo().getModelo().getModeloNome());
            jsonObject.addProperty("marcaNome", registro.getOcorrencia().getVeiculo().getModelo().getMarca().getMarcaNome());
            jsonObject.addProperty("registroMomento", dateTime);
            jsonObject.addProperty("logradouroCep", registro.getSensor().getLogradouro().getLogradouroCep());
            jsonObject.addProperty("logradouroNome", registro.getSensor().getLogradouro().getLogradouroNome());
            jsonObject.addProperty("bairroNome", registro.getSensor().getLogradouro().getBairro().getBairroNome());
            jsonObject.addProperty("cidadeNome", registro.getSensor().getLogradouro().getBairro().getCidade().getCidadeNome());
            jsonObject.addProperty("estadoNome", registro.getSensor().getLogradouro().getBairro().getCidade().getEstado().getEstadoNome());
            
            jsonObjectList.add(jsonObject);
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObjectList.toString());
    }
}
