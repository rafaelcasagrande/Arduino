/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.CondutorDAO;
import POJO.Condutor;
import POJO.Logradouro;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafael
 */
public class ServletAlterarCondutor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        Date dataNascimento = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        
        String codigoCondutor = request.getParameter("condutorCodigo").toString();
        String nomeCondutor = request.getParameter("nomeCondutor").toString();
        String cpfCondutor = request.getParameter("cpfCondutor").toString();
        String habilitacaoCondutor = request.getParameter("habilitacaoCondutor").toString();
        String numeroLogradouroCondutor = request.getParameter("numeroLogradouro").toString();
        String codigoLogradouro = request.getParameter("logradouroCodigo").toString();
        
        try
        {
            dataNascimento = formatter.parse(request.getParameter("dataNascimentoCondutor").toString());  
        }
        catch(ParseException ex)
        {
            ex.printStackTrace();
        }
        
        Logradouro logradouro = new Logradouro();
        logradouro.setLogradouroCodigo(Integer.parseInt(codigoLogradouro));
        
        Condutor condutor = new Condutor();
        condutor.setCondutorCodigo(Integer.parseInt(codigoCondutor));
        condutor.setCondutorCpf(cpfCondutor);
        condutor.setCondutorDataNascimento(dataNascimento);
        condutor.setCondutorHabilitacao(habilitacaoCondutor);
        condutor.setCondutorNome(nomeCondutor);
        condutor.setCondutorNumeroLogradouro(numeroLogradouroCondutor);
        condutor.setLogradouro(logradouro);

        boolean resultado = false;
        
        CondutorDAO condutorDao = new CondutorDAO();
        
        resultado = condutorDao.alterarCondutor(condutor);
        
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
