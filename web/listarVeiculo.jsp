<%-- 
    Document   : listarVeiculo
    Created on : 04/04/2015, 10:31:33
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">  
        
            <h1>Veículo</h1>

            <table id="tableVeiculos" border="1">
                <tr>
                    <th> Código </th>
                    <th> Placa </th>
                    <th> Ano </th>
                    <th> Modelo </th>
                    <th> Marca </th>
                    <th> Cor </th>
                    <th> Condutor </th>
                    <th> CPF </th>
                    <th> Habilitação </th>
                    <th> Status </th>
                    <th> Alterar </th>
                    <th> Excluir </th>
                </tr>
            </table>

            <br>
            
            <form role="form" class="form-inline">
                
                <input style="width: 300px;" class="form-control" placeholder="Placa" type="text" id="txtVeiculoPlaca" name="txtVeiculoPlaca"><br>
                <input style="width: 300px;" class="form-control" placeholder="Cor" type="text" id="txtVeiculoCor" name="txtVeiculoCor"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Ano" type="text" id="txtVeiculoAno" name="txtVeiculoAno"><br> 
                
                <select id="cbxMarca" onchange="listarModelos('listarModeloSemFiltro')" >  
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
                
                <button type="button" class="btn btn-default" id="btnCondutorSalvar" name="btnCondutorSalvar" onclick="alterarDadosVeiculo()" >
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
        <script>
            
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
                                var celStatus = row.insertCell(9);
                                var celAlterar = row.insertCell(10);
                                var celExcluir = row.insertCell(11);

                                celCodigo.innerHTML = arrayListVeiculos[i].veiculoCodigo;
                                celPlaca.innerHTML = arrayListVeiculos[i].veiculoPlaca;
                                celAno.innerHTML = arrayListVeiculos[i].veiculoAno;
                                celModelo.innerHTML = arrayListVeiculos[i].modeloNome;
                                celMarca.innerHTML = arrayListVeiculos[i].marcaNome;
                                celCor.innerHTML = arrayListVeiculos[i].veiculoCor;
                                celCondutor.innerHTML = arrayListVeiculos[i].condutorNome;
                                celCPF.innerHTML = arrayListVeiculos[i].condutorCpf;
                                celHabilitacao.innerHTML = arrayListVeiculos[i].condutorHabilitacao;
                                celStatus.innerHTML = arrayListVeiculos[i].veiculoStatus;
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
        </script>  
    </body>
</html>
