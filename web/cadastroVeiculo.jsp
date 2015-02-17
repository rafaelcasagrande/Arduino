<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Veículo</title>
    </head>
    <body>
        
        <div align="center">
            <h1> Cadastrar Veículo </h1>   
            <form role="form" class="form-inline">
                <input style="width: 300px;" class="form-control" placeholder="Placa" type="text" id="txtVeiculoPlaca" name="txtVeiculoPlaca"><br>
                <input style="width: 300px;" class="form-control" placeholder="Cor" type="text" id="txtVeiculoCor" name="txtVeiculoCor"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Ano" type="text" id="txtVeiculoAno" name="txtVeiculoAno"><br> 
                
                <select>
                    <c:forEach var="marca" items="${marcas}" varStatus="loop">
                        <option value="${marca.getMarcaCodigo()}"> ${marca.getMarcaNome()} </option>
                    </c:forEach>  
                </select>
                
                <br> 

                <input style="width: 300px;" class="form-control" placeholder="Modelo" type="text" id="txtVeiculoModelo" name="txtVeiculoModelo"><br> 
            
                <select>
                    <option value="cpf" > CPF </option>
                    <option value="habilitacao" > Habilitação </option>
                </select>
                
                <input style="width: 300px;" class="form-control" placeholder="Condutor" type="text" id="txtCondutor" name="txtCondutor"><br> 
                
                <button type="button" class="btn btn-default" id="btnCondutorBuscar" name="btnCondutorBuscar">
                    Buscar
                </button>
                
                <button type="button" class="btn btn-default" id="btnCondutorSalvar" name="btnCondutorSalvar">
                    Salvar
                </button>
                
                <button type="button" class="btn btn-default" id="btnCondutorLimpar" name="btnCondutorLimpar">
                    Limpar
                </button>
                
                <button type="button" class="btn btn-default" id="btnCondutorVoltar" name="btnCondutorVoltar">
                    Voltar
                </button>
                
            </form>
        </div>
        
    </body>
</html>
