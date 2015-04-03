/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.ModeloDAO;
import POJO.Marca;
import POJO.Modelo;
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
public class ServletListarModelo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String idMarca = req.getParameter("idMarca").toString();
        ModeloDAO modeloDao = new ModeloDAO();
        Marca marca = new Marca();
        marca.setMarcaCodigo(idMarca);

        List<Modelo> modelos = modeloDao.listarModelo(marca);
        JsonObject jsonObject;
        List<JsonObject> jsonList = new LinkedList<JsonObject>();
        
        for(Modelo modelo:modelos)
        {
            jsonObject = new JsonObject();
            jsonObject.addProperty("modeloCodigo", modelo.getModeloCodigo());
            jsonObject.addProperty("modeloNome", modelo.getModeloNome());
            jsonList.add(jsonObject);
        }
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonList.toString());
    }
}
