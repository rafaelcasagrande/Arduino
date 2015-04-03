/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.VeiculoDAO;
import POJO.Veiculo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
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
        
        String modelo = veiculo.getModelo().getModeloNome();
        String marca = veiculo.getModelo().getMarca().getMarcaNome();
        String cor = veiculo.getVeiculoCor();
        int ano = veiculo.getVeiculoAno();
        String condutor = veiculo.getCondutor().getCondutorNome();
        String cpf = veiculo.getCondutor().getCondutorCpf();
        int codigoVeiculo = veiculo.getVeiculoCodigo();
        
        JsonObject jsonVeiculo = new JsonObject();
        jsonVeiculo.addProperty("codigoVeiculo", codigoVeiculo);
        jsonVeiculo.addProperty("modeloVeiculo", modelo);
        jsonVeiculo.addProperty("marcaVeiculo", marca);
        jsonVeiculo.addProperty("corVeiculo", cor);
        jsonVeiculo.addProperty("anoVeiculo", ano);
        jsonVeiculo.addProperty("condutorVeiculo", condutor);
        jsonVeiculo.addProperty("condutorCpf", cpf);
        
        List<JsonObject> jsonList = new LinkedList<JsonObject>();
        jsonList.add(jsonVeiculo);
        
        Gson gson = new Gson();
        String gsonString = gson.toJson(jsonList);
        response.getWriter().write(gsonString);
        
    }
}
