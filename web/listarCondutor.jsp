<%-- 
    Document   : listarCondutor
    Created on : 03/04/2015, 11:08:45
    Author     : rafael
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Condutor</title>
    </head>
    <body>
        <div align="center">
            <h1>Condutor</h1>
            <table id="tableCondutores" border="1">
                <tr>
                    <th> Codigo </th>
                    <th> Nome </th>
                    <th> CPF </th>
                    <th> Habilitação </th>
                    <th> CEP </th>
                    <th> Logradouro </th>
                    <th> N. Logradouro </th>
                    <th> Bairro </th>
                    <th> Cidade </th>
                    <th> Estado </th> 
                    <th> Alterar </th>
                    <th> Excluir </th>
                </tr>
            </table>
            
            <br>
            
            <form role="form" class="form-inline">
                <input style="width: 300px;" class="form-control" placeholder="Nome" type="text" id="txtCondutorNome" name="txtCondutorNome"><br>
                <input style="width: 300px;" class="form-control" placeholder="CPF" type="text" id="txtCondutorCpf" name="txtCondutorCpf"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Habilitação" type="text" id="txtCondutorHabilitacao" name="txtCondutorHabilitacao"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Data de Nascimento" type="text" id="txtCondutorNascimento" name="txtCondutorNascimento"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Numero Logradouro" type="text" id="txtCondutorNumeroLogradouro" name="txtCondutorNumeroLogradouro"><br> 
                <input style="width: 300px;" class="form-control" placeholder="CEP" onblur="consultarCep()" type="text" id="txtCondutorCep" name="txtCondutorCep" onblur="consultarCep()" ><br>

                <input disabled style="width: 300px;" class="form-control" placeholder="Logradouro" type="text" id="txtCondutorLogradouro" name="txtCondutorLogradouro"><br> 
                <input disabled style="width: 300px;" class="form-control" placeholder="Bairro" type="text" id="txtCondutorBairro" name="txtCondutorBairro"><br> 
                <input disabled style="width: 300px;" class="form-control" placeholder="Cidade" type="text" id="txtCondutorCidade" name="txtCondutorCidade"><br> 
                <input disabled style="width: 300px;" class="form-control" placeholder="Estado" type="text" id="txtCondutorEstado" name="txtCondutorEstado"><br> 

                <button type="button" onclick="alterarDadosCondutor()" class="btn btn-default" name="btnCondutorSalvar" id="btnCondutorSalvar">
                    Salvar
                </button>
                <button type="button" onclick="limparDador()" class="btn btn-default" name="btnCondutorLimpar" id="btnCondutorLimpar">
                    Limpar
                </button>   
                <button type="button" class="btn btn-default" name="btnCondutorVoltar" id="btnCondutorVoltar">
                    Voltar
                </button>    
            </form>
        </div>

        <script>
            
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
                        
                        
                        if(tipo === "listarCondutor")
                        {
                            arrayListCondutores = JSON.parse(respostaServlet);
                            
                            var table = document.getElementById("tableCondutores");
                            var i;

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

        </script>  
    </body>
</html>
