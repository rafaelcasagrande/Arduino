
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="http://js.arcgis.com/3.8/js/dojo/dijit/themes/claro/claro.css">
        <link rel="stylesheet" href="http://js.arcgis.com/3.8/js/esri/css/esri.css">
    </head>
    <body>
        <script src="javascript/XMLHTTPRequest.js"></script>
        <script src="javascript/cadastroSensor.js"></script>
        <script src="http://js.arcgis.com/3.8/"></script>
        <script>
            
            var locator, map, endereco;
        require([
              "esri/map", "esri/tasks/locator", 
              "esri/SpatialReference", "esri/graphic",
              "esri/symbols/SimpleLineSymbol", "esri/symbols/SimpleMarkerSymbol",
              "esri/symbols/Font", "esri/symbols/TextSymbol",
              "esri/geometry/Point", "esri/geometry/Extent",
              "esri/geometry/webMercatorUtils",
              "dojo/_base/array", "dojo/_base/Color",
              "dojo/number", "dojo/parser", "dojo/dom", "dojo/json", "dijit/registry",

              "dijit/form/Button", "dijit/form/Textarea",
              "dijit/layout/BorderContainer", "dijit/layout/ContentPane", "dojo/domReady!"
        ], function(
                
              Map, Locator, 
              SpatialReference, Graphic,
              SimpleLineSymbol, SimpleMarkerSymbol, 
              Font, TextSymbol, 
              Point, Extent,
              webMercatorUtils,
              arrayUtils, Color,
              number, parser, dom, JSON, registry
        ) {
          parser.parse();

          locator = new Locator("http://geocode.arcgis.com/arcgis/rest/services/World/GeocodeServer");

          registry.byId("locate").on("click", locate);

          //Draw and zoom to the result when the geocoding is complete                
          locator.on("address-to-locations-complete", function(evt) {

            showResults(evt.addresses);
          });

          function showResults(results) {
              arrayUtils.forEach(results, function(result) {             
              var longitude = result.location.x.toFixed(5);
              var latitude = result.location.y.toFixed(5);

              document.getElementById("txtSensorLatitude").value = latitude;
              document.getElementById("txtSensorLongitude").value = longitude;

              throw BreakException;                
            });
          }

          //Perform the geocode. This function runs when the "Locate" button is pushed.            
          function locate() {
              endereco = (document.getElementById("txtSensorLogradouro").value + ", " + document.getElementById("txtNumeroLogradouro").value + ", " + document.getElementById("txtSensorCidade").value + ", " + document.getElementById("txtSensorEstado").value + ", Brasil");
              alert(endereco);
            var address = {
               SingleLine: endereco
            };
            var options = {
              address: address,
              outFields: ["*"]
            };
            //optionally return the out fields if you need to calculate the extent of the geocoded point
            locator.addressToLocations(options);
          }
        });


            
        </script>
        
        <div align="center">
            <h1> Sensor </h1>   
            <form role="form" class="form-inline">                
                <input style="width: 300px;" class="form-control" placeholder="Mac Address" type="text" id="txtSensorMacAddress" name="txtSensorMacAddress"><br>
                <br>
                <input style="width: 300px;" class="form-control" onblur="consultarCep()" placeholder="CEP" type="text" id="txtSensorCep" name="txtSensorCep"><br>
                <input style="width: 300px;" class="form-control" placeholder="Numero Logradouro" type="text" id="txtNumeroLogradouro" name="txtNumeroLogradouro"><br>
                <input disabled style="width: 300px;" class="form-control" placeholder="Logradouro" type="text" id="txtSensorLogradouro" name="txtSensorLogradouro"><br> 
                <input disabled style="width: 300px;" class="form-control" placeholder="Bairro" type="text" id="txtSensorBairro" name="txtSensorBairro"><br> 
                <input disabled style="width: 300px;" class="form-control" placeholder="Cidade" type="text" id="txtSensorCidade" name="txtSensorCidade"><br> 
                <input disabled style="width: 300px;" class="form-control" placeholder="Estado" type="text" id="txtSensorEstado" name="txtSensorEstado"><br> 
                <br>
                <input style="width: 300px;" class="form-control" placeholder="Latitude" type="text" id="txtSensorLatitude" name="txtSensorLatitude"><br>
                <input style="width: 300px;" class="form-control" placeholder="Longitude" type="text" id="txtSensorLongitude" name="txtSensorLongitude"><br>
                <br>
                <button id="locate" data-dojo-type="dijit/form/Button"> Locate </button> 
                
                <br>
                <button type="button" onclick="cadastrarSensor()" class="btn btn-default" name="btnSensorSalvar" id="btnSensorSalvar">
                    Salvar
                </button>    
                <button type="button" class="btn btn-default" name="btnSensorLimpar" id="btnSensorLimpar">
                    Limpar
                </button>
                <button type="button" class="btn btn-default" name="btnSensorVoltar" id="btnSensorVoltar">
                    Voltar
                </button>
            </form>
        </div>
    </body>
</html>
