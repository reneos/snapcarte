import leaflet from 'leaflet';
import logo from '../images/marker.svg'

const fitMapToMarkers = (map, markers) => {
  const bounds = L.latLngBounds();
  markers.forEach(marker => bounds.extend([ marker.lat, marker.lng ]));
  map.fitBounds(bounds);
};


const initMapbox = () => {
  const mapElement = document.getElementById('map');
  var path = logo;

  if (mapElement) {
    // get the markers
    const markers = JSON.parse(mapElement.dataset.markers);
    var mymap = L.map('map').setView([51.505, -0.09], 13);
    var snapIcon = L.icon({
      iconUrl: path,

      iconSize:     [60, 60], // size of the icon
      shadowSize:   [0, 0], // size of the shadow
      iconAnchor:   [30, 30], // point of the icon which will correspond to marker's location
      shadowAnchor: [4, 62],  // the same for the shadow
      popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
    });
    const token = mapElement.dataset.mapboxApiKey;
    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      maxZoom: 18,
      id: 'mapbox/streets-v11',
      tileSize: 512,
      zoomOffset: -1,
      accessToken: token,
    }).addTo(mymap);

    // add the mearkers to the map
    markers.forEach((marker) => {
      L.marker([marker.lat, marker.lng], {icon: snapIcon}).addTo(mymap);
    });


    fitMapToMarkers(mymap, markers);
  }
};

export { initMapbox };

