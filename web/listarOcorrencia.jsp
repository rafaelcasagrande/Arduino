<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ocorrência</title>
    </head>
    <body>
        <div align="center" class="form-inline">
            <h1>Ocorrência</h1>

            <input style="width: 300px;" class="form-control" placeholder="Código Ocorrência" type="text" onblur="buscarOcorrencia()" id="txtOcorrenciaCodigo" name="txtOcorrenciaCodigo">            
            <button type="button" onclick="atualizar()" class="btn btn-default" name="btnAtualizar" id="btnAtualizar">
                Atualizar
            </button>
            <br>
            <br>

            <table id="tableOcorrencia" border="1" >
                <tr>
                    <th> Código </th>
                    <th> Placa </th>
                    <th> Modelo </th>
                    <th> Marca </th>
                    <th> Ano </th>
                    <th> Cor </th>
                    <th> Status </th>
                    <th> Início </th>
                    <th> Término </th>
                    <th> Alterar </th>
                    <th> Excluir </th>
                </tr>
            </table>
            <br>
            <form role="form">
                <input disabled style="width: 300px;" class="form-control" placeholder="Código Ocorrência" type="text" id="txtCodigoOcorrencia" name="txtCodigoOcorrencia"><br>
                <input style="width: 300px;" class="form-control" placeholder="Emplacamento do Veículo" type="text" onblur="buscarEmplacamento()" id="txtPlacaVeiculo" name="txtPlacaVeiculo"><br>
                <br>
                <input type="checkbox" name="chkFinalizarOcorrencia" id="chkFinalizarOcorrencia" value="Finalizar"> Encerrar Ocorrência<br>
                <br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Marca" type="text" id="txtMarcaVeiculo" name="txtMarcaVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Modelo" type="text" id="txtModeloVeiculo" name="txtModeloVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Cor" type="text" id="txtCorVeiculo" name="txtCorVeiculo"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Ano" type="text" id="txtAnoVeiculo" name="txtAnoVeiculo"><br>
                
                <button type="button" onclick="alterarDadosOcorrencia()" class="btn btn-default" name="btnOcorrenciaSalvar" id="btnOcorrenciaSalvar">
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
        <script src="javascript/listarOcorrencia.js"> </script>
        
    </body>
</html>
