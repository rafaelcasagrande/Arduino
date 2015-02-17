/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.MarcaDAO;
import POJO.Marca;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        MarcaDAO marcaDao = new MarcaDAO();
        
        List<Marca> marcas = new LinkedList<Marca>();
        
        marcas = marcaDao.listarMarcas();
        
        RequestDispatcher rd = request.getRequestDispatcher("cadastroVeiculo.jsp");
        request.setAttribute("marcas", marcas);
        rd.forward(request, response);
        
    }
}
