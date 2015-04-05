
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
                    <th> Código </th>
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

        <script src="javascript/XMLHTTPRequest.js"> </script>  
        <script src="javascript/listarCondutor.js"> </script>
    </body>
</html>
