/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.MarcaDAO;
import POJO.Marca;
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
public class ServletListarMarca extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        MarcaDAO marcaDao = new MarcaDAO();
        List<Marca> marcas = new LinkedList<Marca>();
        marcas = marcaDao.listarMarcas();
 
        JsonObject jsonObject;
        List<JsonObject> jsonList = new LinkedList<JsonObject>();
        
        for(Marca marca:marcas)
        {
            jsonObject = new JsonObject();
            jsonObject.addProperty("marcaCodigo", marca.getMarcaCodigo());
            jsonObject.addProperty("marcaNome", marca.getMarcaNome());
            jsonList.add(jsonObject);
        }
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonList.toString());
    }
}
