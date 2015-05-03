<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center" class="form-inline  container">  
        
            <h1>Veículo</h1>

            <input style="width: 300px;" class="form-control" placeholder="Placa" type="text" id="txtPlacaVeiculoBuscar" name="txtPlacaVeiculoBuscar">            
  
            <button type="button" onclick="buscarVeiculo()" class="btn btn-default" name="btnPesquisar" id="btnPesquisar">
                <span class="glyphicon glyphicon-search"></span>
            </button>
            
            <button type="button" onclick="atualizar()" class="btn btn-default" name="btnAtualizar" id="btnAtualizar">
                <span class="glyphicon glyphicon-refresh"></span>
            </button>
            
            
            <br>
            <br>
            
            <table id="tableVeiculos" class="table table-striped">
                <tr>
                    <th> Código </th>
                    <th> Placa </th>
                    <th> Ano </th>
                    <th> Modelo </th>
                    <th> Marca </th>
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
                        <label> Placa: </label> <input class="form-control" type="text" id="txtVeiculoPlaca" name="txtVeiculoPlaca"><br><br>
                        <label> Cor: </label> <input class="form-control" type="text" id="txtVeiculoCor" name="txtVeiculoCor"><br><br>
                        <label> Ano: </label> <input class="form-control" type="text" id="txtVeiculoAno" name="txtVeiculoAno"><br><br>
                    </div>
                    
                    <div class="col-md-3">    
                        <label> Marca: </label>
                        <select id="cbxMarca" onchange="listarModelos('listarModeloSemFiltro')" >  
                        </select>
                        <br>
                        <label> Modelo: </label>
                        <select id="cbxModelo" name="cbxModelo" >
                        </select>
                        <br>
                        <label> Documento: </label>
                        <select id="cbxDocumento" >
                            <option value="cpf" > CPF </option>
                            <option value="habilitacao" > Habilitação </option>
                        </select>
                        
                        <input class="form-control" placeholder="Condutor" type="text" onblur="buscarCondutor()" id="txtDocumentoCondutor" name="txtCondutor"><br>            
                    </div>
                    
                    <div class="col-md-3">   
                        <label> Condutor:  </label> <input disabled class="form-control" type="text" id="txtNomeCondutor" name="txtNomeCondutor"><br> 
                        <br>
                        <label> D. Nascimento: </label> <input disabled class="form-control" type="text"  id="txtDataNascimentoCondutor" name="txtDataNascimentoCondutor"><br> 
                        <br>
                        <label> Documento: </label> <input disabled class="form-control" type="text" id="txtDocumentoCondutorResultado" name="txtDocumentoCondutorResultado"><br> 
                    </div>
                    
                    <div class="col-md-3">   
                        
                        
                        <button type="button" onclick="alterarDadosVeiculo()" class="btn btn-default" name="btnVeiculoSalvar" id="btnVeiculoSalvar">
                            Salvar <span class="glyphicon glyphicon-floppy-disk"></span>
                        </button>
                        <button type="button" onclick="limparCampos()" class="btn btn-default" name="btnVeiculoLimpar" id="btnVeiculoLimpar">
                            Limpar <span class="glyphicon glyphicon-trash"></span>
                        </button>   
                        <button type="button" onclick="direcionarInicio()" class="btn btn-default" name="btnVeiculoVoltar" id="btnVeiculoVoltar">
                            Voltar <span class="glyphicon glyphicon-arrow-left"></span>
                        </button>
     
                    </div>
                </div>
                
            </form>
        </div>
        <script src="javascript/XMLHTTPRequest.js"> </script>  
        <script src="javascript/listarVeiculo.js"></script>
    </body>
</html>
