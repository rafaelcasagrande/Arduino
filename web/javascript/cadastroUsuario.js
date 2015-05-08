/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


    function cadastrarUsuario()
    {
   
        var usuarioLogin = document.getElementById("txtUsuarioLogin").value;  
        var usuarioSenha = document.getElementById("txtUsuarioSenha").value; 
        
        xmlHttpRequest = getXMLHttpRequest();
        xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "cadastroUsuario");
        xmlHttpRequest.open("POST","ServletCadastrarUsuario",true);
        xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttpRequest.send("usuarioLogin=" + usuarioLogin + "&" + "usuarioSenha=" + usuarioSenha); 
    }
    
    function validarUsuario()
    {
        var usuarioLogin = document.getElementById("txtUsuarioLogin").value;  
        
        xmlHttpRequest = getXMLHttpRequest();
        xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "validarUsuario");
        xmlHttpRequest.open("POST","ServletVerificarUsername",true);
        xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttpRequest.send("usuarioLogin=" + usuarioLogin); 
    }
    
    function validarSenha()
    {
        var usuarioSenha = document.getElementById("txtUsuarioSenha").value;
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

                if(tipo === 'cadastroUsuario')
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
                else if(tipo === 'validarUsuario')
                {
                    if(respostaServlet === 'false')
                    {
                        alert("Usuário já cadastrado");
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
            document.getElementById("txtUsuarioSenha").value = ""; 
            document.getElementById("txtUsuarioConfirmaSenha").value = "";
        }
        
        function direcionarInicio()
        {
            window.location = "index.jsp";
        }