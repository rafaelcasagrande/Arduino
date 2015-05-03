
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Condutor</title>
    </head>
    <body>
        <div align="center" class="form-inline container">
            <h1>Condutor</h1>
            
                   
            <br>
            <select id="cbxDocumento" >
                <option value="cpf" > CPF </option>
                <option value="habilitacao" > Habilitação </option>
            </select>
            
            <input style="width: 300px;" class="form-control" placeholder="Condutor" type="text" id="txtDocumentoCondutor" name="txtCondutor">            
            
            <button type="button" onclick="buscarCondutor()" class="btn btn-default" name="btnPesquisar" id="btnPesquisar">
                <span class="glyphicon glyphicon-search"></span>
            </button>
            
            <button type="button" onclick="atualizar()" class="btn btn-default" name="btnAtualizar" id="btnAtualizar">
                <span class="glyphicon glyphicon-refresh"></span>
            </button>
            
            <br>
            <br>
            <table id="tableCondutores" class="table table-striped">
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
            
            <form role="form">
                <div class="row">
                    <div class="col-md-3">
                        <label>Nome: </label> <input class="form-control" type="text" id="txtCondutorNome" name="txtCondutorNome"><br><br>
                        <label>CPF: </label> <input class="form-control" type="text" id="txtCondutorCpf" name="txtCondutorCpf"><br><br>
                        <label>Habilitação: </label> <input class="form-control" type="text" id="txtCondutorHabilitacao" name="txtCondutorHabilitacao"><br> 
                    </div>
                    <div class="col-md-3">
                        <label>D. Nascimento: </label> <input class="form-control" type="text" id="txtCondutorNascimento" name="txtCondutorNascimento"><br><br> 
                        <label>N. Logradouro: </label> <input class="form-control" type="text" id="txtCondutorNumeroLogradouro" name="txtCondutorNumeroLogradouro"><br><br> 
                        <label>CEP: </label> <input class="form-control" onblur="consultarCep()" type="text" id="txtCondutorCep" name="txtCondutorCep" onblur="consultarCep()" ><br>
                    </div>
                    <div class="col-md-3">
                        <label>Logradouro: </label> <input disabled class="form-control" type="text" id="txtCondutorLogradouro" name="txtCondutorLogradouro"><br><br> 
                        <label>Bairro: </label> <input disabled class="form-control" type="text" id="txtCondutorBairro" name="txtCondutorBairro"><br><br> 
                        <label>Cidade: </label> <input disabled class="form-control" type="text" id="txtCondutorCidade" name="txtCondutorCidade"><br><br> 
                        <label>Estado: </label> <input disabled class="form-control" type="text" id="txtCondutorEstado" name="txtCondutorEstado"><br> 
                    </div>
                    <div class="col-md-3">
                        <button type="button" onclick="alterarDadosCondutor()" class="btn btn-default" name="btnCondutorSalvar" id="btnCondutorSalvar">
                            Salvar <span class="glyphicon glyphicon-floppy-disk"></span>
                        </button>
                        <button type="button" onclick="limparCampos()" class="btn btn-default" name="btnCondutorLimpar" id="btnCondutorLimpar">
                            Limpar <span class="glyphicon glyphicon-trash"></span>
                        </button>   
                        <button type="button" onclick="direcionarInicio()" class="btn btn-default" name="btnCondutorVoltar" id="btnCondutorVoltar">
                            Voltar <span class="glyphicon glyphicon-arrow-left"></span>
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <script src="javascript/XMLHTTPRequest.js"> </script>  
        <script src="javascript/listarCondutor.js"> </script>
    </body>
</html>
