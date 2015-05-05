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
                            codigoVeiculo = arr[0].veiculoCodigo;
                            document.getElementById("txtMarcaVeiculo").value = arr[0].marcaNome;
                            document.getElementById("txtModeloVeiculo").value = arr[0].modeloNome;
                            document.getElementById("txtCorVeiculo").value = arr[0].veiculoCor;
                            document.getElementById("txtAnoVeiculo").value = arr[0].anoVeiculo;
                            document.getElementById("txtCondutorResponsavel").value = arr[0].condutorNome;
                            document.getElementById("txtCondutorCpf").value = arr[0].condutorCpf;

                        }
                        else if(respostaServlet === "true")
                        {
                            alert("Operação realizada com sucesso");
                        }
                        else if(respostaServlet === "false")
                        {
                            alert("Falha ao realizar a operação");
                        }

                    } else {
                                 alert("Falha ao realizar a operação");
                            }
                        }
                    };
                }
            
            function buscarEmplacamento()
            {
               var placaVeiculo = document.getElementById("txtPlacaVeiculo").value; 
               if(placaVeiculo === "")
               {
                   alert("Preencher placa do veículo");
               }
               else
               {
                    xmlHttpRequest = getXMLHttpRequest();
                    xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "consultaPlaca");
                    xmlHttpRequest.open("POST","ServletConsultarPlaca",true);
                    xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                    xmlHttpRequest.send("placaVeiculo=" + placaVeiculo); 
               }
            }
            
            function cadastrarOcorrencia()
            {
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "cadastrarOcorrencia");
               xmlHttpRequest.open("POST","ServletCadastrarOcorrencia",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send("veiculoCodigo=" + codigoVeiculo); 
            }
            
            function limparCampos()
            {
                document.getElementById("txtPlacaVeiculo").value = "";
                document.getElementById("txtMarcaVeiculo").value = "";
                document.getElementById("txtModeloVeiculo").value = "";
                document.getElementById("txtCorVeiculo").value = "";
                document.getElementById("txtAnoVeiculo").value = "";
                document.getElementById("txtCondutorResponsavel").value = "";
                document.getElementById("txtCondutorCpf").value = "";
            }
            
            function direcionarInicio()
            {
                window.location = "index.jsp";
            }