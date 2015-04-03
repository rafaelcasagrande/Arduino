/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.CondutorDAO;
import POJO.Condutor;
import com.google.gson.JsonObject;
import java.io.IOException;
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
public class ServletConsultarDocumentosCondutor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String numeroDocumento = request.getParameter("numeroDocumento").toString();
        String tipoDocumento = request.getParameter("tipoDocumento").toString();
                
        Condutor condutor = new Condutor();
        CondutorDAO condutorDao = new CondutorDAO();
        condutor = condutorDao.consultarDocumentos(numeroDocumento, tipoDocumento);

        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("condutorNome", condutor.getCondutorNome());
        jsonObject.addProperty("condutorDataNascimento", condutor.getCondutorDataNascimento().toString());
        jsonObject.addProperty("condutorCodigo", condutor.getCondutorCodigo());
        jsonObject.addProperty("condutorHabilitacao", condutor.getCondutorHabilitacao());
        jsonObject.addProperty("condutorCpf", condutor.getCondutorCpf());
 
        List<JsonObject> listJson = new LinkedList<JsonObject>();
        listJson.add(jsonObject);
        
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(listJson.toString());
    }
}
