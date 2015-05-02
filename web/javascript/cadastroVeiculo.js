window.onload = listarMarcas();
            var xmlHttpRequest;
            var condutorCodigo;

            function listarMarcas()
            {
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "marca");
               xmlHttpRequest.open("POST","ServletListarMarca",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
               xmlHttpRequest.send(null);
            }
            
            function listarModelos()
            {
               xmlHttpRequest = getXMLHttpRequest();
               var idMarca = document.getElementById("cbxMarca").value;
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "modelo");
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
            
            function cadastrarVeiculo()
            {
                var placa = document.getElementById("txtVeiculoPlaca").value;
                var cor = document.getElementById("txtVeiculoCor").value; 
                var ano = document.getElementById("txtVeiculoAno").value;
                var modeloCodigo = document.getElementById("cbxModelo").value;
                xmlHttpRequest = getXMLHttpRequest();
                xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "cadastroVeiculo");
                xmlHttpRequest.open("POST","ServletCadastrarVeiculo",true);
                xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xmlHttpRequest.send("placa=" + placa + "&" + "cor=" + cor + "&" + "ano=" + ano + "&" + "modeloCodigo=" + modeloCodigo + "&" + "condutorCodigo=" + condutorCodigo); 
            }
            
            
            function getReadyStateHandler(xmlHttpRequest, tipo) {
            // an anonymous function returned
            // it listens to the XMLHttpRequest instance
            return function() {
                if (xmlHttpRequest.readyState == 4) {
                    if (xmlHttpRequest.status == 200) {
    
                        var respostaServlet = xmlHttpRequest.responseText;

                        if(tipo === 'modelo')
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
                        else if(tipo === 'marca')
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
