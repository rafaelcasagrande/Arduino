            window.onload = listarCondutores();
            
            var arrayListCondutores;
            var logradouroCodigo;
            var condutorCodigo;
            
            function listarCondutores()
            {
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "listarCondutor");
               xmlHttpRequest.open("POST","ServletListarCondutor",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send(null);  
            }
            
            function atualizar()
            {
                listarCondutores();
                document.getElementById("txtDocumentoCondutor").value = "";
            }
            
            function buscarCondutor()
            {
               xmlHttpRequest = getXMLHttpRequest();
               var numeroDocumento = document.getElementById("txtDocumentoCondutor").value;
               var tipoDocumento = document.getElementById("cbxDocumento").value;
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "buscarCondutor");
               xmlHttpRequest.open("POST","ServletConsultarDocumentosCondutor",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
               xmlHttpRequest.send("numeroDocumento=" + numeroDocumento + "&" + "tipoDocumento=" + tipoDocumento);  
            }
            
            function alterarDadosCondutor()
            {
                var nomeCondutor = document.getElementById("txtCondutorNome").value;
                var cpfCondutor = document.getElementById("txtCondutorCpf").value;
                var habilitacaoCondutor = document.getElementById("txtCondutorHabilitacao").value;
                var dataNascimentoCondutor = document.getElementById("txtCondutorNascimento").value;
                var numeroLogradouro = document.getElementById("txtCondutorNumeroLogradouro").value;
                
                xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "alterarCondutor");
                xmlHttpRequest.open("POST","ServletAlterarCondutor",true);
                xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                xmlHttpRequest.send("nomeCondutor=" + nomeCondutor + "&" + "cpfCondutor=" + cpfCondutor + "&" + "habilitacaoCondutor=" + habilitacaoCondutor + "&" + "dataNascimentoCondutor=" + dataNascimentoCondutor + "&" + "numeroLogradouro=" + numeroLogradouro + "&" + "logradouroCodigo=" + logradouroCodigo + "&" + "condutorCodigo=" + condutorCodigo);    
            }
            
            function consultarCep()
            {
               xmlHttpRequest = getXMLHttpRequest();
               var cep = document.getElementById("txtCondutorCep").value;
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "consultaCep");
               xmlHttpRequest.open("POST","ServletConsultaEndereco",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send("cep=" + cep);              
            }
            
            function getReadyStateHandler(xmlHttpRequest, tipo) {
            // an anonymous function returned
            // it listens to the XMLHttpRequest instance
            return function() {
                if (xmlHttpRequest.readyState == 4) {
                    if (xmlHttpRequest.status == 200) {
    
                        var respostaServlet = xmlHttpRequest.responseText;

                        if((tipo === "listarCondutor") || (tipo === "buscarCondutor"))
                        {
                            arrayListCondutores = JSON.parse(respostaServlet);
                            
                            var table = document.getElementById("tableCondutores");
                            var i;

                            if(tipo === "buscarCondutor")
                            {
                                while(table.rows.length > 1) 
                                {
                                    table.deleteRow(1);
                                }
                            }

                            for (i = 0; i < arrayListCondutores.length; i++)
                            {
                                var row = table.insertRow(i+1);
                                
                                var celCodigo = row.insertCell(0);
                                var celNome = row.insertCell(1);
                                var celCPF = row.insertCell(2);
                                var celHabilitacao = row.insertCell(3);
                                var celCEP = row.insertCell(4);
                                var celLogradouro = row.insertCell(5);
                                var celNumeroLogradouro = row.insertCell(6);
                                var celBairro = row.insertCell(7);
                                var celCidade = row.insertCell(8);
                                var celEstado = row.insertCell(9);
                                var celAlterar = row.insertCell(10);
                                var celExcluir = row.insertCell(11);
                                
                                celCodigo.innerHTML = arrayListCondutores[i].codigoCondutor;
                                celNome.innerHTML = arrayListCondutores[i].nomeCondutor;
                                celCPF.innerHTML = arrayListCondutores[i].cpfCondutor;
                                celHabilitacao.innerHTML = arrayListCondutores[i].habilitacaoCondutor;
                                celCEP.innerHTML = arrayListCondutores[i].cepCondutor;
                                celLogradouro.innerHTML = arrayListCondutores[i].nomeLogradouroCondutor;
                                celNumeroLogradouro.innerHTML = arrayListCondutores[i].numeroLogradouroCondutor;
                                celBairro.innerHTML = arrayListCondutores[i].bairroCondutor;
                                celCidade.innerHTML = arrayListCondutores[i].cidadeCondutor;
                                celEstado.innerHTML = arrayListCondutores[i].estadoCondutor;
                                celAlterar.innerHTML = "<button onclick=alterarCondutor(" + i + ")> Alterar </button>";
                                celExcluir.innerHTML = "<button onclick='excluirCondutor()'>Excluir</button>"; 
                            }
                        }
                        else if(tipo === "consultaCep")
                        {
                            arrListLogradouro = JSON.parse(respostaServlet);
                            
                            document.getElementById("txtCondutorLogradouro").value = arrListLogradouro[0].logradouroNome;
                            document.getElementById("txtCondutorCep").value = arrListLogradouro[0].logradouroCep;
                            document.getElementById("txtCondutorBairro").value = arrListLogradouro[0].logradouroBairro;
                            document.getElementById("txtCondutorCidade").value = arrListLogradouro[0].logradouroCidade;
                            document.getElementById("txtCondutorEstado").value = arrListLogradouro[0].logradouroEstado;
                            logradouroCodigo = arrListLogradouro[0].logradouroCodigo;  
                        }
                        else
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

                function alterarCondutor(posicao)
                {   
                    document.getElementById("txtCondutorNome").value = arrayListCondutores[posicao].nomeCondutor;
                    document.getElementById("txtCondutorCpf").value = arrayListCondutores[posicao].cpfCondutor;
                    document.getElementById("txtCondutorHabilitacao").value = arrayListCondutores[posicao].habilitacaoCondutor;
                    document.getElementById("txtCondutorNascimento").value = arrayListCondutores[posicao].dataNascimentoCondutor;
                    document.getElementById("txtCondutorNumeroLogradouro").value = arrayListCondutores[posicao].numeroLogradouroCondutor;
                    
                    document.getElementById("txtCondutorLogradouro").value = arrayListCondutores[posicao].nomeLogradouroCondutor;
                    document.getElementById("txtCondutorCep").value = arrayListCondutores[posicao].cepCondutor;
                    document.getElementById("txtCondutorBairro").value = arrayListCondutores[posicao].bairroCondutor;
                    document.getElementById("txtCondutorCidade").value = arrayListCondutores[posicao].cidadeCondutor;
                    document.getElementById("txtCondutorEstado").value = arrayListCondutores[posicao].estadoCondutor;
                    condutorCodigo = arrayListCondutores[posicao].codigoCondutor;
                    logradouroCodigo = arrayListCondutores[posicao].codigoLogradouro;
                }
                function excluirCondutor()
                {
                    alert("excluir");
                }