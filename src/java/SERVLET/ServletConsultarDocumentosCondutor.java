/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.CondutorDAO;
import POJO.Condutor;
import com.google.gson.Gson;
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
public class ServletConsultarDocumentosCondutor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String numeroDocumento = request.getParameter("numeroDocumento").toString();
        String tipoDocumento = request.getParameter("tipoDocumento").toString();
                
        Condutor condutor = new Condutor();
        CondutorDAO condutorDao = new CondutorDAO();
        condutor = condutorDao.consultarDocumentos(numeroDocumento, tipoDocumento);
        
        Condutor condutorTemp = new Condutor();
        condutorTemp.setCondutorCodigo(condutor.getCondutorCodigo());
        condutorTemp.setCondutorCpf(condutor.getCondutorCpf());
        condutorTemp.setCondutorDataNascimento(condutor.getCondutorDataNascimento());
        condutorTemp.setCondutorNome(condutor.getCondutorNome());
        condutorTemp.setCondutorHabilitacao(condutor.getCondutorHabilitacao());
        
        
        List<Condutor> condutores = new LinkedList<Condutor>();
        condutores.add(condutorTemp);
        
        Gson json = new Gson();
        String jsonModelos = json.toJson(condutores);           
        response.getWriter().write(jsonModelos);
        
    }

}
