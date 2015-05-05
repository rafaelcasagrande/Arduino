<!DOCTYPE html>
<html>
    <head>    
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Cadastrar Condutor</title>
    </head>
    <body>
        <div align="center" class="container">
            <form role="form" class="form-inline">
                <h1> Cadastrar Condutor </h1>   
                <input style="width: 300px;" class="form-control" placeholder="Nome" type="text" id="txtCondutorNome" name="txtCondutorNome"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="CPF" type="text" id="txtCondutorCpf" name="txtCondutorCpf"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Habilitação" type="text" id="txtCondutorHabilitacao" name="txtCondutorHabilitacao"><br><br> 
                <input style="width: 300px;" class="form-control" placeholder="Data de Nascimento" type="text" id="txtCondutorNascimento" name="txtCondutorNascimento"><br><br> 
                <input style="width: 300px;" class="form-control" placeholder="Numero Logradouro" type="text" id="txtCondutorNumeroLogradouro" name="txtCondutorNumeroLogradouro"><br><br> 
                <input style="width: 300px;" class="form-control" placeholder="CEP" type="text" id="txtCondutorCep" name="txtCondutorCep" onblur="consultarCep()" ><br><br>

                <label> Logradouro: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtCondutorLogradouro" name="txtCondutorLogradouro"><br><br> 
                <label> Bairro: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtCondutorBairro" name="txtCondutorBairro"><br><br> 
                <label> Cidade: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtCondutorCidade" name="txtCondutorCidade"><br><br> 
                <label> Estado: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtCondutorEstado" name="txtCondutorEstado"><br><br> 

                <button type="button" onclick="cadastrarCondutor()" class="btn btn-default" name="btnCondutorSalvar" id="btnCondutorSalvar">
                    Salvar <span class="glyphicon glyphicon-floppy-disk"></span>
                </button>
                <button type="button" onclick="limparCampos()" class="btn btn-default" name="btnCondutorLimpar" id="btnCondutorLimpar">
                    Limpar <span class="glyphicon glyphicon-trash"></span>
                </button>   
                <button type="button" onclick="direcionarInicio()" class="btn btn-default" name="btnCondutorVoltar" id="btnCondutorVoltar">
                    Voltar <span class="glyphicon glyphicon-arrow-left"></span>
                </button>
            </form>
        </div>
        <script src="javascript/XMLHTTPRequest.js"></script>
        <script src="javascript/cadastroCondutor.js"> </script>          
    </body>
</html>
