<%-- 
    Document   : cadastroUsuario
    Created on : 07/05/2015, 20:47:40
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Usuário</title>
    </head>
    <body>
        <div align="center" class="container">
            <h1> Usuário </h1>   
            <form role="form" class="form-inline">
                <input style="width: 300px;" class="form-control" onblur="validarUsuario()" placeholder="Login" type="text" id="txtUsuarioLogin" name="txtUsuarioLogin"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Senha" type="password" id="txtUsuarioSenha" name="txtUsuarioSenha"><br><br>
                <input style="width: 300px;" class="form-control" onblur="validarSenha()" placeholder="Confirmar Senha" type="password" id="txtUsuarioConfirmaSenha" name="txtUsuarioConfirmaSenha"><br>
                <br>
                <button type="button" class="btn btn-default" id="btnUsuarioSalvar" name="btnUsuarioSalvar" onclick="cadastrarUsuario()" >
                    Salvar <span class="glyphicon glyphicon-floppy-disk"></span>
                </button>
                
                <button type="button" class="btn btn-default" id="btnUsuarioLimpar" name="btnUsuarioLimpar" onclick="limparCampos()">
                    Limpar <span class="glyphicon glyphicon-trash"></span>
                </button>
                
                <button type="button" onclick="direcionarInicio()" class="btn btn-default" id="btnUsuarioVoltar" name="btnUsuarioVoltar">
                    Voltar <span class="glyphicon glyphicon-arrow-left"></span>
                </button>
            </form>
        </div>
        <script src="javascript/XMLHTTPRequest.js"> </script>
        <script src="javascript/cadastroUsuario.js"></script>
    </body>
</html>
