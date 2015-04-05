
var logradouroCodigo;
var xmlHttpRequest;

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
        