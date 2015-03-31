package SERVLET;

import DAO.EndereoDAO;
import POJO.Bairro;
import POJO.Cidade;
import POJO.Estado;
import POJO.Logradouro;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
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

        JsonObject jsonLogradouro = new JsonObject();
        jsonLogradouro.addProperty("logradouroCep", logradouro.getLogradouroCep());
        jsonLogradouro.addProperty("logradouroId", logradouro.getLogradouroCodigo());
        jsonLogradouro.addProperty("logradouroNome", logradouro.getLogradouroNome());
        jsonLogradouro.addProperty("logradouroBairro", logradouro.getBairro().getBairroNome());
        jsonLogradouro.addProperty("logradouroCidade", logradouro.getBairro().getCidade().getCidadeNome());
        jsonLogradouro.addProperty("logradouroEstado", logradouro.getBairro().getCidade().getEstado().getEstadoNome());
             
        Gson json = new Gson();
        String stringJson = json.toJson(jsonLogradouro);
        resp.getWriter().write(stringJson);
    } 
}
