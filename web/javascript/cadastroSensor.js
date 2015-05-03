/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var logradouroCodigo;
        var xmlHttpRequest;
        
  
            function consultarCep()
            {

               xmlHttpRequest = getXMLHttpRequest();
               var cep = document.getElementById("txtSensorCep").value;
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "consultaCep");
               xmlHttpRequest.open("POST","ServletConsultaEndereco",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send("cep=" + cep);              
            }
            
            function limparCampos()
            {
                document.getElementById("txtSensorMacAddress").value = "";
                document.getElementById("txtNumeroLogradouro").value = "";
                document.getElementById("txtSensorLatitude").value = "";
                document.getElementById("txtSensorLongitude").value = "";
                document.getElementById("txtSensorLogradouro").value = "";
                document.getElementById("txtSensorCep").value = "";
                document.getElementById("txtSensorBairro").value = "";
                document.getElementById("txtSensorCidade").value = "";
                document.getElementById("txtSensorEstado").value = "";
            }
            
            function cadastrarSensor()
            {
               var macAddressSensor = document.getElementById("txtSensorMacAddress").value;
               var numeroLogradouro = document.getElementById("txtNumeroLogradouro").value;
               var latitude = document.getElementById("txtSensorLatitude").value;
               var longitude = document.getElementById("txtSensorLongitude").value;
               
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "cadastrarSensor");
               xmlHttpRequest.open("POST","ServletCadastrarSensor",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send("macAddressSensor=" + macAddressSensor + "&" + "numeroLogradouro=" + numeroLogradouro + "&" + "logradouroCodigo=" + logradouroCodigo + "&" + "latitude=" + latitude + "&" + "longitude=" + longitude);     
            }
            
            function getReadyStateHandler(xmlHttpRequest, tipo) {
            // an anonymous function returned
            // it listens to the XMLHttpRequest instance
            return function() {
                if (xmlHttpRequest.readyState == 4) {
                    if (xmlHttpRequest.status == 200) {
    
                        var respostaServlet = xmlHttpRequest.responseText;
                        
                        if(tipo === "consultaCep")
                        {
                            var arr = JSON.parse(respostaServlet);

                            document.getElementById("txtSensorLogradouro").value = arr[0].logradouroNome;
                            document.getElementById("txtSensorCep").value = arr[0].logradouroCep;
                            document.getElementById("txtSensorBairro").value = arr[0].logradouroBairro;
                            document.getElementById("txtSensorCidade").value = arr[0].logradouroCidade;
                            document.getElementById("txtSensorEstado").value = arr[0].logradouroEstado;
                            logradouroCodigo = arr[0].logradouroCodigo;
                        }
                        else
                        {
                            alert(respostaServlet);
                        }

                    } else {
                                alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
                            }
                        }
                    };
                }
                
                
                function direcionarInicio()
                {
                    window.location = "index.jsp";
                }
