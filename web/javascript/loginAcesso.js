/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


    function realizarLogin()
    {
   
        var usuarioLogin = document.getElementById("txtUsuarioLogin").value;  
        var usuarioSenha = document.getElementById("txtUsuarioSenha").value; 
        
        xmlHttpRequest = getXMLHttpRequest();
        xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "acessoUsuario");
        xmlHttpRequest.open("POST","ServletAcessarUsuario",true);
        xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttpRequest.send("usuarioLogin=" + usuarioLogin + "&" + "usuarioSenha=" + usuarioSenha); 
    }
    


    function getReadyStateHandler(xmlHttpRequest, tipo) {
    // an anonymous function returned
    // it listens to the XMLHttpRequest instance
    return function() {
        if (xmlHttpRequest.readyState == 4) {
            if (xmlHttpRequest.status == 200) {

                var respostaServlet = xmlHttpRequest.responseText;

                if(tipo === 'acessoUsuario')
                {
                    if(respostaServlet === 'false')
                    {
                        alert("Login e/ou senha inválidos");
                    }
                    else
                    {
                        window.location = "cadastroCondutor.jsp";
                    }

                }
            } else {
                        alert("Falha ao realizar operação");
                    }
                }
            };
        }
