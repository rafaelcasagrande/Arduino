
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sensor</title>
    </head>
    <body>
        
        
        <div align="center" class="form-inline  container">
            <h1> Sensor </h1> 

            <input style="width: 300px;" class="form-control" placeholder="Mac Address" type="text" id="txtSensorMacAddressBuscar" name="txtSensorMacAddressBuscar">            

            <button type="button" onclick="buscarSensor()" class="btn btn-default" name="btnPesquisar" id="btnPesquisar">
                <span class="glyphicon glyphicon-search"></span>
            </button>
            
            <button type="button" onclick="atualizar()" class="btn btn-default" name="btnAtualizar" id="btnAtualizar">
                <span class="glyphicon glyphicon-refresh"></span>
            </button>
            
            
            <br>
            <br>

            <table id="tableSensor" class="table table-striped">
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
            <form role="form" >
                
                <div class="row">
                    <div class="col-md-3">
                        <label> Mac Address </label> <input class="form-control" type="text" id="txtSensorMacAddress" name="txtSensorMacAddress"><br><br>
                        <label> CEP </label> <input class="form-control" onblur="consultarCep()" type="text" id="txtSensorCep" name="txtSensorCep"><br><br>
                        <label> N. Logradouro </label> <input class="form-control" type="text" id="txtNumeroLogradouro" name="txtNumeroLogradouro"><br>
                    </div>
                    <div class="col-md-3">
                        <label> Logradouro: </label> <input disabled class="form-control" type="text" id="txtSensorLogradouro" name="txtSensorLogradouro"><br><br> 
                        <label> Bairro: </label> <input disabled class="form-control" type="text" id="txtSensorBairro" name="txtSensorBairro"><br><br>
                        <label> Cidade: </label>  <input disabled class="form-control" type="text" id="txtSensorCidade" name="txtSensorCidade"><br><br> 
                        <label> Estado: </label>  <input disabled class="form-control" type="text" id="txtSensorEstado" name="txtSensorEstado"><br> 
                    </div>
                    <div class="col-md-3">
                        <button data-dojo-type="dijit/form/Button" name="btnLocate" id="btnLocate" value="Localizar"> </button><br>    
                        <br>
                        <label> Latitude: </label> <input disabled class="form-control" type="text" id="txtSensorLatitude" name="txtSensorLatitude"><br><br>
                        <label> Longitude: </label> <input disabled class="form-control" type="text" id="txtSensorLongitude" name="txtSensorLongitude"><br>
                    </div>
                    <div class="col-md-3">
                        <button type="button" onclick="alterarDadosSensor()" class="btn btn-default" name="btnSensorSalvar" id="btnSensorSalvar">
                            Salvar <span class="glyphicon glyphicon-floppy-disk"></span>
                        </button>
                        <button type="button" onclick="limparCampos()" class="btn btn-default" name="btnSensorLimpar" id="btnSensorLimpar">
                            Limpar <span class="glyphicon glyphicon-trash"></span>
                        </button>   
                        <button type="button" onclick="direcionarInicio()" class="btn btn-default" name="btnSensorVoltar" id="btnSensorVoltar">
                            Voltar <span class="glyphicon glyphicon-arrow-left"></span>
                        </button>
                    </div>
                </div>
            </form>
        </div>    
        
        <script src="javascript/XMLHTTPRequest.js"> </script>
        <script src="javascript/listarSensor.js"> </script>
        <script src="http://js.arcgis.com/3.8/"></script>
        <script src="javascript/locator.js"></script>
        
    </body>
</html>
