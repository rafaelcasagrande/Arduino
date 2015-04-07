var map;
require(["esri/map", "dojo/domReady!", "dojo/dom"], function(Map, dom) {
  map = new Map("mapDiv", {
    center: [-56.049, 38.485],
    zoom: 3,
    basemap: "streets"
  });
  
  dojo.connect(map, "onLoad", mapLoaded);
  
    function mapLoaded()
    {
        
    }
  
});