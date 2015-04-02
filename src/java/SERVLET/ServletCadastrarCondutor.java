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


public class ServletCadastrarCondutor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        Date dataNascimento = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                
        String nome = req.getParameter("nomeCondutor");
        String cpf = req.getParameter("cpfCondutor");
        String habilitacao = req.getParameter("habilitacaoCondutor");
        String numeroLogradouro = req.getParameter("numeroLogradouroCondutor");
        String idLogradouro = req.getParameter("idLogradouro");

        try
        {
            dataNascimento = formatter.parse(req.getParameter("dataNascimentoCondutor").toString());  
        }
        catch(ParseException ex)
        {
            ex.printStackTrace();
        }
        
        Logradouro logradouro = new Logradouro();
        logradouro.setLogradouroCodigo(Integer.parseInt(idLogradouro));
        
        Condutor condutor = new Condutor();
        condutor.setCondutorCpf(cpf);
        condutor.setCondutorDataNascimento(dataNascimento);
        condutor.setCondutorHabilitacao(habilitacao);
        condutor.setCondutorNome(nome);
        condutor.setCondutorNumeroLogradouro(numeroLogradouro);
        condutor.setLogradouro(logradouro);
        
        CondutorDAO dao = new CondutorDAO();
        boolean resultado = dao.cadastrarCondutor(condutor);
        
        if(resultado)
        {
            resp.getWriter().write("true");
        }
        else
        {
            resp.getWriter().write("false");
        }

    }
}
