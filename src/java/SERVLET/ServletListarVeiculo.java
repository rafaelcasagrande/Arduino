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
public class ServletListarVeiculo extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Veiculo> veiculos = new LinkedList<Veiculo>();
        VeiculoDAO veiculoDao = new VeiculoDAO();
        veiculos = veiculoDao.listarVeiculo();
        JsonObject jsonObject;
        List<JsonObject> jsonObjectList = new LinkedList<JsonObject>();
        
        String dataNascimento = "";
        String[] arrayDataNascimento;
        
        
        for(Veiculo veiculo:veiculos)
        {
            arrayDataNascimento = veiculo.getCondutor().getCondutorDataNascimento().toString().split("-");
            dataNascimento = arrayDataNascimento[2] + "/" + arrayDataNascimento[1] + "/" + arrayDataNascimento[0];
            
            jsonObject = new JsonObject();
            jsonObject.addProperty("veiculoAno", veiculo.getVeiculoAno());
            jsonObject.addProperty("veiculoCodigo", veiculo.getVeiculoCodigo());
            jsonObject.addProperty("veiculoCor", veiculo.getVeiculoCor());
            jsonObject.addProperty("veiculoPlaca", veiculo.getVeiculoPlaca());
            jsonObject.addProperty("veiculoStatus", veiculo.getVeiculoStatus());
            jsonObject.addProperty("condutorNome", veiculo.getCondutor().getCondutorNome());
            jsonObject.addProperty("condutorCodigo", veiculo.getCondutor().getCondutorCodigo());
            jsonObject.addProperty("condutorCpf", veiculo.getCondutor().getCondutorCpf());
            jsonObject.addProperty("condutorHabilitacao", veiculo.getCondutor().getCondutorHabilitacao());
            jsonObject.addProperty("modeloNome", veiculo.getModelo().getModeloNome());
            jsonObject.addProperty("modeloCodigo", veiculo.getModelo().getModeloCodigo());
            jsonObject.addProperty("marcaNome", veiculo.getModelo().getMarca().getMarcaNome());
            jsonObject.addProperty("marcaCodigo", veiculo.getModelo().getMarca().getMarcaCodigo());
            jsonObject.addProperty("condutorDataNascimento", dataNascimento);
            jsonObjectList.add(jsonObject);
        }
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObjectList.toString());
    }
}
