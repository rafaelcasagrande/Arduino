<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Tag</title>
    </head>
    <body>
        <div align="center" class="container">
            <h1> Tag </h1>   
            <form role="form" class="form-inline">
                <input style="width: 300px;" class="form-control" placeholder="ID" type="text" id="txtTagId" name="txtTagId"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Emplacamento do Veículo" type="text" onblur="buscarEmplacamento()" id="txtPlacaVeiculo" name="txtPlacaVeiculo"><br>
                <br>
                <label> Marca: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtMarcaVeiculo" name="txtMarcaVeiculo"><br><br>
                <label> Modelo: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtModeloVeiculo" name="txtModeloVeiculo"><br><br>
                <label> Cor: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtCorVeiculo" name="txtCorVeiculo"><br><br>
                <label> Ano: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtAnoVeiculo" name="txtAnoVeiculo"><br><br>
                <label> Condutor: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtCondutorResponsavel" name="txtCondutorResponsavel"><br><br>
                <label> CPF: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtCondutorCpf" name="txtCondutorCpf"><br><br>

                <button type="button" class="btn btn-default" id="btnTagSalvar" name="btnTagSalvar" onclick="cadastrarTag()" >
                    Salvar <span class="glyphicon glyphicon-floppy-disk"></span>
                </button>
                
                <button type="button" class="btn btn-default" id="btnTagLimpar" name="btnTagLimpar" onclick="limparCampos()">
                    Limpar <span class="glyphicon glyphicon-trash"></span>
                </button>
                
                <button type="button" onclick="direcionarInicio()" class="btn btn-default" id="btnTagVoltar" name="btnTagVoltar">
                    Voltar <span class="glyphicon glyphicon-arrow-left"></span>
                </button>
            </form>
        </div>
        <script src="javascript/XMLHTTPRequest.js"> </script>
        <script src="javascript/cadastroTag.js"></script>
    </body>
</html>
