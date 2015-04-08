var map;
var arrayListSensores;
var points = new Array();

require(["esri/map", "dojo/domReady!", "dojo/dom", "esri/dijit/PopupTemplate", "esri/graphic", "esri/geometry/Point", "dojo/_base/array", "esri/symbols/SimpleMarkerSymbol", "esri/Color", "esri/InfoTemplate"], function(Map, dom, PopupTemplate, Graphic, Point, arrayUtils, SimpleMarkerSymbol, Color, InfoTemplate) {
  map = new Map("mapDiv",{
           basemap: "streets",
           center: [ -45.88719,  -23.17924 ],
           zoom: 3,
         });
  
   
  dojo.connect(map, "onLoad", mapLoaded);
  
    function mapLoaded()
    {
        iniciarMapa();
        
        function iniciarMapa()
        {
            var markerSymbol2 = new SimpleMarkerSymbol();
            markerSymbol2.setColor(new Color("#00FFFF"));
  
            for(var i = 0; i < 3; i++) 
            {
                var point = new esri.geometry.Point("-45", "-23");
                var graphic = new Graphic(point, markerSymbol2);
                map.centerAt(point);
                map.graphics.add(graphic);
             }
        }
    }
    
    function createSymbol(color){
           var markerSymbol = new esri.symbol.SimpleMarkerSymbol();
           markerSymbol.setColor(new dojo.Color(color));
           return markerSymbol;
         };
  
});
/*
function listarSensores()
{
   xmlHttpRequest = getXMLHttpRequest();
   xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "listarSensor");
   xmlHttpRequest.open("POST","ServletListarSensor",false);
   xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
   xmlHttpRequest.send(null);  
}

function getReadyStateHandler(xmlHttpRequest, tipo) {
    return function() {
        if (xmlHttpRequest.readyState == 4) {
            if (xmlHttpRequest.status == 200) {

                var respostaServlet = xmlHttpRequest.responseText;

                if(tipo === "listarSensor")
                {
                    arrayListSensores = JSON.parse(respostaServlet);
                    for (var i = 0; i < arrayListSensores.length; i++)
                    {
                        var coordenadas = {
                            sensorCodigo: arrayListSensores[i].sensorCodigo,
                            sensorMacAddress: arrayListSensores[i].sensorMacAddress,
                            logradouroCep: arrayListSensores[i].logradouroCep,
                            logradouroNome: arrayListSensores[i].logradouroNome,
                            sensorNumeroLogradouro: arrayListSensores[i].sensorNumeroLogradouro,
                            bairroNome: arrayListSensores[i].bairroNome,
                            cidadeNome: arrayListSensores[i].cidadeNome,
                            estadoNome: arrayListSensores[i].estadoNome,
                            x: arrayListSensores[i].sensorLatitude,
                            y: arrayListSensores[i].sensorLongitude};

                        points[i] = coordenadas;
                    }
                }
            } else {
                        alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
                    }
                }
            };
        }
        */