/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import DAO.UsuarioDAO;
import POJO.Usuario;
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
public class ServletAlterarUsuario extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String login = request.getParameter("usuarioLogin");
        String senhaAntiga = request.getParameter("usuarioSenhaAntiga");
        String senhaNova = request.getParameter("usuarioSenhaNova");
        
        Usuario usuarioAntigo = new Usuario();
        usuarioAntigo.setUsuarioLogin(login);
        usuarioAntigo.setUsuarioSenha(senhaAntiga);
        
        Usuario usuarioNovo = new Usuario();
        usuarioNovo.setUsuarioLogin(login);
        usuarioNovo.setUsuarioSenha(senhaNova);
        
        boolean resultado = false;
        UsuarioDAO usuarioDao = new UsuarioDAO();
        resultado = usuarioDao.alterarSenha(usuarioAntigo, usuarioNovo);
        
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
