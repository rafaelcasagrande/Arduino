/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


    function alterarUsuario()
    {
   
        var usuarioLogin = document.getElementById("txtUsuarioLogin").value;  
        var usuarioSenhaAntiga = document.getElementById("txtUsuarioSenhaAntiga").value; 
        var usuarioSenhaNova = document.getElementById("txtUsuarioSenhaNova").value; 

        xmlHttpRequest = getXMLHttpRequest();
        xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "alteraUsuario");
        xmlHttpRequest.open("POST","ServletAlterarUsuario",true);
        xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttpRequest.send("usuarioLogin=" + usuarioLogin + "&" + "usuarioSenhaAntiga=" + usuarioSenhaAntiga + "&" + "usuarioSenhaNova=" + usuarioSenhaNova);   
    }

    function validarSenha()
    {
        var usuarioSenha = document.getElementById("txtUsuarioSenhaNova").value;
        var usuarioConfirmaSenha = document.getElementById("txtUsuarioConfirmaSenha").value;
        
        if(usuarioSenha !== usuarioConfirmaSenha)
        {
            alert("Validar senha informada");
        }
    }

    function getReadyStateHandler(xmlHttpRequest, tipo) {
    // an anonymous function returned
    // it listens to the XMLHttpRequest instance
    return function() {
        if (xmlHttpRequest.readyState == 4) {
            if (xmlHttpRequest.status == 200) {

                var respostaServlet = xmlHttpRequest.responseText;

                if(tipo === 'alteraUsuario')
                {
                    if(respostaServlet === 'true')
                    {
                        alert("Operação realizada com sucesso");
                    }
                    else
                    {
                        alert("Falha ao realizar a operação");
                    } 
                }
            } else {
                        alert("Falha ao realizar operação");
                    }
                }
            };
        }
        
        function limparCampos()
        {
            document.getElementById("txtUsuarioLogin").value = "";  
            document.getElementById("txtUsuarioSenhaAntiga").value = ""; 
            document.getElementById("txtUsuarioSenhaNova").value = ""; 
            document.getElementById("txtUsuarioConfirmaSenha").value = ""; 
        }
        
        function direcionarInicio()
        {
            window.location = "index.jsp";
        }