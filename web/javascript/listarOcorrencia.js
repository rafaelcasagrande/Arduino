window.onload = listarOcorrencias();
            
            var arrayListOcorrencia;
            var codigoVeiculo;
            var codigoOcorrencia;
            
            function listarOcorrencias()
            {
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "listarOcorrencia");
               xmlHttpRequest.open("POST","ServletListarOcorrencia",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send(null);  
            }
            
            function buscarOcorrencia()
            {
                var codigoOcorrencia = document.getElementById("txtOcorrenciaCodigo").value;
                if(codigoOcorrencia === "")
                {
                    alert("Preencher código da ocorrência")
                }
                else
                {
                    xmlHttpRequest = getXMLHttpRequest();
                    xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "buscarOcorrencia");
                    xmlHttpRequest.open("POST","ServletConsultarOcorrencia",true);
                    xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                    xmlHttpRequest.send("codigoOcorrencia=" + codigoOcorrencia);  
                }
            }
            
            function atualizar()
            {
                var table = document.getElementById("tableOcorrencia");
                while(table.rows.length > 1) 
                {
                    table.deleteRow(1);
                }
                
                listarOcorrencias();
                document.getElementById("txtOcorrenciaCodigo").value = "";
            }
            
            function buscarEmplacamento()
            {
               var placaVeiculo = document.getElementById("txtPlacaVeiculo").value; 
               if(placaVeiculo === "")
               {
                   alert("Preencher placa do veículo")
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
            
            function alterarDadosOcorrencia()
            {
                var encerrarOcorrencia = document.getElementById("chkFinalizarOcorrencia").checked;

                var ocorrenciaCodigo = document.getElementById("txtCodigoOcorrencia").value;
                xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "alterarOcorrencia");
                xmlHttpRequest.open("POST","ServletAlterarOcorrencia",true);
                xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                xmlHttpRequest.send("ocorrenciaCodigo=" + ocorrenciaCodigo + "&" + "veiculoCodigo=" + codigoVeiculo + "&" + "encerrarOcorrencia=" + encerrarOcorrencia);    
            }

            function getReadyStateHandler(xmlHttpRequest, tipo) {
            // an anonymous function returned
            // it listens to the XMLHttpRequest instance
            return function() {
                if (xmlHttpRequest.readyState == 4) {
                    if (xmlHttpRequest.status == 200) {
    
                        var respostaServlet = xmlHttpRequest.responseText;
                        
                        
                        if((tipo === "listarOcorrencia") || (tipo === "buscarOcorrencia"))
                        {
                            arrayListOcorrencia = JSON.parse(respostaServlet);
                            
                            var table = document.getElementById("tableOcorrencia");
                            var i;

                            if(tipo === "buscarOcorrencia")
                            {
                                while(table.rows.length > 1) 
                                {
                                    table.deleteRow(1);
                                }
                            }

                            for (i = 0; i < arrayListOcorrencia.length; i++)
                            {
                                var row = table.insertRow(i+1);
                                
                                var celCodigo = row.insertCell(0);
                                var celPlaca = row.insertCell(1);
                                var celModelo = row.insertCell(2);
                                var celMarca = row.insertCell(3);
                                var celAno = row.insertCell(4);
                                var celCor = row.insertCell(5);
                                var celStatus = row.insertCell(6);
                                var celInicio = row.insertCell(7);
                                var celAlterar = row.insertCell(8);
                                var celExcluir = row.insertCell(9);

                                celCodigo.innerHTML = arrayListOcorrencia[i].ocorrenciaCodigo;
                                celPlaca.innerHTML = arrayListOcorrencia[i].veiculoPlaca;
                                celModelo.innerHTML = arrayListOcorrencia[i].modeloNome;
                                celMarca.innerHTML = arrayListOcorrencia[i].marcaNome;
                                celAno.innerHTML = arrayListOcorrencia[i].veiculoAno;
                                celCor.innerHTML = arrayListOcorrencia[i].veiculoCor;
                                celStatus.innerHTML = arrayListOcorrencia[i].ocorrenciaStatus;
                                celInicio.innerHTML = arrayListOcorrencia[i].ocorrenciaInicio;
                                celAlterar.innerHTML = "<button class='btn btn-link' onclick=alterarOcorrencia(" + i + ")> <span class='glyphicon glyphicon-pencil'></span> </button>";
                                celExcluir.innerHTML = "<button class='btn btn-link' onclick=excluirOcorrencia(" + i + ")> <span class='glyphicon glyphicon-remove'></span> </button>"; 
                            
                            }
                        }
                        else if(tipo === "consultaPlaca")
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
                        else if(tipo === "alterarOcorrencia")
                        {
                            if(respostaServlet === "true")
                            {
                                alert("Operação realizada com sucesso");
                                location.reload();
                            }
                            else
                            {
                                alert("Falha ao realizar a operação");
                            }
                        }
                        
                        else if(tipo === "excluirOcorrencia")
                        {
                            if(respostaServlet === "true")
                            {
                                alert("Operação realizada com sucesso");
                                location.reload();
                            }
                            else
                            {
                                alert("Falha ao realizar a operação");
                            }
                        }

                    } else {
                                alert("Falha ao realizar a operação");
                            }
                        }
                    };
                }
                
                function alterarOcorrencia(posicao)
                {
                    codigoOcorrencia = arrayListOcorrencia[posicao].ocorrenciaCodigo;
                    codigoVeiculo = arrayListOcorrencia[posicao].veiculoCodigo;
                    document.getElementById("txtCodigoOcorrencia").value = codigoOcorrencia;
                    document.getElementById("txtPlacaVeiculo").value = arrayListOcorrencia[posicao].veiculoPlaca;
                    document.getElementById("txtMarcaVeiculo").value = arrayListOcorrencia[posicao].marcaNome;
                    document.getElementById("txtModeloVeiculo").value = arrayListOcorrencia[posicao].modeloNome;
                    document.getElementById("txtCorVeiculo").value = arrayListOcorrencia[posicao].veiculoCor;
                    document.getElementById("txtAnoVeiculo").value = arrayListOcorrencia[posicao].veiculoAno;
                    document.getElementById("txtCondutorResponsavel").value = arrayListOcorrencia[posicao].condutorNome;
                    document.getElementById("txtCondutorCpf").value = arrayListOcorrencia[posicao].condutorCpf;
                }
                
                function excluirOcorrencia(posicao)
                {
                    var msg = confirm("Deseja realmente excluir?");
                    if(msg === true)
                    {
                        codigoOcorrencia = arrayListOcorrencia[posicao].ocorrenciaCodigo; 
                        xmlHttpRequest = getXMLHttpRequest();
                        xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "excluirOcorrencia");
                        xmlHttpRequest.open("POST","ServletExcluirOcorrencia",true);
                        xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                        xmlHttpRequest.send("codigoOcorrencia=" + codigoOcorrencia); 
                    }
                }
                
                function limparCampos()
                {
                    document.getElementById("txtCodigoOcorrencia").value = "";
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
