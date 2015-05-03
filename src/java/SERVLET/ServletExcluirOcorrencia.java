/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.OcorrenciaDAO;
import POJO.Ocorrencia;
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
public class ServletExcluirOcorrencia extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean resultado = false;
        String codigoOcorrencia = request.getParameter("codigoOcorrencia");
        
        Ocorrencia ocorrencia = new Ocorrencia();
        ocorrencia.setOcorrenciaCodigo(Integer.parseInt(codigoOcorrencia));
        
        OcorrenciaDAO ocorrenciaDao = new OcorrenciaDAO();
        resultado = ocorrenciaDao.excluirOcorrencia(ocorrencia);
        
        if(resultado)
        {
            response.getWriter().write("true");
        }
        else
        {
            response.getWriter().write("true");
        }
    }
}
