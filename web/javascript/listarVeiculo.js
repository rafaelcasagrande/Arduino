window.onload = listarVeiculos();
            window.onload = listarMarcas();
            
            var posicaoGlobal;
            var arrayListVeiculos;
            var veiculoCodigo;
            var condutorCodigo;
            
            function listarVeiculos()
            {
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "listarVeiculo");
               xmlHttpRequest.open("POST","ServletListarVeiculo",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send(null);  
            }
            
            function buscarVeiculo()
            {
               
               var placaVeiculo = document.getElementById("txtPlacaVeiculoBuscar").value; 
               if(placaVeiculo === "")
               {
                   alert("Preencher Placa do Veículo");
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
            
            function limparCampos()
            {
                document.getElementById("txtVeiculoPlaca").value = "";
                document.getElementById("txtVeiculoCor").value = "";
                document.getElementById("txtVeiculoAno").value = "";
                document.getElementById("txtDocumentoCondutor").value = "";
                document.getElementById("txtNomeCondutor").value = "";
                document.getElementById("txtDataNascimentoCondutor").value = "";
                document.getElementById("txtDocumentoCondutorResultado").value = "";
                listarMarcas();
                $('#cbxModelo').empty();
            }
            
            
            function atualizar()
            {
                var table = document.getElementById("tableVeiculos");
                
                while(table.rows.length > 1) 
                {
                    table.deleteRow(1);
                }
                
                listarVeiculos();
                listarMarcas();
                document.getElementById("txtPlacaVeiculoBuscar").value = "";
            }
            
            function listarMarcas()
            {
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "listarMarca");
               xmlHttpRequest.open("POST","ServletListarMarca",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
               xmlHttpRequest.send(null);
            }
            
            function listarModelos(filtro)
            {
               xmlHttpRequest = getXMLHttpRequest();
               var idMarca = document.getElementById("cbxMarca").value;
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, filtro);
               xmlHttpRequest.open("POST","ServletListarModelo",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
               xmlHttpRequest.send("idMarca=" + idMarca);              
            }
            
            function buscarCondutor()
            {
               
               var numeroDocumento = document.getElementById("txtDocumentoCondutor").value;
               if(numeroDocumento === "")
               {
                   alert("Preencher Número do Documento");
               }
               else
               {
                    var tipoDocumento = document.getElementById("cbxDocumento").value;
                    xmlHttpRequest = getXMLHttpRequest();
                    xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "condutor");
                    xmlHttpRequest.open("POST","ServletConsultarDocumentosCondutor",true);
                    xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xmlHttpRequest.send("numeroDocumento=" + numeroDocumento + "&" + "tipoDocumento=" + tipoDocumento);  
               }
               
            }
            
            function alterarDadosVeiculo()
            {
                var veiculoPlaca = document.getElementById("txtVeiculoPlaca").value;
                var veiculoCor = document.getElementById("txtVeiculoCor").value;
                var veiculoAno = document.getElementById("txtVeiculoAno").value;
                var modeloCodigo = document.getElementById("cbxModelo").value;
 
                xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "alterarVeiculo");
                xmlHttpRequest.open("POST","ServletAlterarVeiculo",true);
                xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                xmlHttpRequest.send("veiculoCodigo=" + veiculoCodigo + "&" + "condutorCodigo=" + condutorCodigo + "&" + "modeloCodigo=" + modeloCodigo + "&" + "veiculoPlaca=" + veiculoPlaca + "&" + "veiculoCor=" + veiculoCor + "&" + "veiculoAno=" + veiculoAno);    
            }

            function getReadyStateHandler(xmlHttpRequest, tipo) {
            // an anonymous function returned
            // it listens to the XMLHttpRequest instance
            return function() {
                if (xmlHttpRequest.readyState == 4) {
                    if (xmlHttpRequest.status == 200) {
    
                        var respostaServlet = xmlHttpRequest.responseText;
                        
                        
                        if((tipo === "listarVeiculo") || (tipo === "consultaPlaca"))
                        {
                            arrayListVeiculos = JSON.parse(respostaServlet);
                            
                            var table = document.getElementById("tableVeiculos");
                            var i;

                            if(tipo === "consultaPlaca")
                            {
                                while(table.rows.length > 1) 
                                {
                                    table.deleteRow(1);
                                }
                            }

                            for (i = 0; i < arrayListVeiculos.length; i++)
                            {
                                var row = table.insertRow(i+1);
                                
                                var celCodigo = row.insertCell(0);
                                var celPlaca = row.insertCell(1);
                                var celAno = row.insertCell(2);
                                var celModelo = row.insertCell(3);
                                var celMarca = row.insertCell(4);
                                var celCor = row.insertCell(5);
                                var celCondutor = row.insertCell(6);
                                var celCPF = row.insertCell(7);
                                var celHabilitacao = row.insertCell(8);
                                var celAlterar = row.insertCell(9);
                                var celExcluir = row.insertCell(10);

                                celCodigo.innerHTML = arrayListVeiculos[i].veiculoCodigo;
                                celPlaca.innerHTML = arrayListVeiculos[i].veiculoPlaca;
                                celAno.innerHTML = arrayListVeiculos[i].veiculoAno;
                                celModelo.innerHTML = arrayListVeiculos[i].modeloNome;
                                celMarca.innerHTML = arrayListVeiculos[i].marcaNome;
                                celCor.innerHTML = arrayListVeiculos[i].veiculoCor;
                                celCondutor.innerHTML = arrayListVeiculos[i].condutorNome;
                                celCPF.innerHTML = arrayListVeiculos[i].condutorCpf;
                                celHabilitacao.innerHTML = arrayListVeiculos[i].condutorHabilitacao;
                                celAlterar.innerHTML = "<button class='btn btn-link' onclick=alterarVeiculo(" + i + ")> <span class='glyphicon glyphicon-pencil'></span> </button>";
                                celExcluir.innerHTML = "<button class='btn btn-link' onclick=excluirVeiculo(" + i + ")> <span class='glyphicon glyphicon-remove'></span> </button>"; 
                            
                         }
                        }
                        else if(tipo === "listarMarca")
                        {
                            var arr = JSON.parse(respostaServlet);
                            var i;
                            var combobox;
                            
                            combobox = document.getElementById("cbxMarca");
                            $('#cbxMarca').empty();
                            for (i = 0; i < arr.length; i++)
                            {
                                var option = document.createElement('option');
                                option.value = arr[i].marcaCodigo;
                                option.text = arr[i].marcaNome;
                                combobox.add(option, 0);
                            }
                        }
                        else if(tipo === "listarModeloSemFiltro")
                        {
                            var arr = JSON.parse(respostaServlet);
                            var i;
                            var combobox;

                            combobox = document.getElementById("cbxModelo");
                            $('#cbxModelo').empty();
                            for (i = 0; i < arr.length; i++)
                            {
                                var option = document.createElement('option');
                                option.value = arr[i].modeloCodigo;
                                option.text = arr[i].modeloNome;
                                combobox.add(option, 0);
                            }
                        }
                        else if(tipo === "listarModeloComFiltro")
                        {
                            var arr = JSON.parse(respostaServlet);
                            var i;
                            var combobox;

                            combobox = document.getElementById("cbxModelo");
                            $('#cbxModelo').empty();
                            for (i = 0; i < arr.length; i++)
                            {
                                var option = document.createElement('option');
                                option.value = arr[i].modeloCodigo;
                                option.text = arr[i].modeloNome;
                                combobox.add(option, 0);
                            }
                            document.getElementById("cbxModelo").value = arrayListVeiculos[posicaoGlobal].modeloCodigo;
                        }
                        else if(tipo === 'condutor')
                        {
                            var arr = JSON.parse(respostaServlet);
                            
                            document.getElementById("txtNomeCondutor").value = arr[0].nomeCondutor;
                            document.getElementById("txtDataNascimentoCondutor").value = arr[0].condutorDataNascimento;
                            condutorCodigo = arr[0].codigoCondutor;
                            
                            if(document.getElementById("cbxDocumento").value === 'cpf')
                            {
                                document.getElementById("txtDocumentoCondutorResultado").value = arr[0].habilitacaoCondutor;
                            }
                            else
                            {
                                document.getElementById("txtDocumentoCondutorResultado").value = arr[0].cpfCondutor;
                            }
                        }
                        else if(tipo === 'alterarVeiculo')
                        {
                            if(respostaServlet === "true")
                            {
                                alert("Operação realizada com sucesso");
                                location.reload();
                            }
                            else
                            {
                                alert("Falha ao realizar operação");
                            }
                        }
                        else if(tipo === 'excluirVeiculo')
                        {
                            if(respostaServlet === "true")
                            {
                                alert("Operação realizada com sucesso");
                                location.reload();
                            }
                            else
                            {
                                alert("Falha ao realizar operação");
                            }
                        }

                    } else {
                                alert("Falha ao realizar a operação");
                            }
                        }
                    };
                }

                function alterarVeiculo(posicao)
                {   
                    condutorCodigo = arrayListVeiculos[posicao].condutorCodigo;
                    veiculoCodigo = arrayListVeiculos[posicao].veiculoCodigo;
                    
                    
                    posicaoGlobal = posicao; 
                    document.getElementById("cbxMarca").value = arrayListVeiculos[posicao].marcaCodigo;
                    document.getElementById("cbxDocumento").value = 'cpf';
                    listarModelos('listarModeloComFiltro');

                    document.getElementById("txtVeiculoPlaca").value = arrayListVeiculos[posicao].veiculoPlaca;
                    document.getElementById("txtVeiculoCor").value = arrayListVeiculos[posicao].veiculoCor;
                    document.getElementById("txtVeiculoAno").value = arrayListVeiculos[posicao].veiculoAno;
                    document.getElementById("txtDocumentoCondutor").value = arrayListVeiculos[posicao].condutorCpf;
                    document.getElementById("txtNomeCondutor").value = arrayListVeiculos[posicao].condutorNome;
                    document.getElementById("txtDataNascimentoCondutor").value = arrayListVeiculos[posicao].condutorDataNascimento;
                    document.getElementById("txtDocumentoCondutorResultado").value = arrayListVeiculos[posicao].condutorHabilitacao;
                }
                
                function excluirVeiculo(posicao)
                {
                    var msg = confirm("Deseja realmente excluir?")
                    if(msg == true)
                    {
                        veiculoCodigo = arrayListVeiculos[posicao].veiculoCodigo;
                        xmlHttpRequest = getXMLHttpRequest();
                        xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "excluirVeiculo");
                        xmlHttpRequest.open("POST","ServletExcluirVeiculo",true);
                        xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                        xmlHttpRequest.send("veiculoCodigo=" + veiculoCodigo); 
                    }
                }
                
                function direcionarInicio()
                {
                    window.location = "index.jsp";
                }