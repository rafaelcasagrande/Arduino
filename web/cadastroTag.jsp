<%-- 
    Document   : cadastroTag
    Created on : 16/02/2015, 18:20:16
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Tag</title>
    </head>
    <body>
        <div align="center">
            <h1> Tag </h1>   
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

                <button type="button" class="btn btn-default" name="btnTagBuscarVeiculo" id="btnTagBuscarVeiculo">
                    Buscar
                </button>
                
                <button type="button" onclick="cadastrarTag()" class="btn btn-default" name="btnTagSalvar" id="btnTagSalvar">
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
            
            var xmlHttpRequest;
            var codigoVeiculo;
            
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
            return function() {
                if (xmlHttpRequest.readyState == 4) {
                    if (xmlHttpRequest.status == 200) {
    
                        var respostaServelet = xmlHttpRequest.responseText;
                        
                        if(tipo === "consultaPlaca")
                        {
                            var arr = JSON.parse(respostaServelet);
                            
                            codigoVeiculo = arr[0].codigoVeiculo;
                            document.getElementById("txtMarcaVeiculo").value = arr[0].marcaVeiculo;
                            document.getElementById("txtModeloVeiculo").value = arr[0].modeloVeiculo;
                            document.getElementById("txtCorVeiculo").value = arr[0].corVeiculo;
                            document.getElementById("txtAnoVeiculo").value = arr[0].anoVeiculo;
                            document.getElementById("txtCondutorResponsavel").value = arr[0].condutorVeiculo;
                            document.getElementById("txtCondutorCpf").value = arr[0].condutorCpf;

                        }
                        else
                        {
                            alert(respostaServelet);
                        }

                    } else {
                                alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
                            }
                        }
                    };
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
            
            function cadastrarTag()
            {
               var idTag = document.getElementById("txtTagId").value;
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "cadastrarTag");
               xmlHttpRequest.open("POST","ServletCadastrarTag",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send("codigoVeiculo=" + codigoVeiculo + "&" + "idTag=" + idTag); 
            }
            
        </script>
        
    </body>
</html>
