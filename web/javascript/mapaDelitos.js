     window.onload = listarDelitos();
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
            var iconPath = "M28.59,10.781h-2.242c-0.129,0-0.244,0.053-0.333,0.133c-0.716-1.143-1.457-2.058-2.032-2.633c-2-2-14-2-16,0C7.41,8.854,6.674,9.763,5.961,10.898c-0.086-0.069-0.19-0.117-0.309-0.117H3.41c-0.275,0-0.5,0.225-0.5,0.5v1.008c0,0.275,0.221,0.542,0.491,0.594l1.359,0.259c-1.174,2.619-1.866,5.877-0.778,9.14v1.938c0,0.553,0.14,1,0.313,1h2.562c0.173,0,0.313-0.447,0.313-1v-1.584c2.298,0.219,5.551,0.459,8.812,0.459c3.232,0,6.521-0.235,8.814-0.453v1.578c0,0.553,0.141,1,0.312,1h2.562c0.172,0,0.312-0.447,0.312-1l-0.002-1.938c1.087-3.261,0.397-6.516-0.775-9.134l1.392-0.265c0.271-0.052,0.491-0.318,0.491-0.594v-1.008C29.09,11.006,28.865,10.781,28.59,10.781zM7.107,18.906c-1.001,0-1.812-0.812-1.812-1.812s0.812-1.812,1.812-1.812s1.812,0.812,1.812,1.812S8.108,18.906,7.107,18.906zM5.583,13.716c0.96-2.197,2.296-3.917,3.106-4.728c0.585-0.585,3.34-1.207,7.293-1.207c3.953,0,6.708,0.622,7.293,1.207c0.811,0.811,2.146,2.53,3.106,4.728c-2.133,0.236-6.286-0.31-10.399-0.31S7.716,13.952,5.583,13.716zM24.857,18.906c-1.001,0-1.812-0.812-1.812-1.812s0.812-1.812,1.812-1.812s1.812,0.812,1.812,1.812S25.858,18.906,24.857,18.906z";
            var initColor = "#FF0000";
            arrayUtils.forEach(points, function(point) {
            var template = new PopupTemplate({title: "Código da Ocorrência: " + point.ocorrenciaCodigo, description: "<b> Placa do veículo:  </b>" + point.veiculoPlaca + "<br> <b> Marca do Veículo: </b>" + point.marcaNome + "<br> <b> Modelo do Veículo: </b> " + point.modeloNome + "<br> <b> Cor do Veículo: </b>" + point.veiculoCor + "<br> <b> Ano do Veículo: </b>" + point.veiculoAno + "<br> <b> Momento do Registro: </b> " + point.registroMomento + "<br> <b> Logradouro: </b>" + point.logradouroNome + "<br> <b> Bairro: </b>" + point.bairroNome + "<br> <b> Cidade: </b>" + point.cidadeNome + "<br> <b> Estado: </b>" + point.estadoNome});         
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

function listarDelitos()
{
   xmlHttpRequest = getXMLHttpRequest();
   xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest, "listarDelito");
   xmlHttpRequest.open("POST","ServletListarDelito",true);
   xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded", "charset=ISO-8859-1");
   xmlHttpRequest.send(null);  
}

function getReadyStateHandler(xmlHttpRequest, tipo) {
    return function() {
        if (xmlHttpRequest.readyState == 4) {
            if (xmlHttpRequest.status == 200) {

                var respostaServlet = xmlHttpRequest.responseText;

                if(tipo === "listarDelito")
                {
                    arrayListDelitos = JSON.parse(respostaServlet);
                    for (var i = 0; i < arrayListDelitos.length; i++)
                    {

                        var longitudeArray = new Array();
                        longitudeArray = arrayListDelitos[i].sensorLongitude.split(".");
                        var longitude = longitudeArray[0] + "." + longitudeArray[1].substring(0, 4) + (i * 5);
                        
                        var metadados = {
                            ocorrenciaCodigo: arrayListDelitos[i].ocorrenciaCodigo,
                            sensorMacAddress: arrayListDelitos[i].sensorMacAddress,
                            veiculoAno: arrayListDelitos[i].veiculoAno,
                            veiculoCor: arrayListDelitos[i].veiculoCor,
                            veiculoPlaca: arrayListDelitos[i].veiculoPlaca,
                            modeloNome: arrayListDelitos[i].modeloNome,
                            marcaNome: arrayListDelitos[i].marcaNome,
                            registroMomento: arrayListDelitos[i].registroMomento,
                            logradouroCep: arrayListDelitos[i].logradouroCep,
                            logradouroNome: arrayListDelitos[i].logradouroNome,
                            sensorNumeroLogradouro: arrayListDelitos[i].sensorNumeroLogradouro,
                            bairroNome: arrayListDelitos[i].bairroNome,
                            cidadeNome: arrayListDelitos[i].cidadeNome,
                            estadoNome: arrayListDelitos[i].estadoNome,
                            coordenadas: [longitude, arrayListDelitos[i].sensorLatitude]};

                        points[i] = metadados;
                    }
                }
            } else {
                        alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
                    }
                }
            };
        }
        