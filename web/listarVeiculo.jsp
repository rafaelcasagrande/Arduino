<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">  
        
            <h1>Veículo</h1>

            <table id="tableVeiculos" border="1">
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
            
            <form role="form" class="form-inline">
                
                <input style="width: 300px;" class="form-control" placeholder="Placa" type="text" id="txtVeiculoPlaca" name="txtVeiculoPlaca"><br>
                <input style="width: 300px;" class="form-control" placeholder="Cor" type="text" id="txtVeiculoCor" name="txtVeiculoCor"><br> 
                <input style="width: 300px;" class="form-control" placeholder="Ano" type="text" id="txtVeiculoAno" name="txtVeiculoAno"><br> 
                
                <select id="cbxMarca" onchange="listarModelos('listarModeloSemFiltro')" >  
                </select>
                
                <select id="cbxModelo" name="cbxModelo" >
                </select>
                
                <br>
                
                <select id="cbxDocumento" >
                    <option value="cpf" > CPF </option>
                    <option value="habilitacao" > Habilitação </option>
                </select>
                
                <input style="width: 300px;" class="form-control" placeholder="Condutor" type="text" onblur="buscarCondutor()" id="txtDocumentoCondutor" name="txtCondutor"><br>            
                <br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Condutor" type="text" id="txtNomeCondutor" name="txtNomeCondutor"><br> 
                <br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Data Nascimento" type="text"  id="txtDataNascimentoCondutor" name="txtDataNascimentoCondutor"><br> 
                <br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Documento" type="text" id="txtDocumentoCondutorResultado" name="txtDocumentoCondutorResultado"><br> 
                <br>
                
                <button type="button" class="btn btn-default" id="btnCondutorSalvar" name="btnCondutorSalvar" onclick="alterarDadosVeiculo()" >
                    Salvar
                </button>
                
                <button type="button" class="btn btn-default" id="btnCondutorLimpar" name="btnCondutorLimpar">
                    Limpar
                </button>
                
                <button type="button" class="btn btn-default" id="btnCondutorVoltar" name="btnCondutorVoltar">
                    Voltar
                </button>
                
            </form>
        </div>
        <script src="javascript/XMLHTTPRequest.js"> </script>  
        <script src="javascript/listarVeiculo.js"></script>
    </body>
</html>
