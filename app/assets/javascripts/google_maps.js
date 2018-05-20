var map;
var infoWindow;
var service;
let directionsDisplay;
let route;

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 59.916303, lng: 10.760242},
        zoom: 13
    });
}

function rute(list, bounds) {
    removeLine();
    lines = [];
    for(let i = 0; i< list.length; i++){
        lines.push({lat: list[i][0], lng: list[i][1]})
    }

    marker = new google.maps.Marker({
            position: {lat: list[0][0], lng: list[0][1]},
            title: 'A',
            map: map
    });
    marker = new google.maps.Marker({
        position: {lat: list[list.length-1][0], lng: list[list.length-1][1]},
        title: 'B',
        map: map
    });
    route = new google.maps.Polyline({
        path: lines,
        geodesic: true,
        strokeColor: '#984843',
        strokeOpacity: 1.0,
        strokeWeight: 5
    });

    northeast = new google.maps.LatLng(bounds.northeast.lat, bounds.northeast.lng);
    southwest = new google.maps.LatLng(bounds.southwest.lat, bounds.southwest.lng);
    bounds = new google.maps.LatLngBounds();
    bounds.extend(northeast);
    bounds.extend(southwest);
    map.fitBounds(bounds);
    map.setCenter(bounds.getCenter());
    route.setMap(map);
}

function removeLine() {
    if(route != null){
        route.setMap(null);
    }
}

function locateUser(id) {
    navigator.geolocation.getCurrentPosition(function(position) {
        document.getElementById(id).value = position.coords.latitude + "," + position.coords.longitude;
    });
}