<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tag</title>
    </head>
    <body>
        <div align="center">
            <h1>Tag</h1>
            <table id="tableTag" border="1" >
                <tr>
                    <th> Código </th>
                    <th> Id </th>
                    <th> Placa </th>
                    <th> Modelo </th>
                    <th> Marca </th>
                    <th> Ano </th>
                    <th> Cor </th>
                    <th> Condutor </th>
                    <th> CPF </th>
                    <th> Habilitação </th>
                    <th> Alterar </th>
                    <th> Excluir </th>
                </tr>
            </table>
            <br>
            <form role="form" class="form-inline">
                <input style="width: 300px;" class="form-control" placeholder="ID" type="text" id="txtTagId" name="txtTagId"><br>
                <input style="width: 300px;" class="form-control" placeholder="Emplacamento do Veículo" type="text" onblur="buscarEmplacamento()" id="txtPlacaVeiculo" name="txtPlacaVeiculo"><br>
                <br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Marca" type="text" id="txtMarcaVeiculo" name="txtMarcaVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Modelo" type="text" id="txtModeloVeiculo" name="txtModeloVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Cor" type="text" id="txtCorVeiculo" name="txtCorVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Ano" type="text" id="txtAnoVeiculo" name="txtAnoVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Condutor Responsável" type="text" id="txtCondutorResponsavel" name="txtCondutorResponsavel"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="CPF Condutor" type="text" id="txtCondutorCpf" name="txtCondutorCpf"><br>
                
                <button type="button" onclick="alterarDadosTag()" class="btn btn-default" name="btnTagSalvar" id="btnTagSalvar">
                    Salvar
                </button>    
                
                <button type="button" class="btn btn-default" name="btnTagLimpar" id="btnTagLimpar">
                    Limpar
                </button>    
                
                <button type="button" class="btn btn-default" name="btnTagVoltar" id="btnTagVoltar">
                    Voltar
                </button>
            </form>
        </div>

        <script src="javascript/XMLHTTPRequest.js"> </script>
        <script src="javascript/listarTag.js"> </script>
        
    </body>
</html>
