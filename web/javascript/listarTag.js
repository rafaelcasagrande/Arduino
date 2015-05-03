window.onload = listarTags();
            
            var arrayListTags;
            var codigoVeiculo;
            var codigoTag;
            
            function listarTags()
            {
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "listarTag");
               xmlHttpRequest.open("POST","ServletListarTag",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send(null);  
            }
            
            function atualizar()
            {
                var table = document.getElementById("tableTag");
                while(table.rows.length > 1) 
                {
                    table.deleteRow(1);
                }
                
                listarTags();
                document.getElementById("txtTagIdBuscar").value = "";
            }
            
            function buscarTag()
            {
                var tagId = document.getElementById("txtTagIdBuscar").value;
                xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "buscarTag");
                xmlHttpRequest.open("POST","ServletConsultarTag",true);
                xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                xmlHttpRequest.send("tagId=" + tagId);    
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
            
            function limparCampos()
            {
                document.getElementById("txtTagId").value = "";
                document.getElementById("txtPlacaVeiculo").value = "";
                document.getElementById("txtMarcaVeiculo").value = "";
                document.getElementById("txtModeloVeiculo").value = "";
                document.getElementById("txtCorVeiculo").value = "";
                document.getElementById("txtAnoVeiculo").value = "";
                document.getElementById("txtCondutorResponsavel").value = "";
                document.getElementById("txtCondutorCpf").value = "";
            }
            
            function alterarDadosTag()
            {
                var tagId = document.getElementById("txtTagId").value;
                xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "alterarTag");
                xmlHttpRequest.open("POST","ServletAlterarTag",true);
                xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                xmlHttpRequest.send("tagId=" + tagId + "&" + "codigoVeiculo=" + codigoVeiculo + "&" + "codigoTag=" + codigoTag);    
            }

            function getReadyStateHandler(xmlHttpRequest, tipo) {
            // an anonymous function returned
            // it listens to the XMLHttpRequest instance
            return function() {
                if (xmlHttpRequest.readyState == 4) {
                    if (xmlHttpRequest.status == 200) {
    
                        var respostaServlet = xmlHttpRequest.responseText;
                        
                        
                        if((tipo === "listarTag") || (tipo === "buscarTag"))
                        {
                            arrayListTags = JSON.parse(respostaServlet);
                            
                            var table = document.getElementById("tableTag");
                            var i;

                            if(tipo === "buscarTag")
                            {
                                while(table.rows.length > 1) 
                                {
                                    table.deleteRow(1);
                                }
                            }

                            for (i = 0; i < arrayListTags.length; i++)
                            {
                                var row = table.insertRow(i+1);
                                
                                var celCodigo = row.insertCell(0);
                                var celId = row.insertCell(1);
                                var celPlaca = row.insertCell(2);
                                var celModelo = row.insertCell(3);
                                var celMarca = row.insertCell(4);
                                var celAno = row.insertCell(5);
                                var celCor = row.insertCell(6);
                                var celCondutor = row.insertCell(7);
                                var celCPF = row.insertCell(8);
                                var celHabilitacao = row.insertCell(9);
                                var celAlterar = row.insertCell(10);
                                var celExcluir = row.insertCell(11);

                                celCodigo.innerHTML = arrayListTags[i].tagCodigo;
                                celId.innerHTML = arrayListTags[i].tagId;
                                celPlaca.innerHTML = arrayListTags[i].veiculoPlaca;
                                celModelo.innerHTML = arrayListTags[i].modeloNome;
                                celMarca.innerHTML = arrayListTags[i].marcaNome;
                                celAno.innerHTML = arrayListTags[i].veiculoAno;
                                celCor.innerHTML = arrayListTags[i].veiculoCor;
                                celCondutor.innerHTML = arrayListTags[i].condutorNome;
                                celCPF.innerHTML = arrayListTags[i].condutorCpf;
                                celHabilitacao.innerHTML = arrayListTags[i].condutorHabilitacao; 
                                celAlterar.innerHTML = "<button class='btn btn-link' onclick=alterarTag(" + i + ")> <span class='glyphicon glyphicon-pencil'></span> </button>";
                                celExcluir.innerHTML = "<button class='btn btn-link' onclick=excluirTag(" + i + ")> <span class='glyphicon glyphicon-remove'></span> </button>"; 
                            
                            }
                        }
                        else if(tipo === "consultaPlaca")
                        {
                            var arr = JSON.parse(respostaServlet);
                            
                            codigoVeiculo = arr[0].codigoVeiculo;
                            document.getElementById("txtMarcaVeiculo").value = arr[0].marcaNome;
                            document.getElementById("txtModeloVeiculo").value = arr[0].modeloNome;
                            document.getElementById("txtCorVeiculo").value = arr[0].veiculoCor;
                            document.getElementById("txtAnoVeiculo").value = arr[0].anoVeiculo;
                            document.getElementById("txtCondutorResponsavel").value = arr[0].condutorNome;
                            document.getElementById("txtCondutorCpf").value = arr[0].condutorCpf;
                        }
                        else if(tipo === "alterarTag")
                        {
                            alert(respostaServlet);
                            location.reload();
                        }
                        else if(tipo === "excluirTag")
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
                
                function alterarTag(posicao)
                {
                    codigoTag = arrayListTags[posicao].tagCodigo;
                    codigoVeiculo = arrayListTags[posicao].veiculoCodigo;
                    document.getElementById("txtTagId").value =  arrayListTags[posicao].tagId;
                    document.getElementById("txtPlacaVeiculo").value = arrayListTags[posicao].veiculoPlaca;
                    document.getElementById("txtMarcaVeiculo").value = arrayListTags[posicao].marcaNome;
                    document.getElementById("txtModeloVeiculo").value = arrayListTags[posicao].modeloNome;
                    document.getElementById("txtCorVeiculo").value = arrayListTags[posicao].veiculoCor;
                    document.getElementById("txtAnoVeiculo").value = arrayListTags[posicao].veiculoAno;
                    document.getElementById("txtCondutorResponsavel").value = arrayListTags[posicao].condutorNome;
                    document.getElementById("txtCondutorCpf").value = arrayListTags[posicao].condutorCpf;
                }
                
                function excluirTag(posicao)
                {
                    codigoTag = arrayListTags[posicao].tagCodigo;
                    xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "excluirTag");
                    xmlHttpRequest.open("POST","ServletExcluirTag",true);
                    xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                    xmlHttpRequest.send("codigoTag=" + codigoTag);  
                    
                }

                function direcionarInicio()
                {
                    window.location = "index.jsp";
                }