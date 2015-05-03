<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tag</title>
    </head>
    <body>
        <div align="center" class="form-inline  container">
            <h1>Tag</h1>
            
            <input style="width: 300px;" class="form-control" placeholder="Tag ID" type="text" id="txtTagIdBuscar" name="txtTagIdBuscar">            

            <button type="button" onclick="buscarTag()" class="btn btn-default" name="btnPesquisar" id="btnPesquisar">
                <span class="glyphicon glyphicon-search"></span>
            </button>
            
            <button type="button" onclick="atualizar()" class="btn btn-default" name="btnAtualizar" id="btnAtualizar">
                <span class="glyphicon glyphicon-refresh"></span>
            </button>
            
            
            <br>
            <br>
            
            <table id="tableTag" class="table table-striped" >
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
            <form role="form">
                
                <div class="row">
                    <div class="col-md-3">
                        <label> Tag ID: </label> <input class="form-control" type="text" id="txtTagId" name="txtTagId"><br><br>
                        <label> Placa: </label> <input class="form-control" type="text" onblur="buscarEmplacamento()" id="txtPlacaVeiculo" name="txtPlacaVeiculo"><br>
                    </div>
                    <div class="col-md-3">
                        <label> Marca: </label> <input disabled class="form-control" type="text" id="txtMarcaVeiculo" name="txtMarcaVeiculo"><br><br>
                        <label> Modelo: </label> <input disabled class="form-control" type="text" id="txtModeloVeiculo" name="txtModeloVeiculo"><br><br>
                        <label> Cor: </label> <input disabled class="form-control" type="text" id="txtCorVeiculo" name="txtCorVeiculo"><br>
                    </div>  
                    <div class="col-md-3">
                        <label> Ano: </label> <input disabled class="form-control" type="text" id="txtAnoVeiculo" name="txtAnoVeiculo"><br><br>
                        <label> Condutor: </label> <input disabled class="form-control" type="text" id="txtCondutorResponsavel" name="txtCondutorResponsavel"><br><br>
                        <label> CPF: </label> <input disabled class="form-control" type="text" id="txtCondutorCpf" name="txtCondutorCpf"><br>
                    </div>
                    <div class="col-md-3">
                        <button type="button" onclick="alterarDadosTag()" class="btn btn-default" name="btnTagSalvar" id="btnTagSalvar">
                            Salvar <span class="glyphicon glyphicon-floppy-disk"></span>
                        </button>
                        <button type="button" onclick="limparCampos()" class="btn btn-default" name="btnTagLimpar" id="btnTagLimpar">
                            Limpar <span class="glyphicon glyphicon-trash"></span>
                        </button>   
                        <button type="button" onclick="direcionarInicio()" class="btn btn-default" name="btnTagVoltar" id="btnTagVoltar">
                            Voltar <span class="glyphicon glyphicon-arrow-left"></span>
                        </button>
                    </div>
                </div>
            </form>
        </div>

        <script src="javascript/XMLHTTPRequest.js"> </script>
        <script src="javascript/listarTag.js"> </script>
        
    </body>
</html>
