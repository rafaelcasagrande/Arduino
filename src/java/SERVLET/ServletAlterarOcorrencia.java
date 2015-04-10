/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.OcorrenciaDAO;
import POJO.Ocorrencia;
import POJO.Veiculo;
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
public class ServletAlterarOcorrencia extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String ocorrenciaCodigo = request.getParameter("ocorrenciaCodigo");
        String veiculoCodigo = request.getParameter("veiculoCodigo");
        
        Veiculo veiculo = new Veiculo();
        veiculo.setVeiculoCodigo(Integer.parseInt(veiculoCodigo));
        
        Ocorrencia ocorrencia = new Ocorrencia();
        ocorrencia.setOcorrenciaCodigo(Integer.parseInt(ocorrenciaCodigo));
        ocorrencia.setVeiculo(veiculo);
        
        boolean resultado = false;
        OcorrenciaDAO ocorrenciaDao = new OcorrenciaDAO();
        resultado = ocorrenciaDao.alterarOcorrencia(ocorrencia);
        
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
