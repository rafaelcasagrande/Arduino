/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.TagDao;
import POJO.Tag;
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
public class ServletListarTag extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        TagDao tagDao = new TagDao();
        List<Tag> tags = new LinkedList<Tag>();
        
        tags = tagDao.listarTag();
        List<JsonObject> jsonObjectList = new LinkedList<JsonObject>();
        JsonObject jsonObject;
        
        for(Tag tag:tags)
        {
            jsonObject = new JsonObject();
            
            jsonObject.addProperty("tagCodigo", tag.getTagCodigo());
            jsonObject.addProperty("tagId", tag.getTagId());
            jsonObject.addProperty("veiculoPlaca", tag.getVeiculo().getVeiculoPlaca());
            jsonObject.addProperty("veiculoCodigo", tag.getVeiculo().getVeiculoCodigo());
            jsonObject.addProperty("modeloNome", tag.getVeiculo().getModelo().getModeloNome());
            jsonObject.addProperty("marcaNome", tag.getVeiculo().getModelo().getMarca().getMarcaNome());
            jsonObject.addProperty("veiculoCor", tag.getVeiculo().getVeiculoCor());
            jsonObject.addProperty("veiculoAno", tag.getVeiculo().getVeiculoAno());
            jsonObject.addProperty("condutorNome", tag.getVeiculo().getCondutor().getCondutorNome());
            jsonObject.addProperty("condutorCpf", tag.getVeiculo().getCondutor().getCondutorCpf());
            jsonObject.addProperty("condutorHabilitacao", tag.getVeiculo().getCondutor().getCondutorHabilitacao());
            jsonObjectList.add(jsonObject);
        }
        
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonObjectList.toString());
    }
}
