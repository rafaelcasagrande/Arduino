
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Sensor</title>
    </head>
    <body>
        <script src="javascript/XMLHTTPRequest.js"></script>
        <script src="javascript/cadastroSensor.js"></script>
        <script src="http://js.arcgis.com/3.8/"></script>
        <script src="javascript/locator.js"></script>
        <div align="center" class="container">
            <h1> Sensor </h1>   
            <form role="form" class="form-inline">                
                <input style="width: 300px;" class="form-control" placeholder="Mac Address" type="text" id="txtSensorMacAddress" name="txtSensorMacAddress"><br><br>
                <input style="width: 300px;" class="form-control" onblur="consultarCep()" placeholder="CEP" type="text" id="txtSensorCep" name="txtSensorCep"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Numero Logradouro" type="text" id="txtNumeroLogradouro" name="txtNumeroLogradouro"><br><br>
                <label> Logradouro: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtSensorLogradouro" name="txtSensorLogradouro"><br><br>
                <label> Bairro: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtSensorBairro" name="txtSensorBairro"><br><br> 
                <label> Cidade: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtSensorCidade" name="txtSensorCidade"><br><br> 
                <label> Estado: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtSensorEstado" name="txtSensorEstado"><br> 
                <br>
                <button data-dojo-type="dijit/form/Button" name="btnLocate" id="btnLocate" value="Localizar"> </button>    
                <br>
                <br>
                <label> Latitude: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtSensorLatitude" name="txtSensorLatitude"><br><br>
                <label> Longitude: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtSensorLongitude" name="txtSensorLongitude"><br>
                <br>
 
                <button type="button" class="btn btn-default" id="btnSensorSalvar" name="btnSensorSalvar" onclick="cadastrarSensor()" >
                    Salvar <span class="glyphicon glyphicon-floppy-disk"></span>
                </button>
                
                <button type="button" class="btn btn-default" id="btnTagLimpar" name="btnSensorLimpar" onclick="limparCampos()">
                    Limpar <span class="glyphicon glyphicon-trash"></span>
                </button>
                
                <button type="button" onclick="direcionarInicio()" class="btn btn-default" id="btnTagVoltar" name="btnSensorVoltar">
                    Voltar <span class="glyphicon glyphicon-arrow-left"></span>
                </button>

            </form>
        </div>
    </body>
</html>
