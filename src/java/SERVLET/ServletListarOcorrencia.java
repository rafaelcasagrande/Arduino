/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.OcorrenciaDAO;
import POJO.Ocorrencia;
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
public class ServletListarOcorrencia extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Ocorrencia> ocorrencias = new LinkedList<Ocorrencia>();
        OcorrenciaDAO ocorrenciaDao = new OcorrenciaDAO();
        ocorrencias = ocorrenciaDao.listarOcorrencias();
        
        JsonObject jsonObject;
        List<JsonObject> jsonObjectList = new LinkedList<JsonObject>();
        for(Ocorrencia ocorrencia:ocorrencias)
        {
            jsonObject = new JsonObject();
            
            String[] ocorrenciaInicio = ocorrencia.getOcorrenciaInicio().toString().split("-");
            
            Object ocorrenciaTerminoS = ocorrencia.getOcorrenciaTermino();
            if(ocorrenciaTerminoS != null)
            {
                String[] ocorrenciaTermino = ocorrenciaTerminoS.toString().split("-");
                jsonObject.addProperty("ocorrenciaTermino", ocorrenciaTermino[2] + "/" + ocorrenciaTermino[1] + "/" + ocorrenciaTermino[0]);
            }
            
            jsonObject.addProperty("ocorrenciaCodigo", ocorrencia.getOcorrenciaCodigo());
            jsonObject.addProperty("ocorrenciaStatus", ocorrencia.getOcorrenciaStatus());
            jsonObject.addProperty("ocorrenciaInicio", ocorrenciaInicio[2] + "/" + ocorrenciaInicio[1] + "/" + ocorrenciaInicio[0]);
            jsonObject.addProperty("veiculoPlaca", ocorrencia.getVeiculo().getVeiculoPlaca());
            jsonObject.addProperty("veiculoCor", ocorrencia.getVeiculo().getVeiculoCor());
            jsonObject.addProperty("veiculoAno", ocorrencia.getVeiculo().getVeiculoAno());
            jsonObject.addProperty("modeloNome", ocorrencia.getVeiculo().getModelo().getModeloNome());
            jsonObject.addProperty("marcaNome", ocorrencia.getVeiculo().getModelo().getMarca().getMarcaNome());
            jsonObject.addProperty("veiculoCodigo", ocorrencia.getVeiculo().getVeiculoCodigo());
            jsonObject.addProperty("condutorNome", ocorrencia.getVeiculo().getCondutor().getCondutorNome());
            jsonObject.addProperty("condutorCpf", ocorrencia.getVeiculo().getCondutor().getCondutorCpf());
            
            jsonObjectList.add(jsonObject);
        }

        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObjectList.toString());
    }
}
