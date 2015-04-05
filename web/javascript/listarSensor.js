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