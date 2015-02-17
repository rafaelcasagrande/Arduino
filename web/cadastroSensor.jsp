<%-- 
    Document   : cadastroSensor
    Created on : 17/02/2015, 10:40:02
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div align="center">
            <h1> Sensor </h1>   
            <form role="form" class="form-inline">
                
                <input style="width: 300px;" class="form-control" placeholder="Latitude" type="text" id="txtSensorLatitude" name="txtSensorLatitude"><br>
            
                <input style="width: 300px;" class="form-control" placeholder="Longitude" type="text" id="txtSensorLongitude" name="txtSensorLongitude"><br>
                
                <input style="width: 300px;" class="form-control" placeholder="CEP" type="text" id="txtSensorCep" name="txtSensorCep"><br>

                <input style="width: 300px;" class="form-control" placeholder="Logradouro" type="text" id="txtCondutorLogradouro" name="txtCondutorLogradouro"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Bairro" type="text" id="txtCondutorBairro" name="txtCondutorBairro"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Cidade" type="text" id="txtCondutorCidade" name="txtCondutorCidade"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Estado" type="text" id="txtCondutorEstado" name="txtCondutorEstado"><br> 
            
                <button type="button" class="btn btn-default" name="btnSensorSalvar" id="btnSensorSalvar">
                    Salvar
                </button>    
                
                <button type="button" class="btn btn-default" name="btnSensorLimpar" id="btnSensorLimpar">
                    Limpar
                </button>
                
                <button type="button" class="btn btn-default" name="btnSensorVoltar" id="btnSensorVoltar">
                    Voltar
                </button>
                
            </form>
        </div>
        
    </body>
</html>
