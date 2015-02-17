package SERVLET;

import DAO.EndereoDAO;
import POJO.Logradouro;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletConsultaEndereco extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String cep = request.getParameter("txtCondutorCep");
        EndereoDAO enderecoDao = new EndereoDAO();
        Logradouro logradouro = new Logradouro();
        logradouro = enderecoDao.buscarLogradouro(cep);
        
        RequestDispatcher rd = request.getRequestDispatcher("cadastroCondutor.jsp");
        request.setAttribute("logradouro", logradouro);
        rd.forward(request, response);
        
    }
}
