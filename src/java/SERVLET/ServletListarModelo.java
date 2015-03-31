/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.ModeloDAO;
import POJO.Condutor;
import POJO.Marca;
import POJO.Modelo;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.json.JsonException;
import javax.servlet.RequestDispatcher;
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
        List<Modelo> modelosRefatorado = new LinkedList<>();
        Modelo modeloTemp;
        
        for(Modelo modelo:modelos)
        {
             modeloTemp = new Modelo();
             modeloTemp.setModeloCodigo(modelo.getModeloCodigo());
             modeloTemp.setModeloNome(modelo.getModeloNome());
             modelosRefatorado.add(modeloTemp);
        }
        
        Gson json = new Gson();
        String jsonModelos = json.toJson(modelosRefatorado);           
        resp.getWriter().write(jsonModelos);
    
    
    }
}
