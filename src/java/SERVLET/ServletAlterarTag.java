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
public class ServletAlterarTag extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
        String tagCodigo = request.getParameter("codigoTag").toString();
        String tagId = request.getParameter("tagId").toString();
        String veiculoCodigo = request.getParameter("codigoVeiculo").toString();
        
        Veiculo veiculo = new Veiculo();
        veiculo.setVeiculoCodigo(Integer.parseInt(veiculoCodigo));

        Tag tag = new Tag();
        tag.setTagCodigo(Integer.parseInt(tagCodigo));
        tag.setTagId(tagId);
        tag.setVeiculo(veiculo);
        
        boolean resultado = false;
        TagDao tagDao = new TagDao();
        resultado = tagDao.alterarTag(tag);
        
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
