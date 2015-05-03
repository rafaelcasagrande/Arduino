<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Veículo</title>
    </head>
    <body>
        <script src="javascript/XMLHTTPRequest.js"> </script>
        <script src="javascript/cadastroVeiculo.js"> </script>
        
        <div align="center" class="container">
            <h1> Cadastrar Veículo </h1>   
            <form role="form" class="form-inline">              
                <input style="width: 300px;" class="form-control" placeholder="Placa" type="text" id="txtVeiculoPlaca" name="txtVeiculoPlaca"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Cor" type="text" id="txtVeiculoCor" name="txtVeiculoCor"><br><br>
                <input style="width: 300px;" class="form-control" placeholder="Ano" type="text" id="txtVeiculoAno" name="txtVeiculoAno"><br><br>               
                <label> Marca: </label> <select id="cbxMarca" onchange="listarModelos()" >  
                </select>
                <label> Modelo: </label> <select id="cbxModelo" name="cbxModelo" >
                </select>
                <br>
                <br>
                <select id="cbxDocumento" >
                    <option value="cpf" > CPF </option>
                    <option value="habilitacao" > Habilitação </option>
                </select>
                
                <input style="width: 300px;" class="form-control" placeholder="Documento" type="text" onblur="buscarCondutor()" id="txtDocumentoCondutor" name="txtCondutor"><br>            
                <br>
                <label> Nome do Condutor: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtNomeCondutor" name="txtNomeCondutor"><br> 
                <br>
                <label> D. Nascimento: </label> <input disabled style="width: 300px;" class="form-control" type="text"  id="txtDataNascimentoCondutor" name="txtDataNascimentoCondutor"><br> 
                <br>
                <label> Documento: </label> <input disabled style="width: 300px;" class="form-control" type="text" id="txtDocumentoCondutorResultado" name="txtDocumentoCondutorResultado"><br> 
                <br>
                
                <button type="button" class="btn btn-default" id="btnVeiculoSalvar" name="btnVeiculoSalvar" onclick="cadastrarVeiculo()" >
                    Salvar <span class="glyphicon glyphicon-floppy-disk"></span>
                </button>
                
                <button type="button" class="btn btn-default" id="btnVeiculoLimpar" name="btnVeiculoLimpar" onclick="limparCampos()">
                    Limpar <span class="glyphicon glyphicon-trash"></span>
                </button>
                
                <button type="button" onclick="direcionarInicio()" class="btn btn-default" id="btnVeiculoVoltar" name="btnVeiculoVoltar">
                    Voltar <span class="glyphicon glyphicon-arrow-left"></span>
                </button>
            </form>
        </div>
    </body>
</html>
