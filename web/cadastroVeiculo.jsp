<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Veículo</title>
    </head>
    <body>
        <script>
            window.onload = listarMarcas();
            var xmlHttpRequest;
            var condutorCodigo;
            
            
            function getXMLHttpRequest() 
            {
                var xmlHttpReq = false;
                // to create XMLHttpRequest object in non-Microsoft browsers
                if (window.XMLHttpRequest) {
                        xmlHttpReq = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                        try {
                                // to create XMLHttpRequest object in later versions
                                // of Internet Explorer
                                xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                        } catch (exp1) {
                                try {
                                        // to create XMLHttpRequest object in older versions
                                        // of Internet Explorer
                                        xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                                } catch (exp2) {
                                        xmlHttpReq = false;
                                }
                        }
                }
                return xmlHttpReq;
            }
            
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
        </script>
        
        <div align="center">
            <h1> Cadastrar Veículo </h1>   
            <form role="form" class="form-inline">
                
                <input style="width: 300px;" class="form-control" placeholder="Placa" type="text" id="txtVeiculoPlaca" name="txtVeiculoPlaca"><br>
                <input style="width: 300px;" class="form-control" placeholder="Cor" type="text" id="txtVeiculoCor" name="txtVeiculoCor"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Ano" type="text" id="txtVeiculoAno" name="txtVeiculoAno"><br> 
                
                <select id="cbxMarca" onchange="listarModelos()" >  
                </select>
                
                <select id="cbxModelo" name="cbxModelo" >
                </select>
                
                <br>
                
                <select id="cbxDocumento" >
                    <option value="cpf" > CPF </option>
                    <option value="habilitacao" > Habilitação </option>
                </select>
                
                <input style="width: 300px;" class="form-control" placeholder="Condutor" type="text" onblur="buscarCondutor()" id="txtDocumentoCondutor" name="txtCondutor"><br>            
                <br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Condutor" type="text" id="txtNomeCondutor" name="txtNomeCondutor"><br> 
                <br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Data Nascimento" type="text"  id="txtDataNascimentoCondutor" name="txtDataNascimentoCondutor"><br> 
                <br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Documento" type="text" id="txtDocumentoCondutorResultado" name="txtDocumentoCondutorResultado"><br> 
                <br>
                
                <button type="button" class="btn btn-default" id="btnCondutorSalvar" name="btnCondutorSalvar" onclick="cadastrarVeiculo()" >
                    Salvar
                </button>
                
                <button type="button" class="btn btn-default" id="btnCondutorLimpar" name="btnCondutorLimpar">
                    Limpar
                </button>
                
                <button type="button" class="btn btn-default" id="btnCondutorVoltar" name="btnCondutorVoltar">
                    Voltar
                </button>
                
            </form>
        </div>
    </body>
</html>
