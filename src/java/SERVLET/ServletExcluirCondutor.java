/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.CondutorDAO;
import POJO.Condutor;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafael
 */
public class ServletExcluirCondutor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean resultado = false;
        String codigoCondutor  = request.getParameter("codigoCondutor");
        
        Condutor condutor = new Condutor();
        condutor.setCondutorCodigo(Integer.parseInt(codigoCondutor));
        
        CondutorDAO condutorDao = new CondutorDAO();
        resultado = condutorDao.excluirCondutor(condutor);
        
        if(resultado)
        {
            response.getWriter().write("true");
        }
        else
        {
            response.getWriter().write("false");
        }
        
    }
}
