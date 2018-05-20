function city_bikes(lat, lng, markers) {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: lat, lng: lng},
        zoom: 15
    });
    infoWindow = new google.maps.InfoWindow();
    for(let i = 0; i < markers.length; i++){
        new google.maps.Marker({
            map: map,
            position: { lat: markers[i].Center.Latitude, lng: markers[i].Center.Longitude }
        });
    }
}

function places(lat, long) {
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: lat, lng: long },
        zoom: 15
    });

    let request = {
        location: map.center,
        radius: '350',
        type: ['cafe']
    };

    infoWindow = new google.maps.InfoWindow();
    service = new google.maps.places.PlacesService(map);
    service.nearbySearch(request, callback);

    function callback(results, status) {
        if (status == google.maps.places.PlacesServiceStatus.OK) {
            for (let i = 0; i < results.length; i++) {
                let place = results[i];
                addMarker(place);
            }
        }
    }

    function addMarker(place) {
        let marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function() {
            let request = {placeId: place.place_id};

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

function campus() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 59.9161644, lng: 10.7574812 },
        zoom: 14
    });
    let campus = {
        fjerdingen: { lat: 59.9161644, lng: 10.7574812 },
        vulkan: { lat: 59.9233168, lng: 10.750039 },
        brennerivegen: { lat: 59.920352, lng: 10.7506041 },
        kvadraturen: { lat: 59.9111398, lng: 10.7450366 },
    };
    bounds = new google.maps.LatLngBounds();
    marker = new google.maps.Marker({
        map: map,
        position: { lat: campus.fjerdingen.lat, lng: campus.fjerdingen.lng }
    });
    bounds.extend(new google.maps.LatLng(campus.fjerdingen.lat, campus.fjerdingen.lng));
    marker = new google.maps.Marker({
        map: map,
        position: { lat: campus.vulkan.lat, lng: campus.vulkan.lng }
    });
    bounds.extend(new google.maps.LatLng(campus.vulkan.lat, campus.vulkan.lng));
    marker = new google.maps.Marker({
        map: map,
        position: { lat: campus.brennerivegen.lat, lng: campus.brennerivegen.lng }
    });
    bounds.extend(new google.maps.LatLng(campus.brennerivegen.lat, campus.brennerivegen.lng));
    marker = new google.maps.Marker({
        map: map,
        position: { lat: campus.kvadraturen.lat, lng: campus.kvadraturen.lng }
    });
    bounds.extend(new google.maps.LatLng(campus.kvadraturen.lat, campus.kvadraturen.lng));
    map.fitBounds(bounds);
    map.setCenter(bounds.getCenter());
}