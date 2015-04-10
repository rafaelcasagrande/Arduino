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
               xmlHttpRequest = getXMLHttpRequest();
               var numeroDocumento = document.getElementById("txtDocumentoCondutor").value;
               var tipoDocumento = document.getElementById("cbxDocumento").value;
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "condutor");
               xmlHttpRequest.open("POST","ServletConsultarDocumentosCondutor",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
               xmlHttpRequest.send("numeroDocumento=" + numeroDocumento + "&" + "tipoDocumento=" + tipoDocumento);  
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
                        
                        
                        if(tipo === "listarVeiculo")
                        {
                            arrayListVeiculos = JSON.parse(respostaServlet);
                            
                            var table = document.getElementById("tableVeiculos");
                            var i;

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
                                celAlterar.innerHTML = "<button onclick=alterarVeiculo(" + i + ")> Alterar </button>";
                                celExcluir.innerHTML = "<button onclick=excluirVeiculo()> Excluir </button>";
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
                            
                            document.getElementById("txtNomeCondutor").value = arr[0].condutorNome;
                            document.getElementById("txtDataNascimentoCondutor").value = arr[0].condutorDataNascimento;
                            condutorCodigo = arr[0].condutorCodigo;
                            
                            if(document.getElementById("cbxDocumento").value === 'cpf')
                            {
                                document.getElementById("txtDocumentoCondutorResultado").value = arr[0].condutorHabilitacao;
                            }
                            else
                            {
                                document.getElementById("txtDocumentoCondutorResultado").value = arr[0].condutorCpf;
                            }
                        }
                        else if(tipo === 'alterarVeiculo')
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
                function excluirCondutor()
                {
                    alert("excluir");
                }