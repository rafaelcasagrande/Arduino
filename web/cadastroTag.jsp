<%-- 
    Document   : cadastroTag
    Created on : 16/02/2015, 18:20:16
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Tag</title>
    </head>
    <body>
        <div align="center">
            <h1> Tag </h1>   
            <form role="form" class="form-inline">
                <input style="width: 300px;" class="form-control" placeholder="ID" type="text" id="txtTagId" name="txtTagId"><br>

                <input style="width: 300px;" class="form-control" placeholder="Emplacamento do Veículo" type="text" id="txtPlacaVeiculo" name="txtPlacaVeiculo"><br>
                
                <button type="button" class="btn btn-default" name="btnTagBuscarVeiculo" id="btnTagBuscarVeiculo">
                    Buscar
                </button>
                
                <button type="button" class="btn btn-default" name="btnTagSalvar" id="btnTagSalvar">
                    Salvar
                </button>    
                
                <button type="button" class="btn btn-default" name="btnTagLimpar" id="btnTagLimpar">
                    Limpar
                </button>    
                
                <button type="button" class="btn btn-default" name="btnTagVoltar" id="btnTagVoltar">
                    Voltar
                </button>
                
            </form>
        </div>
    </body>
</html>
