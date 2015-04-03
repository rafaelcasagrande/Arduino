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
            </tr>
        </table>
        
        <script>
            
            window.onload = listarCondutores();
            
            function listarCondutores()
            {
               xmlHttpRequest = getXMLHttpRequest();
               xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "listarCondutor");
               xmlHttpRequest.open("POST","ServletListarCondutor",true);
               xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
               xmlHttpRequest.send(null);  
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
                            var table = document.getElementById("tableCondutores");
                            var arr = JSON.parse(respostaServlet);
                            var i;

                            for (i = 0; i < arr.length; i++)
                            {
                                var row = table.insertRow(i);
                                
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
                                
                                celCodigo.innerHTML = arr[i].codigoCondutor;
                                celNome.innerHTML = arr[i].nomeCondutor;
                                celCPF.innerHTML = arr[i].cpfCondutor;
                                celHabilitacao.innerHTML = arr[i].habilitacaoCondutor;
                                celCEP.innerHTML = arr[i].cepCondutor;
                                celLogradouro.innerHTML = arr[i].nomeLogradouroCondutor;
                                celNumeroLogradouro.innerHTML = arr[i].numeroLogradouroCondutor;
                                celBairro.innerHTML = arr[i].bairroCondutor;
                                celCidade.innerHTML = arr[i].cidadeCondutor;
                                celEstado.innerHTML = arr[i].estadoCondutor;
                            }
                        }

                    } else {
                                alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
                            }
                        }
                    };
                }

        </script>  
    </body>
</html>
