const lineFunction =()=>{
    var mymap = L.map('mapdiv').setView([60.48766393352326, 15.432541419024044], 11);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(my map);
    // creating points                      
    var Icon = L.icon({
    iconUrl: 'img/marker.jpg',
    iconSize:     [32, 37], // size of the icon
    iconAnchor:   [32, 37], // point of the icon which will correspond to marker's location
    popupAnchor:  [0, -30] // point from which the popup should open relative to the iconAnchor
    });
                
    //popup and marking
    popb = L.marker([60.4852327018974, 15.431717849073978],{icon: Icon}).addTo(mymap).bindPopup('Intro to Leaflet');
                
    popf= L.marker([60.4852327018974, 15.431717849073978], {icon: Icon}).addTo(mymap).bindPopup("<h3>Högskolan Dalarna</h3><img src= 'img/dalarna.jpg'width='250px'>")
                
    // creating line 
    var latlngs = [
		[60.486837810106934, 15.434540868927648],
		[60.486180173018475, 15.433682683300683],
		[60.48541448086314, 15.4323798670811],
        [60.485296951499194, 15.431802012966001]
			];

	var polyline = L.polyline(latlngs, {color: 'blue'}).addTo(mymap).
    bindPopup("<h3>Way from Vattugatan2 to Hogskolan Dalarna</h3>");
                    
    //creating polygon
    // POLYGON
    var myPolygon = L.polygon([
        [60.48631704111917, 15.433995016128767],
        [60.486800133808984, 15.434565793474656],
        [60.4866444805017, 15.435350483252181],
        [60.48622165309678, 15.434357395402316]
        ], {
            color: 'red',
            fillColor: 'red',
            fillOpacity: 0.4
            }).addTo(mymap).bindPopup("<h3>ARC Fastighetspartner AB</h3><img src='img/vattugatan2.jpg' width='200px'>");

}

export default lineFunction