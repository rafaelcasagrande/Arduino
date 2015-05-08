<%-- 
    Document   : index
    Created on : 17/02/2015, 15:43:13
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início</title>
        
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <link href="bootstrap/css/bootstrap-theme.css" rel="stylesheet">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
 
        
        
    </head>
    <body>   
        <form class="container">
            <div class="jumbotron" align="center">
                <h1>Estações Fiscalizadoras para Identificação de Veículos Delituosos</h1>
                <br>
                <form>
                    <input style="width: 300px;" class="form-control" placeholder="Login" type="text" id="txtUsuarioLogin" name="txtUsuarioLogin"><br>
                    <input style="width: 300px;" class="form-control" placeholder="Senha" type="password" id="txtUsuarioSenha" name="txtUsuarioSenha"><br>

                    <button type="button" style="width: 300px;" class="btn btn-primary btn-lg btn-block" id="btnUsuarioAcessar" name="btnUsuarioAcessar" onclick="realizarLogin()" >
                        Acessar
                    </button>
                </form>
            </div>
        <script src="javascript/XMLHTTPRequest.js"> </script>
        <script src="javascript/loginAcesso.js"></script>
        </form>
    </body>
</html>
