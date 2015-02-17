<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        
        <script src="../jquery/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
        <script src="../bootstrap/js/bootstrap.min.js"></script>

        <div class="container">
            
            <nav class="navbar navbar-default" role="navigation">

                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu-principal">
                        <span class="sr-only">Toggle navigation</span>
                      </button>
                    </div>

                    <div class="collapse navbar-collapse" id="navbar-menu-principal">
                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Condutor <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                              <li><a href="#">Cadastrar</a></li>
                              <li><a href="#">Consultar</a></li>
                              <li><a href="#">Alterar</a></li>
                              <li><a href="#">Excluir</a></li>
                            </ul>
                          </li>
                       </ul> 

                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Veículo <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                              <li><a href="#">Cadastrar</a></li>
                              <li><a href="#">Consultar</a></li>
                              <li><a href="#">Alterar</a></li>
                              <li><a href="#">Excluir</a></li>
                            </ul>
                          </li>
                        </ul>  

                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tag <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                              <li><a href="#">Cadastrar</a></li>
                              <li><a href="#">Consultar</a></li>
                              <li><a href="#">Alterar</a></li>
                              <li><a href="#">Excluir</a></li>
                            </ul>
                          </li>
                       </ul> 

                        <ul class="nav navbar-nav">
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sensor <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                              <li><a href="#">Cadastrar</a></li>
                              <li><a href="#">Consultar</a></li>
                              <li><a href="#">Alterar</a></li>
                              <li><a href="#">Excluir</a></li>
                            </ul>
                          </li>
                       </ul>  
                    </div>
                </div> 
            </nav>           
        </div> 
    </head>
   
    <body>
        
    </body>
</html>
