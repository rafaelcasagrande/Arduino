<%-- 
    Document   : listarSensor
    Created on : 05/04/2015, 10:13:50
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
                <input style="width: 300px;" class="form-control" placeholder="Latitude" type="text" id="txtSensorLatitude" name="txtSensorLatitude"><br>
                <input style="width: 300px;" class="form-control" placeholder="Longitude" type="text" id="txtSensorLongitude" name="txtSensorLongitude"><br>
                
                
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
        
        
        <script>
            
            window.onload = listarSensores();
            var arrayListSensores;
            var sensorCodigo;
            var logradouroCodigo;
            
            function listarSensores()
            {
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "listarSensor");
               xmlHttpRequest.open("POST","ServletListarSensor",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send(null);  
            }
            
            function consultarCep()
            {

               xmlHttpRequest = getXMLHttpRequest();
               var cep = document.getElementById("txtSensorCep").value;
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "consultaCep");
               xmlHttpRequest.open("POST","ServletConsultaEndereco",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send("cep=" + cep);              
            }
            
            function alterarDadosSensor()
            {
                var sensorNumeroLogradouro = document.getElementById("txtNumeroLogradouro").value;
                var sensorMacAddress = document.getElementById("txtSensorMacAddress").value;
                xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "alterarSensor");
                xmlHttpRequest.open("POST","ServletAlterarSensor",true);
                xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                xmlHttpRequest.send("sensorMacAddress=" + sensorMacAddress + "&" + "sensorCodigo=" + sensorCodigo + "&" + "logradouroCodigo=" + logradouroCodigo + "&" + "sensorNumeroLogradouro=" + sensorNumeroLogradouro);    
            }
            
            function getXMLHttpRequest() 
            {
                var xmlHttpReq = false;
                // to create XMLHttpRequest object in non-Microsoft browsers
                if (window.XMLHttpRequest) {
                        xmlHttpReq = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                        try {
                                // to create XMLHttpRequest object in later versions
                                // of Internet Explorer
                                xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                        } catch (exp1) {
                                try {
                                        // to create XMLHttpRequest object in older versions
                                        // of Internet Explorer
                                        xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                                } catch (exp2) {
                                        xmlHttpReq = false;
                                }
                        }
                }
                return xmlHttpReq;
            }
            
            function getReadyStateHandler(xmlHttpRequest, tipo) {
            // an anonymous function returned
            // it listens to the XMLHttpRequest instance
            return function() {
                if (xmlHttpRequest.readyState == 4) {
                    if (xmlHttpRequest.status == 200) {
    
                        var respostaServlet = xmlHttpRequest.responseText;
                        
                        
                        if(tipo === "listarSensor")
                        {
                            arrayListSensores = JSON.parse(respostaServlet);
                            
                            var table = document.getElementById("tableSensor");
                            var i;

                            for (i = 0; i < arrayListSensores.length; i++)
                            {
                                var row = table.insertRow(i+1);
                                
                                var celCodigo = row.insertCell(0);
                                var celMacAddress = row.insertCell(1);
                                var celCep = row.insertCell(2);
                                var celLogradouro = row.insertCell(3);
                                var celNumeroLogradouro = row.insertCell(4);
                                var celBairro = row.insertCell(5);
                                var celCidade = row.insertCell(6);
                                var celEstado = row.insertCell(7);
                                var celAlterar = row.insertCell(8);
                                var celExcluir = row.insertCell(9);

                                celCodigo.innerHTML = arrayListSensores[i].sensorCodigo;
                                celMacAddress.innerHTML = arrayListSensores[i].sensorMacAddress;
                                celCep.innerHTML = arrayListSensores[i].logradouroCep;
                                celLogradouro.innerHTML = arrayListSensores[i].logradouroNome;
                                celNumeroLogradouro.innerHTML = arrayListSensores[i].sensorNumeroLogradouro;
                                celBairro.innerHTML = arrayListSensores[i].bairroNome;
                                celCidade.innerHTML = arrayListSensores[i].cidadeNome;
                                celEstado.innerHTML = arrayListSensores[i].estadoNome;
                                celAlterar.innerHTML = "<button onclick=alterarSensor(" + i + ")> Alterar </button";
                                celExcluir.innerHTML = "<button> Excluir </button>";
   
                            }
                        }
                        else if(tipo === "consultaCep")
                        {
                            var arr = JSON.parse(respostaServlet);

                            document.getElementById("txtSensorLogradouro").value = arr[0].logradouroNome;
                            document.getElementById("txtSensorCep").value = arr[0].logradouroCep;
                            document.getElementById("txtSensorBairro").value = arr[0].logradouroBairro;
                            document.getElementById("txtSensorCidade").value = arr[0].logradouroCidade;
                            document.getElementById("txtSensorEstado").value = arr[0].logradouroEstado;
                            logradouroCodigo = arr[0].logradouroCodigo;
                        }
                        else if(tipo === "alterarSensor")
                        {
                            alert(respostaServlet);
                            location.reload();
                        }

                    } else {
                                alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
                            }
                        }
                    };
                }
                
                function alterarSensor(posicao)
                {
                    sensorCodigo = arrayListSensores[posicao].sensorCodigo;
                    logradouroCodigo = arrayListSensores[posicao].logradouroCodigo;
  
                    document.getElementById("txtSensorMacAddress").value =  arrayListSensores[posicao].sensorMacAddress;
                    document.getElementById("txtSensorCep").value = arrayListSensores[posicao].logradouroCep;
                    document.getElementById("txtNumeroLogradouro").value = arrayListSensores[posicao].sensorNumeroLogradouro;
                    
                    document.getElementById("txtSensorLogradouro").value =  arrayListSensores[posicao].logradouroNome;
                    document.getElementById("txtSensorBairro").value = arrayListSensores[posicao].bairroNome;
                    document.getElementById("txtSensorCidade").value = arrayListSensores[posicao].cidadeNome;
                    document.getElementById("txtSensorEstado").value = arrayListSensores[posicao].estadoNome;
                }
        </script>
        
        
    </body>
</html>
