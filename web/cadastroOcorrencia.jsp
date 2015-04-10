<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Ocorrência</title>
    </head>
    <body>
        <div align="center">
            <h1> Ocorrência </h1>   
            <form role="form" class="form-inline">
                <input style="width: 300px;" class="form-control" placeholder="Emplacamento do Veículo" type="text" onblur="buscarEmplacamento()" id="txtPlacaVeiculo" name="txtPlacaVeiculo"><br>
                <br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Marca" type="text" id="txtMarcaVeiculo" name="txtMarcaVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Modelo" type="text" id="txtModeloVeiculo" name="txtModeloVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Cor" type="text" id="txtCorVeiculo" name="txtCorVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Ano" type="text" id="txtAnoVeiculo" name="txtAnoVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Condutor Responsável" type="text" id="txtCondutorResponsavel" name="txtCondutorResponsavel"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="CPF Condutor" type="text" id="txtCondutorCpf" name="txtCondutorCpf"><br>
                
                <button type="button" onclick="cadastrarOcorrencia()" class="btn btn-default" name="btnOcorrenciaSalvar" id="btnOcorrenciaSalvar">
                    Salvar
                </button>    
                
                <button type="button" class="btn btn-default" name="btnOcorrenciaLimpar" id="btnOcorrenciaLimpar">
                    Limpar
                </button>    
                
                <button type="button" class="btn btn-default" name="btnOcorrenciaVoltar" id="btnOcorrenciaVoltar">
                    Voltar
                </button>            
            </form>
        </div>
        <script src="javascript/XMLHTTPRequest.js"> </script>
        <script src="javascript/cadastroOcorrencia.js"></script>
    </body>
</html>
