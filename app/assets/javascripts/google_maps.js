
function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 59.916303, lng:10.760242},
        zoom: 13
    });

    new google.maps.Marker({
       map: map,
       position: {lat: 59.916303, lng: 10.760242}
    });
}

function calculateRoute() {
    let origin = document.getElementById('from').value;
    let destination = document.getElementById('to').value;
    let mode = document.getElementById('mode').value;
    let directionsService = new google.maps.DirectionsService();
    let directionsDisplay = new google.maps.DirectionsRenderer();

    let map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 59.916303, lng: 10.760242},
        zoom: 13
    });
    directionsDisplay.setMap(map);

    let request = {
        origin: origin,
        destination: destination,
        travelMode: 'TRANSIT',
        transitOptions: {
            modes: [mode]
        },
        provideRouteAlternatives: false
    };
    directionsService.route(request, function(response, status) {
        if (status == 'OK') {
            directionsDisplay.setDirections(response);
        }
    });
}

function getTravel() {
    let origin = document.getElementById('from').value;
    let destination = document.getElementById('to').value;
    let url = '/route_info?origin=' + origin + '&destination=' + destination;
    let xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", url, true ); // false for synchronous request
    xmlHttp.send();
}

function routeInfo() {
    let origin = document.getElementById('from').value;
    let destination = document.getElementById('to').value;
    let url = 'https://maps.googleapis.com/maps/api/directions/json?origin=' + origin + '&destination=' + destination + '&key=AIzaSyDeuhvsD4Oh7u3UNHNmrdtLvlDpdg1uygE';
    let xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", url, true ); // false for synchronous request
    xmlHttp.send();
    console.log(xmlHttp.responseType);
    document.getElementById('ruter').innerHTML = xmlHttp.responseType;

}

function ruterTravel() {
    let origin = document.getElementById('from').value;
    let destination = document.getElementById('to').value;
    let xhttp = new XMLHttpRequest();
    let url = 'https://maps.googleapis.com/maps/api/directions/json?origin=' + origin + '&destination=' + destination + '&key=AIzaSyDeuhvsD4Oh7u3UNHNmrdtLvlDpdg1uygE';
    xhttp.open("GET", url, true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.setRequestHeader('Access-Control-Allow-Origin', '*');
    xhttp.send( null );
    document.getElementById('ruter').innerHTML = xhttp.response;
}