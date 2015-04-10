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
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafael
 */
public class ServletCadastrarOcorrencia extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String veiculoCodigo = request.getParameter("veiculoCodigo");
        Date ocorrenciaInicio = new Date();
        String ocorrenciaStatus = "true";
        
        Veiculo veiculo = new Veiculo();
        veiculo.setVeiculoCodigo(Integer.parseInt(veiculoCodigo));
        
        Ocorrencia ocorrencia = new Ocorrencia();
        ocorrencia.setOcorrenciaInicio(ocorrenciaInicio);
        ocorrencia.setOcorrenciaStatus(ocorrenciaStatus);
        ocorrencia.setVeiculo(veiculo);
        
        OcorrenciaDAO ocorrenciaDao = new OcorrenciaDAO();
        
        boolean resultado = ocorrenciaDao.cadastrarOcorrencia(ocorrencia);
        
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
