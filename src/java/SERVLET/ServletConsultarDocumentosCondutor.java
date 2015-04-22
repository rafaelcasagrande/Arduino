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

        String dataNascimento = "";
        
        String[] data = condutor.getCondutorDataNascimento().toString().split("-");
        dataNascimento = data[2] + "/" + data [1] + "/" + data[0];
        
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("nomeCondutor", condutor.getCondutorNome());
        jsonObject.addProperty("condutorDataNascimento", dataNascimento);
        jsonObject.addProperty("codigoCondutor", condutor.getCondutorCodigo());
        jsonObject.addProperty("habilitacaoCondutor", condutor.getCondutorHabilitacao());
        jsonObject.addProperty("cpfCondutor", condutor.getCondutorCpf());
        jsonObject.addProperty("cepCondutor", condutor.getLogradouro().getLogradouroCep());
        jsonObject.addProperty("nomeLogradouroCondutor", condutor.getLogradouro().getLogradouroNome());
        jsonObject.addProperty("numeroLogradouroCondutor", condutor.getCondutorNumeroLogradouro());
        jsonObject.addProperty("bairroCondutor", condutor.getLogradouro().getBairro().getBairroNome());
        jsonObject.addProperty("cidadeCondutor", condutor.getLogradouro().getBairro().getCidade().getCidadeNome());
        jsonObject.addProperty("estadoCondutor", condutor.getLogradouro().getBairro().getCidade().getEstado().getEstadoNome());

        List<JsonObject> listJson = new LinkedList<JsonObject>();
        listJson.add(jsonObject);
        
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(listJson.toString());
    }
}
