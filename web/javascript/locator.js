      
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

          registry.byId("btnLocate").on("click", locate);

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


   
