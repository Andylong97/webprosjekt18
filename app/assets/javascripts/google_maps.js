
function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 59.916303, lng: 10.760242},
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
        travelMode: google.maps.DirectionsTravelMode.TRANSIT
    };
    directionsService.route(request, function(response, status) {
        if (status == 'OK') {
            directionsDisplay.setDirections(response);
        }
    });
}

function ruterTravel1() {
    let origin = document.getElementById('from').value;
    let destination = document.getElementById('to').value;
    let url = 'http://reisapi.ruter.no/Travel/GetTravels?fromPlace=' + origin + '&toPlace=' + destination + '&isafter=true';
    let xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", url, true ); // false for synchronous request
    xmlHttp.send( null );
    document.getElementById('ruter').value = xmlHttp.responseText;
    console.log(xmlHttp.responseText);
}

function ruterTravel() {
    let origin = document.getElementById('from').value;
    let destination = document.getElementById('to').value;
    let xhttp = new XMLHttpRequest();
    let url = 'http://reisapi.ruter.no/Travel/GetTravels?fromPlace=3010011&toPlace=3010011&isafter=true';
    xhttp.open("GET", url, true);
    xhttp.setRequestHeader("Content-type", "application/json");
    xhttp.send();
    let response = JSON.parse(xhttp.responseText);
}