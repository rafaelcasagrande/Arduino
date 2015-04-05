<%-- 
    Document   : listarTag
    Created on : 04/04/2015, 23:18:08
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tag</title>
    </head>
    <body>
        <div align="center">
            <h1>Tag</h1>
            <table id="tableTag" border="1" >
                <tr>
                    <th> Código </th>
                    <th> Id </th>
                    <th> Placa </th>
                    <th> Modelo </th>
                    <th> Marca </th>
                    <th> Ano </th>
                    <th> Cor </th>
                    <th> Condutor </th>
                    <th> CPF </th>
                    <th> Habilitação </th>
                    <th> Alterar </th>
                    <th> Excluir </th>
                </tr>
            </table>
            <br>
            <form role="form" class="form-inline">
                <input style="width: 300px;" class="form-control" placeholder="ID" type="text" id="txtTagId" name="txtTagId"><br>
                <input style="width: 300px;" class="form-control" placeholder="Emplacamento do Veículo" type="text" onblur="buscarEmplacamento()" id="txtPlacaVeiculo" name="txtPlacaVeiculo"><br>
                <br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Marca" type="text" id="txtMarcaVeiculo" name="txtMarcaVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Modelo" type="text" id="txtModeloVeiculo" name="txtModeloVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Cor" type="text" id="txtCorVeiculo" name="txtCorVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Ano" type="text" id="txtAnoVeiculo" name="txtAnoVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Condutor Responsável" type="text" id="txtCondutorResponsavel" name="txtCondutorResponsavel"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="CPF Condutor" type="text" id="txtCondutorCpf" name="txtCondutorCpf"><br>
                
                <button type="button" onclick="alterarDadosTag()" class="btn btn-default" name="btnTagSalvar" id="btnTagSalvar">
                    Salvar
                </button>    
                
                <button type="button" class="btn btn-default" name="btnTagLimpar" id="btnTagLimpar">
                    Limpar
                </button>    
                
                <button type="button" class="btn btn-default" name="btnTagVoltar" id="btnTagVoltar">
                    Voltar
                </button>
                
            </form>
        </div>

        <script>
            
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
            
            function buscarEmplacamento()
            {
               var placaVeiculo = document.getElementById("txtPlacaVeiculo").value; 
                
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "consultaPlaca");
               xmlHttpRequest.open("POST","ServletConsultarPlaca",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send("placaVeiculo=" + placaVeiculo); 
            }
            
            function alterarDadosTag()
            {
                var tagId = document.getElementById("txtTagId").value;
                xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "alterarTag");
                xmlHttpRequest.open("POST","ServletAlterarTag",true);
                xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                xmlHttpRequest.send("tagId=" + tagId + "&" + "codigoVeiculo=" + codigoVeiculo + "&" + "codigoTag=" + codigoTag);    
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
                        
                        
                        if(tipo === "listarTag")
                        {
                            arrayListTags = JSON.parse(respostaServlet);
                            
                            var table = document.getElementById("tableTag");
                            var i;

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
                                celAlterar.innerHTML = "<button onclick=alterarTag(" + i + ") >Alterar</button>";
                                celExcluir.innerHTML = "<button>Excluir</button>";
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
                        else if(tipo === "alterarTag")
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
        </script>
        
    </body>
</html>
