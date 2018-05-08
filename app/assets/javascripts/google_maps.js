var map;
var infoWindow;
var service;
let directionsDisplay;
let route;

function places() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 59.916303, lng:10.760242},
        zoom: 14
    });

    var request = {
        location: map.center,
        radius: '500',
        type: ['cafe']
    };

    infoWindow = new google.maps.InfoWindow();
    service = new google.maps.places.PlacesService(map);
    service.nearbySearch(request, callback);

    function callback(results, status) {
        if (status == google.maps.places.PlacesServiceStatus.OK) {
            for (var i = 0; i < results.length; i++) {
                var place = results[i];
                addMarker(place);
            }
        }
    }

    function addMarker(place) {
        var marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function() {
            var request = {placeId: place.place_id};

            service.getDetails(request, function(result, status) {
                if (status !== google.maps.places.PlacesServiceStatus.OK) {
                    console.error(status);
                    return;
                }
                infoWindow.setContent(result.name);
                infoWindow.open(map, marker);
            });
        });
    }
}

function calculateRoute() {
    let origin = document.getElementById('from').value;
    let destination = document.getElementById('to').value;
    let directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer();

    let map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 59.916303, lng: 10.760242},
        zoom: 13
    });
    directionsDisplay.setMap(map);

    let request = {
        origin: origin,
        destination: destination,
        travelMode: 'TRANSIT',
        provideRouteAlternatives: true
    };
    directionsService.route(request, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
            console.log(response);
        }
    });
}

function setRoute(rute) {
    let directions = directionsDisplay.directions;
    for(let i = 0; i < directions.routes.length; i++){
        for(let j = 0; j < directions.routes[i].legs[0].steps.length; j++){
            if(directions.routes[i].legs[0].steps[j].travel_mode == 'TRANSIT'){
                if(directions.routes[i].legs[0].steps[j].transit.line.short_name == rute){
                    directionsDisplay.setRouteIndex(i);
                    return;
                }
            }
            if(directions.routes[i].legs[0].steps[j].travel_mode == 'WALKING' && directions.routes[i].legs[0].steps.length == 1){
                directionsDisplay.setRouteIndex(i);
                return;
            }
        }
    }
}

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 59.916303, lng: 10.760242},
        zoom: 13
    });
}

function drawLine(geo) {
    list = [];
    for(let i = 0; i < geo.length; i++){
        rute(google.maps.geometry.encoding.decodePath(geo[i]));
    }
}

function rute(list) {
    console.log(list);
    route = new google.maps.Polyline({
        path: list,
        geodesic: true,
        strokeColor: '#FF0000',
        strokeOpacity: 1.0,
        strokeWeight: 2
    });
    route.setMap(map);
}

function removeLine() {
    if(route != null){
        route.setMap(null);
    }
}

function drawRoute(markers) {
    list = [];
    for(let i = 0; i < markers.length; i++){
        list.push({ 'lat': markers[i]['lat'], 'lng': markers[i]['lon'] });
    }
    route = new google.maps.Polyline({
        path: list,
        geodesic: true,
        strokeColor: '#FF0000',
        strokeOpacity: 1.0,
        strokeWeight: 2
    });
    route.setMap(map);
}