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
public class ServletCadastrarVeiculo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String placa = request.getParameter("placa").toString();
        String cor = request.getParameter("cor").toString();
        String ano = request.getParameter("ano").toString();
        String codigoModelo = request.getParameter("modeloCodigo").toString();
        String codigoCondutor = request.getParameter("condutorCodigo").toString();

        Condutor condutor = new Condutor();
        condutor.setCondutorCodigo(Integer.parseInt(codigoCondutor));

        Modelo modelo = new Modelo();
        modelo.setModeloCodigo(codigoModelo);
        
        Veiculo veiculo = new Veiculo();
        veiculo.setVeiculoAno(Integer.parseInt(ano));
        veiculo.setVeiculoCor(cor);
        veiculo.setVeiculoPlaca(placa);
        veiculo.setModelo(modelo);
        veiculo.setCondutor(condutor);

        boolean resultado = false;
        VeiculoDAO veiculoDao = new VeiculoDAO();
        resultado = veiculoDao.cadastrarVeiculo(veiculo);
        
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
