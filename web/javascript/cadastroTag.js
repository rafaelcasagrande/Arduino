var xmlHttpRequest;
            var codigoVeiculo;

            function getReadyStateHandler(xmlHttpRequest, tipo) {
            return function() {
                if (xmlHttpRequest.readyState == 4) {
                    if (xmlHttpRequest.status == 200) {
    
                        var respostaServlet = xmlHttpRequest.responseText;
                        
                        if(tipo === "consultaPlaca")
                        {
                            var arr = JSON.parse(respostaServlet);
                            
                            codigoVeiculo = arr[0].codigoVeiculo;
                            document.getElementById("txtMarcaVeiculo").value = arr[0].marcaVeiculo;
                            document.getElementById("txtModeloVeiculo").value = arr[0].modeloVeiculo;
                            document.getElementById("txtCorVeiculo").value = arr[0].corVeiculo;
                            document.getElementById("txtAnoVeiculo").value = arr[0].anoVeiculo;
                            document.getElementById("txtCondutorResponsavel").value = arr[0].condutorVeiculo;
                            document.getElementById("txtCondutorCpf").value = arr[0].condutorCpf;

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
            
            function buscarEmplacamento()
            {
               var placaVeiculo = document.getElementById("txtPlacaVeiculo").value; 
                
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "consultaPlaca");
               xmlHttpRequest.open("POST","ServletConsultarPlaca",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send("placaVeiculo=" + placaVeiculo); 
            }
            
            function cadastrarTag()
            {
               var idTag = document.getElementById("txtTagId").value;
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "cadastrarTag");
               xmlHttpRequest.open("POST","ServletCadastrarTag",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send("codigoVeiculo=" + codigoVeiculo + "&" + "idTag=" + idTag); 
            }
            


