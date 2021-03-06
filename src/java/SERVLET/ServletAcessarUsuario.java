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
public class ServletAcessarUsuario extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String login = request.getParameter("usuarioLogin");
        String senha = request.getParameter("usuarioSenha");
        
        Usuario usuario = new Usuario();
        usuario.setUsuarioLogin(login);
        usuario.setUsuarioSenha(senha);
        
        boolean resultado = false;
        UsuarioDAO usuarioDao = new UsuarioDAO();
        resultado = usuarioDao.realizarLogin(usuario);
        
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
