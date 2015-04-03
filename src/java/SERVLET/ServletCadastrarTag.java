/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.TagDao;
import POJO.Tag;
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
public class ServletCadastrarTag extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String codigoVeiculo = request.getParameter("codigoVeiculo").toString();
        String idTag = request.getParameter("idTag").toString();

        Veiculo veiculo = new Veiculo();
        veiculo.setVeiculoCodigo(Integer.parseInt(codigoVeiculo));
        
        Tag tag = new Tag();
        tag.setVeiculo(veiculo);
        tag.setTagId(idTag);

        TagDao tagDao = new TagDao();
        boolean resultado = false;
        resultado = tagDao.cadastrarTag(tag);
        
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
