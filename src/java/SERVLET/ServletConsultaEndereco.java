package SERVLET;

import DAO.EndereoDAO;
import POJO.Bairro;
import POJO.Cidade;
import POJO.Estado;
import POJO.Logradouro;
import POJO.Modelo;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletConsultaEndereco extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String cep = req.getParameter("cep").toString();
        EndereoDAO enderecoDao = new EndereoDAO();
        Logradouro logradouro = new Logradouro();
        logradouro = enderecoDao.buscarLogradouro(cep);
        
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("logradouroCodigo", logradouro.getLogradouroCodigo());
        jsonObject.addProperty("logradouroNome", logradouro.getLogradouroNome());
        jsonObject.addProperty("logradouroCep", logradouro.getLogradouroCep());
        jsonObject.addProperty("logradouroBairro", logradouro.getBairro().getBairroNome());
        jsonObject.addProperty("logradouroCidade", logradouro.getBairro().getCidade().getCidadeNome());
        jsonObject.addProperty("logradouroEstado", logradouro.getBairro().getCidade().getEstado().getEstadoNome());

        Gson json = new Gson();
        List<JsonObject> jsons = new LinkedList<JsonObject>();
        jsons.add(jsonObject);
        String stringJson = json.toJson(jsons);
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(stringJson);
    } 
}
