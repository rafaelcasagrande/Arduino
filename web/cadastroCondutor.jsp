
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>    
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Cadastrar Condutor</title>
    </head>
    <body>
        
        <div align="center">
            <h1> Cadastrar Condutor </h1>   
            <form role="form" class="form-inline">
                <input style="width: 300px;" class="form-control" placeholder="Nome" type="text" id="txtCondutorNome" name="txtCondutorNome"><br>
                <input style="width: 300px;" class="form-control" placeholder="CPF" type="text" id="txtCondutorCpf" name="txtCondutorCpf"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Habilitação" type="text" id="txtCondutorHabilitacao" name="txtCondutorHabilitacao"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Data de Nascimento" type="text" id="txtCondutorNascimento" name="txtCondutorNascimento"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Numero Logradouro" type="text" id="txtCondutorNumeroLogradouro" name="txtCondutorNumeroLogradouro"><br> 
                <input style="width: 300px;" class="form-control" placeholder="CEP" type="text" id="txtCondutorCep" name="txtCondutorCep" onblur="consultarCep()" ><br>

                <input style="width: 300px;" class="form-control" placeholder="Logradouro" type="text" id="txtCondutorLogradouro" name="txtCondutorLogradouro"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Bairro" type="text" id="txtCondutorBairro" name="txtCondutorBairro"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Cidade" type="text" id="txtCondutorCidade" name="txtCondutorCidade"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Estado" type="text" id="txtCondutorEstado" name="txtCondutorEstado"><br> 

                <button type="button" onclick="cadastrarCondutor()" class="btn btn-default" name="btnCondutorSalvar" id="btnCondutorSalvar">
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
        
        var logradouroCodigo;
        var xmlHttpRequest;
        
        
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
    
                        var respostaServelet = xmlHttpRequest.responseText;
                        
                        if(tipo === "consultaCep")
                        {
                            var arr = JSON.parse(respostaServelet);

                            document.getElementById("txtCondutorLogradouro").value = arr[0].logradouroNome;
                            document.getElementById("txtCondutorCep").value = arr[0].logradouroCep;
                            document.getElementById("txtCondutorBairro").value = arr[0].logradouroBairro;
                            document.getElementById("txtCondutorCidade").value = arr[0].logradouroCidade;
                            document.getElementById("txtCondutorEstado").value = arr[0].logradouroEstado;
                            logradouroCodigo = arr[0].logradouroCodigo;
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
        
  
        
        function limparDador()
        {
            
            
        }
        
        function cadastrarCondutor()
                {
                    var nomeCondutor = document.getElementById("txtCondutorNome").value;
                    var cpfCondutor = document.getElementById("txtCondutorCpf").value;
                    var habilitacaoCondutor = document.getElementById("txtCondutorHabilitacao").value;
                    var dataNascimentoCondutor = document.getElementById("txtCondutorNascimento").value;
                    var numeroLogradouroCondutor = document.getElementById("txtCondutorNumeroLogradouro").value;
  
                    if((nomeCondutor || cpfCondutor || habilitacaoCondutor || dataNascimentoCondutor || numeroLogradouroCondutor || logradouroCodigo) === "")
                    {
                        alert("Preenchimento obrigatório");
                    }
                    else
                    {
                        xmlHttpRequest = getXMLHttpRequest();
                        xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "cadastroCondutor");
                        xmlHttpRequest.open("POST","ServletCadastrarCondutor",true);
                        xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
                        xmlHttpRequest.send("nomeCondutor=" + nomeCondutor + "&" + "cpfCondutor=" + cpfCondutor + "&" + "habilitacaoCondutor=" + habilitacaoCondutor + "&" + "dataNascimentoCondutor=" + dataNascimentoCondutor + "&" + "numeroLogradouroCondutor=" + numeroLogradouroCondutor + "&" + "idLogradouro=" + logradouroCodigo);    
                    }
                }
        
        </script>
                     
    </body>
</html>
