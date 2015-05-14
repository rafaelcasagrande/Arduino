<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ocorrência</title>
    </head>
    <body>
        <div align="center" class="form-inline  container">
            <h1>Ocorrência</h1>

            <input style="width: 300px;" class="form-control" placeholder="Código Ocorrência" type="text" id="txtOcorrenciaCodigo" name="txtOcorrenciaCodigo">            
           
            <button type="button" onclick="buscarOcorrencia()" class="btn btn-default" name="btnPesquisar" id="btnPesquisar">
                <span class="glyphicon glyphicon-search"></span>
            </button>
            
            <button type="button" onclick="atualizar()" class="btn btn-default" name="btnAtualizar" id="btnAtualizar">
                <span class="glyphicon glyphicon-refresh"></span>
            </button>
            <br>
            <br>

            <table id="tableOcorrencia" class="table table-striped" >
                <tr>
                    <th> Código </th>
                    <th> Placa </th>
                    <th> Modelo </th>
                    <th> Marca </th>
                    <th> Ano </th>
                    <th> Cor </th>
                    <th> Status </th>
                    <th> Início </th>
                    <th> Alterar </th>
                    <th> Excluir </th>
                </tr>
            </table>
            <br>
            <form role="form">
                <div class="row">
                    <div class="col-md-4">
                        <label> Código: </label> <input disabled  class="form-control" type="text" id="txtCodigoOcorrencia" name="txtCodigoOcorrencia"><br><br>
                        <label> Placa: </label> <input class="form-control" type="text" onblur="buscarEmplacamento()" id="txtPlacaVeiculo" name="txtPlacaVeiculo"><br>
                        <br>
                        <input type="checkbox" name="chkFinalizarOcorrencia" id="chkFinalizarOcorrencia" value="Finalizar"> Encerrar Ocorrência<br>
                    </div>
                    <div class="col-md-4">
                        <label> Marca: </label> <input disabled class="form-control" type="text" id="txtMarcaVeiculo" name="txtMarcaVeiculo"><br><br>
                        <label> Modelo: </label> <input disabled class="form-control" type="text" id="txtModeloVeiculo" name="txtModeloVeiculo"><br><br>
                        <label> Cor: </label> <input disabled class="form-control" type="text" id="txtCorVeiculo" name="txtCorVeiculo"><br><br>
                        <label> Ano: </label> <input disabled class="form-control" type="text" id="txtAnoVeiculo" name="txtAnoVeiculo"><br>
                    </div>
                    <div class="col-md-4">
                           
                        <button type="button" onclick="alterarDadosOcorrencia()" class="btn btn-default" name="btnOcorrenciaSalvar" id="btnOcorrenciaSalvar">
                            Salvar <span class="glyphicon glyphicon-floppy-disk"></span>
                        </button>
                        <button type="button" onclick="limparCampos()" class="btn btn-default" name="btnOcorrenciaLimpar" id="btnOcorrenciaLimpar">
                            Limpar <span class="glyphicon glyphicon-trash"></span>
                        </button>   
                        <button type="button" onclick="direcionarInicio()" class="btn btn-default" name="btnOcorrenciaVoltar" id="btnOcorrenciaVoltar">
                            Voltar <span class="glyphicon glyphicon-arrow-left"></span>
                        </button>
   
                    </div>
                </div>
            </form>
        </div>

        <script src="javascript/XMLHTTPRequest.js"> </script>
        <script src="javascript/listarOcorrencia.js"> </script>
        
    </body>
</html>
