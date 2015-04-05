/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.VeiculoDAO;
import POJO.Condutor;
import POJO.Modelo;
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
public class ServletAlterarVeiculo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String veiculoCodigo = request.getParameter("veiculoCodigo").toString();
        String veiculoPlaca = request.getParameter("veiculoPlaca").toString();
        String veiculoCor = request.getParameter("veiculoCor").toString();
        String veiculoAno = request.getParameter("veiculoAno").toString();
        String modeloCodigo = request.getParameter("modeloCodigo").toString();
        String condutorCodigo = request.getParameter("condutorCodigo").toString();
        
        Modelo modelo = new Modelo();
        modelo.setModeloCodigo(modeloCodigo);
        
        Condutor condutor = new Condutor();
        condutor.setCondutorCodigo(Integer.parseInt(condutorCodigo));
        
        Veiculo veiculo = new Veiculo();
        veiculo.setVeiculoCodigo(Integer.parseInt(veiculoCodigo));
        veiculo.setVeiculoAno(Integer.parseInt(veiculoAno));
        veiculo.setVeiculoCor(veiculoCor);
        veiculo.setVeiculoPlaca(veiculoPlaca);
        veiculo.setCondutor(condutor);
        veiculo.setModelo(modelo);

        boolean resultado = false;
        VeiculoDAO veiculoDao = new VeiculoDAO();
        resultado = veiculoDao.alterarVeiculo(veiculo);
        
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
