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
public class ServletListarCondutor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Condutor> condutores = new LinkedList<Condutor>();
        CondutorDAO condutorDao = new CondutorDAO();
        condutores = condutorDao.listarCondutor();
        
        JsonObject json;
        List<JsonObject> jsonList = new LinkedList<JsonObject>();
        
        String dataNascimento = "";
        
        for(Condutor condutor:condutores)
        {
            String[] data = condutor.getCondutorDataNascimento().toString().split("-");
            dataNascimento = data[2] + "/" + data [1] + "/" + data[0];
            
            json = new JsonObject();
            json.addProperty("codigoCondutor", condutor.getCondutorCodigo());
            json.addProperty("nomeCondutor", condutor.getCondutorNome());
            json.addProperty("cpfCondutor", condutor.getCondutorCpf());
            json.addProperty("habilitacaoCondutor", condutor.getCondutorHabilitacao());
            json.addProperty("dataNascimentoCondutor", dataNascimento);
            json.addProperty("numeroLogradouroCondutor", condutor.getCondutorNumeroLogradouro());
            json.addProperty("cepCondutor", condutor.getLogradouro().getLogradouroCep());
            json.addProperty("nomeLogradouroCondutor", condutor.getLogradouro().getLogradouroNome());
            json.addProperty("bairroCondutor", condutor.getLogradouro().getBairro().getBairroNome());
            json.addProperty("cidadeCondutor", condutor.getLogradouro().getBairro().getCidade().getCidadeNome());
            json.addProperty("estadoCondutor", condutor.getLogradouro().getBairro().getCidade().getEstado().getEstadoNome());
            json.addProperty("codigoLogradouro", condutor.getLogradouro().getLogradouroCodigo());
            jsonList.add(json);
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonList.toString());
    }
}
