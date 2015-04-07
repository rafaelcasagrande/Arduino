
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
            <table id="tableSensor" border="1">
                <tr>
                    <th> Código </th>
                    <th> Mac Address </th>
                    <th> CEP </th>
                    <th> Logradouro </th>
                    <th> N. Logradouro </th>
                    <th> Bairro </th>
                    <th> Cidade </th>
                    <th> Estado</th>
                    <th> Latitude </th>
                    <th> Longitude </th>
                    <th> Alterar</th>
                    <th> Excluir</th>
                </tr>
            </table>
            <br>
            <form role="form" class="form-inline">
                
                <input style="width: 300px;" class="form-control" placeholder="Mac Address" type="text" id="txtSensorMacAddress" name="txtSensorMacAddress"><br>
                <br>
                <input style="width: 300px;" class="form-control" onblur="consultarCep()" placeholder="CEP" type="text" id="txtSensorCep" name="txtSensorCep"><br>
                <input style="width: 300px;" class="form-control" placeholder="Numero Logradouro" type="text" id="txtNumeroLogradouro" name="txtNumeroLogradouro"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Logradouro" type="text" id="txtSensorLogradouro" name="txtSensorLogradouro"><br> 
                <input disabled style="width: 300px;" class="form-control" placeholder="Bairro" type="text" id="txtSensorBairro" name="txtSensorBairro"><br> 
                <input disabled style="width: 300px;" class="form-control" placeholder="Cidade" type="text" id="txtSensorCidade" name="txtSensorCidade"><br> 
                <input disabled style="width: 300px;" class="form-control" placeholder="Estado" type="text" id="txtSensorEstado" name="txtSensorEstado"><br> 
                <br>
                <button data-dojo-type="dijit/form/Button" name="btnLocate" id="btnLocate" value="Localizar"> </button>    
                <br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Latitude" type="text" id="txtSensorLatitude" name="txtSensorLatitude"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Longitude" type="text" id="txtSensorLongitude" name="txtSensorLongitude"><br>
                <br>
                <button type="button" onclick="alterarDadosSensor()" class="btn btn-default" name="btnSensorSalvar" id="btnSensorSalvar">
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
        
        <script src="javascript/XMLHTTPRequest.js"> </script>
        <script src="javascript/listarSensor.js"> </script>
        <script src="http://js.arcgis.com/3.8/"></script>
        <script src="javascript/locator.js"></script>
        
    </body>
</html>
