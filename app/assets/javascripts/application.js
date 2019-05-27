// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

var markers = [];
var map, infoWindow, marker, i, lat, lng, myCoords, mapOptions, bounds;
function initMap2() {
    lat = document.getElementById('atraccion_latitude').value;
    lng = document.getElementById('atraccion_longitude').value;
    
    // if not defined create default position
    if (!lat || !lng){
        lat=-33.460192;
        lng=-70.662270;
        document.getElementById('atraccion_latitude').value = lat;
        document.getElementById('atraccion_longitude').value = lng;
    }
    myCoords = new google.maps.LatLng(lat, lng);
    mapOptions = {
    center: myCoords,
    zoom: 17
    };
    map = new google.maps.Map(document.getElementById('map2'), mapOptions);
    marker = new google.maps.Marker({
        position: myCoords,
        animation: google.maps.Animation.DROP,
        map: map,
        draggable: true
    });
    markers.push(marker);
    // refresh marker position and recenter map on marker
    function refreshMarker(){
        lat = document.getElementById('atraccion_latitude').value;
        lng = document.getElementById('atraccion_longitude').value;
        myCoords = new google.maps.LatLng(lat, lng);
        marker.setPosition(myCoords);
        map.setCenter(marker.getPosition());   
    }
    // when input values change call refreshMarker
    document.getElementById('atraccion_latitude').onchange = refreshMarker;
    document.getElementById('atraccion_longitude').onchange = refreshMarker;
    // when marker is dragged update input values
    marker.addListener('drag', function() {
        latlng = marker.getPosition();
        newlat=(Math.round(latlng.lat()*1000000))/1000000;
        newlng=(Math.round(latlng.lng()*1000000))/1000000;
        document.getElementById('atraccion_latitude').value = newlat;
        document.getElementById('atraccion_longitude').value = newlng;
    });
    // When drag ends, center (pan) the map on the marker position
    marker.addListener('dragend', function() {
        map.panTo(marker.getPosition());   
    });
}
function initMap(lat, lng) {
    lat=-33.460192;
    lng=-70.662270;
    myCoords = new google.maps.LatLng(lat, lng);
    bounds = new google.maps.LatLngBounds();
    mapOptions = {
    center: myCoords,
    zoom: 17
    };
    infoWindow = new google.maps.InfoWindow;
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][0], markers[i][1]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map
        });
    }
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          var pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };
          infoWindow.setPosition(pos);
          infoWindow.setContent('Estas Aqui!');
          infoWindow.open(map);
          map.setCenter(pos);
        }, function() {
          handleLocationError(true, infoWindow, map.getCenter());
        });
    } else {
        handleLocationError(false, infoWindow, map.getCenter());
    }
    function handleLocationError(browserHasGeolocation, infoWindow, pos) {
      infoWindow.setPosition(pos);
      infoWindow.setContent(browserHasGeolocation ?
                            'Error: El Servicio de Geolocalizacion fallo.' :
                            'Error: Tu navegador no posee soporte para geolocalizacion.');
      infoWindow.open(map);
    }
}