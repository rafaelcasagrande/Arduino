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
            
            function buscarSensor()
            {
               var macAddress = document.getElementById("txtSensorMacAddressBuscar").value;
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "buscarSensor");
               xmlHttpRequest.open("POST","ServletConsultarSensor",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send("macAddress=" + macAddress);  
            }
            
            function atualizar()
            {
                listarSensores();
                document.getElementById("txtSensorMacAddressBuscar").value = "";
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
                var latitude = document.getElementById("txtSensorLatitude").value;
                var longitude = document.getElementById("txtSensorLongitude").value;
                xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "alterarSensor");
                xmlHttpRequest.open("POST","ServletAlterarSensor",true);
                xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                xmlHttpRequest.send("sensorMacAddress=" + sensorMacAddress + "&" + "sensorCodigo=" + sensorCodigo + "&" + "logradouroCodigo=" + logradouroCodigo + "&" + "sensorNumeroLogradouro=" + sensorNumeroLogradouro + "&" + "latitude=" + latitude + "&" + "longitude=" + longitude);    
            }
            
            function getReadyStateHandler(xmlHttpRequest, tipo) {
            // an anonymous function returned
            // it listens to the XMLHttpRequest instance
            return function() {
                if (xmlHttpRequest.readyState == 4) {
                    if (xmlHttpRequest.status == 200) {
    
                        var respostaServlet = xmlHttpRequest.responseText;
                        
                        
                        if((tipo === "listarSensor") || (tipo === "buscarSensor"))
                        {
                            arrayListSensores = JSON.parse(respostaServlet);
                            
                            var table = document.getElementById("tableSensor");
                            var i;

                            if(tipo === "buscarSensor")
                            {
                                while(table.rows.length > 1) 
                                {
                                    table.deleteRow(1);
                                }
                            }

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
                                var celLatitude = row.insertCell(8);
                                var celLongitude = row.insertCell(9);
                                var celAlterar = row.insertCell(10);
                                var celExcluir = row.insertCell(11);

                                celCodigo.innerHTML = arrayListSensores[i].sensorCodigo;
                                celMacAddress.innerHTML = arrayListSensores[i].sensorMacAddress;
                                celCep.innerHTML = arrayListSensores[i].logradouroCep;
                                celLogradouro.innerHTML = arrayListSensores[i].logradouroNome;
                                celNumeroLogradouro.innerHTML = arrayListSensores[i].sensorNumeroLogradouro;
                                celBairro.innerHTML = arrayListSensores[i].bairroNome;
                                celCidade.innerHTML = arrayListSensores[i].cidadeNome;
                                celEstado.innerHTML = arrayListSensores[i].estadoNome;
                                celLatitude.innerHTML = arrayListSensores[i].sensorLatitude;
                                celLongitude.innerHTML = arrayListSensores[i].sensorLongitude;
                                celAlterar.innerHTML = "<button onclick=alterarSensor(" + i + ")> Alterar </button";
                                celExcluir.innerHTML = "<button onclick=excluirSensor(" + i + ")> Excluir </button>";
   
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
                        else if(tipo === "excluirSensor")
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
                    
                    document.getElementById("txtSensorLatitude").value = arrayListSensores[posicao].sensorLatitude;
                    document.getElementById("txtSensorLongitude").value = arrayListSensores[posicao].sensorLongitude;
                }
                
                function excluirSensor(posicao)
                {
                    sensorCodigo = arrayListSensores[posicao].sensorCodigo;
                    
                    xmlHttpRequest = getXMLHttpRequest();
                    xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "excluirSensor");
                    xmlHttpRequest.open("POST","ServletExcluirSensor",true);
                    xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                    xmlHttpRequest.send("codigoSensor=" + sensorCodigo);  
                }