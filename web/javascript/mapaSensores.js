     window.onload = listarSensores();
     var points = new Array();
     var map;
  
      require([
        "esri/map", "esri/dijit/PopupTemplate", "esri/geometry/Point", 
        "esri/graphic",
        "dojo/_base/array", "dojo/dom-style", 
        "dojo/domReady!", "esri/dijit/Popup"
      ], function(
        Map, PopupTemplate, Point,
        Graphic,
        arrayUtils, domStyle,  Popup
      ) {

        map = new Map("map",{
          basemap: "streets",
          center: [ -45.88719,  -23.19924 ],
          zoom: 13,
          minZoom: 2
        });
        
        map.on("load", mapLoaded);
      
        function mapLoaded(){
            var iconPath = "M4.135,16.762c3.078,0,5.972,1.205,8.146,3.391c2.179,2.187,3.377,5.101,3.377,8.202h4.745c0-9.008-7.299-16.335-16.269-16.335V16.762zM4.141,8.354c10.973,0,19.898,8.975,19.898,20.006h4.743c0-13.646-11.054-24.749-24.642-24.749V8.354zM10.701,25.045c0,1.815-1.471,3.287-3.285,3.287s-3.285-1.472-3.285-3.287c0-1.813,1.471-3.285,3.285-3.285S10.701,23.231,10.701,25.045z";
            var initColor = "#3300FF";
            arrayUtils.forEach(points, function(point) {
            var template = new PopupTemplate({title: "<font color='blue'><b>Código do Sensor: </b></font><b>" + point.sensorCodigo + "</b>", description: "<b> MacAddress: </b>" + point.sensorMacAddress + "<br> <b> CEP: </b>" + point.logradouroCep + "<br><b>Logradouro: </b>" + point.logradouroNome + "<br><b>Bairro: </b>" + point.bairroNome + "<br><b>Cidade: </b>" + point.cidadeNome + "<br><b>Estado: </b>" + point.estadoNome});        
            var graphic = new Graphic(new Point(point.coordenadas), createSymbol(iconPath, initColor));
            graphic.setInfoTemplate(template);
            map.graphics.add(graphic);
          });
        }
        function createSymbol(path, color){
          var markerSymbol = new esri.symbol.SimpleMarkerSymbol();
          markerSymbol.setPath(path);
          markerSymbol.setColor(new dojo.Color(color));
          markerSymbol.setOutline(null);
          return markerSymbol;
        }
      });

function listarSensores()
{
   xmlHttpRequest = getXMLHttpRequest();
   xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "listarSensor");
   xmlHttpRequest.open("POST","ServletListarSensor",true);
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
                        var metadados = {
                            sensorCodigo: arrayListSensores[i].sensorCodigo,
                            sensorMacAddress: arrayListSensores[i].sensorMacAddress,
                            logradouroCep: arrayListSensores[i].logradouroCep,
                            logradouroNome: arrayListSensores[i].logradouroNome,
                            sensorNumeroLogradouro: arrayListSensores[i].sensorNumeroLogradouro,
                            bairroNome: arrayListSensores[i].bairroNome,
                            cidadeNome: arrayListSensores[i].cidadeNome,
                            estadoNome: arrayListSensores[i].estadoNome,
                            coordenadas: [arrayListSensores[i].sensorLongitude, arrayListSensores[i].sensorLatitude]};

                        points[i] = metadados;
                    }
                }
            } else {
                        alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
                    }
                }
            };
        }
        