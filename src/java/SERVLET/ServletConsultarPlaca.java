/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.VeiculoDAO;
import POJO.Veiculo;
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
public class ServletConsultarPlaca extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String placaVeiculo = request.getParameter("placaVeiculo").toString();
        VeiculoDAO veiculoDao = new VeiculoDAO();
        Veiculo veiculo = new Veiculo();
        
        veiculo = veiculoDao.buscarPlaca(placaVeiculo);
        
        JsonObject jsonVeiculo = new JsonObject();
        jsonVeiculo.addProperty("codigoVeiculo", veiculo.getVeiculoCodigo());
        jsonVeiculo.addProperty("modeloVeiculo", veiculo.getModelo().getModeloNome());
        jsonVeiculo.addProperty("marcaVeiculo", veiculo.getModelo().getMarca().getMarcaNome());
        jsonVeiculo.addProperty("corVeiculo", veiculo.getVeiculoCor());
        jsonVeiculo.addProperty("anoVeiculo", veiculo.getVeiculoAno());
        jsonVeiculo.addProperty("condutorVeiculo", veiculo.getCondutor().getCondutorNome());
        jsonVeiculo.addProperty("condutorCpf", veiculo.getCondutor().getCondutorCpf());
        
        List<JsonObject> jsonList = new LinkedList<JsonObject>();
        jsonList.add(jsonVeiculo);
        
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonList.toString());
    }
}
