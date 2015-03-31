
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Condutor</title>
    </head>
    <body>
        
        <div align="center">
            <h1> Cadastrar Condutor </h1>   
            <form role="form" class="form-inline" method="GET" action="ServletConsultaEndereco">
                <input style="width: 300px;" class="form-control" placeholder="Nome" type="text" id="txtCondutorNome" name="txtCondutorNome"><br>
                <input style="width: 300px;" class="form-control" placeholder="CPF" type="text" id="txtCondutorCpf" name="txtCondutorCpf"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Habilitação" type="text" id="txtCondutorHabilitacao" name="txtCondutorHabilitacao"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Data de Nascimento" type="text" id="txtCondutorNascimento" name="txtCondutorNascimento"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Numero Logradouro" type="text" id="txtCondutorNumeroLogradouro" name="txtCondutorNumeroLogradouro"><br> 
                <input style="width: 300px;" class="form-control" placeholder="CEP" type="text" id="txtCondutorCep" name="txtCondutorCep"><br>
                
                <button type="submit" class="btn btn-default" name="btnCondutorConsultarCep" id="btnCondutorConsultarCep"> Consultar </button><br>
                
                <input style="width: 300px;" class="form-control" placeholder="Estado" type="text" id="txtCondutorEstado" name="txtCondutorEstado" value="${logradouro.getBairro().getCidade().getEstado().getEstadoNome()}"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Logradouro" type="text" id="txtCondutorLogradouro" name="txtCondutorLogradouro" value="${logradouro.getLogradouroNome()}" ><br> 
                <input style="width: 300px;" class="form-control" placeholder="Bairro" type="text" id="txtCondutorBairro" name="txtCondutorBairro" value="${logradouro.getBairro().getBairroNome()}" ><br> 
                <input style="width: 300px;" class="form-control" placeholder="Cidade" type="text" id="txtCondutorCidade" name="txtCondutorCidade" value="${logradouro.getBairro().getCidade().getCidadeNome()}" ><br> 
                <input style="width: 300px;" class="form-control" placeholder="Estado" type="text" id="txtCondutorEstado" name="txtCondutorEstado" value="${logradouro.getBairro().getCidade().getEstado().getEstadoNome()}"><br> 
            
                <label hidden id="txtIdLogradouro"> ${logradouro.getLogradouroCodigo()} </label>
                
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
                    var idLogradouro = document.getElementById("txtIdLogradouro").value;
                    
                    if((nomeCondutor || cpfCondutor || habilitacaoCondutor || dataNascimentoCondutor || numeroLogradouroCondutor || idLogradouro) === "")
                    {
                        alert("Preenchimento obrigatório");
                    }
                    else
                    {
                        $.get('ServletCadastrarCondutor',{nomeCondutor:nomeCondutor, cpfCondutor:cpfCondutor, habilitacaoCondutor:habilitacaoCondutor, dataNascimentoCondutor:dataNascimentoCondutor, numeroLogradouroCondutor:numeroLogradouroCondutor, idLogradouro:idLogradouro}, function(){
                            alert("Cadastro Realizado com Sucesso.");
                        });
                    }
                }
        
        </script>
                     
    </body>
</html>
