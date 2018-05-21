function city_bikes(lat, lng, markers, translate, text) {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: lat, lng: lng},
        zoom: 15
    });
    let icon = {
        path: 'M512.509 192.001c-16.373-.064-32.03 2.955-46.436 8.495l-77.68-125.153A24 24 0 0 0 368.001 64h-64c-8.837 0-16 7.163-16 16v16c0 8.837 7.163 16 16 16h50.649l14.896 24H256.002v-16c0-8.837-7.163-16-16-16h-87.459c-13.441 0-24.777 10.999-24.536 24.437.232 13.044 10.876 23.563 23.995 23.563h48.726l-29.417 47.52c-13.433-4.83-27.904-7.483-42.992-7.52C58.094 191.83.412 249.012.002 319.236-.413 390.279 57.055 448 128.002 448c59.642 0 109.758-40.793 123.967-96h52.033a24 24 0 0 0 20.406-11.367L410.37 201.77l14.938 24.067c-25.455 23.448-41.385 57.081-41.307 94.437.145 68.833 57.899 127.051 126.729 127.719 70.606.685 128.181-55.803 129.255-125.996 1.086-70.941-56.526-129.72-127.476-129.996zM186.75 265.772c9.727 10.529 16.673 23.661 19.642 38.228h-43.306l23.664-38.228zM128.002 400c-44.112 0-80-35.888-80-80s35.888-80 80-80c5.869 0 11.586.653 17.099 1.859l-45.505 73.509C89.715 331.327 101.213 352 120.002 352h81.3c-12.37 28.225-40.562 48-73.3 48zm162.63-96h-35.624c-3.96-31.756-19.556-59.894-42.383-80.026L237.371 184h127.547l-74.286 120zm217.057 95.886c-41.036-2.165-74.049-35.692-75.627-76.755-.812-21.121 6.633-40.518 19.335-55.263l44.433 71.586c4.66 7.508 14.524 9.816 22.032 5.156l13.594-8.437c7.508-4.66 9.817-14.524 5.156-22.032l-44.468-71.643a79.901 79.901 0 0 1 19.858-2.497c44.112 0 80 35.888 80 80-.001 45.54-38.252 82.316-84.313 79.885z',
        fillColor: '#984843',
        fillOpacity: 0.8,
        scale: 0.05,
        strokeWeight: 1
    };

    let uni = {
        path: 'M496 128v16a8 8 0 0 1-8 8h-24v12c0 6.627-5.373 12-12 12H60c-6.627 0-12-5.373-12-12v-12H24a8 8 0 0 1-8-8v-16a8 8 0 0 1 4.941-7.392l232-88a7.996 7.996 0 0 1 6.118 0l232 88A8 8 0 0 1 496 128zm-24 304H40c-13.255 0-24 10.745-24 24v16a8 8 0 0 0 8 8h464a8 8 0 0 0 8-8v-16c0-13.255-10.745-24-24-24zM96 192v192H60c-6.627 0-12 5.373-12 12v20h416v-20c0-6.627-5.373-12-12-12h-36V192h-64v192h-64V192h-64v192h-64V192H96z',
        fillColor: '#984843',
        fillOpacity: 0.8,
        scale: 0.07,
        strokeWeight: 1
    };
    let infoWindow = new google.maps.InfoWindow();
    bounds = new google.maps.LatLngBounds();
    let campus = new google.maps.Marker({
        map: map,
        position: { lat: lat, lng: lng },
        icon: uni
    });
    google.maps.event.addListener(campus, 'click', function() {
        infoWindow.setContent(text);
        infoWindow.open(map, campus);
    });

    for(let i = 0; i < markers.length; i++){
        let bikes = markers[i].Availability.Bikes;
        let marker = new google.maps.Marker({
            map: map,
            position: { lat: markers[i].Center.Latitude, lng: markers[i].Center.Longitude },
            icon: icon
        });
        google.maps.event.addListener(marker, 'click', function() {
            infoWindow.setContent('' + translate + ': ' + bikes);
            infoWindow.open(map, marker);
        })
    }
}

function places(lat, long, text) {
    map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: lat, lng: long },
        zoom: 15
    });

    let request = {
        location: map.center,
        radius: '350',
        type: ['cafe']
    };

    let cafe = {
        path: 'M192 384h192c53 0 96-43 96-96h32c70.6 0 128-57.4 128-128S582.6 32 512 32H120c-13.3 0-24 10.7-24 24v232c0 53 43 96 96 96zM512 96c35.3 0 64 28.7 64 64s-28.7 64-64 64h-32V96h32zm47.7 384H48.3c-47.6 0-61-64-36-64h583.3c25 0 11.8 64-35.9 64z',
        fillColor: '#984843',
        fillOpacity: 0.8,
        scale: 0.05,
        strokeWeight: 1
    };

    let uni = {
        path: 'M496 128v16a8 8 0 0 1-8 8h-24v12c0 6.627-5.373 12-12 12H60c-6.627 0-12-5.373-12-12v-12H24a8 8 0 0 1-8-8v-16a8 8 0 0 1 4.941-7.392l232-88a7.996 7.996 0 0 1 6.118 0l232 88A8 8 0 0 1 496 128zm-24 304H40c-13.255 0-24 10.745-24 24v16a8 8 0 0 0 8 8h464a8 8 0 0 0 8-8v-16c0-13.255-10.745-24-24-24zM96 192v192H60c-6.627 0-12 5.373-12 12v20h416v-20c0-6.627-5.373-12-12-12h-36V192h-64v192h-64V192h-64v192h-64V192H96z',
        fillColor: '#984843',
        fillOpacity: 0.8,
        scale: 0.07,
        strokeWeight: 1
    };
    let infoWindow = new google.maps.InfoWindow();
    bounds = new google.maps.LatLngBounds();
    let campus = new google.maps.Marker({
        map: map,
        position: { lat: lat, lng: long },
        icon: uni
    });
    google.maps.event.addListener(campus, 'click', function() {
        infoWindow.setContent(text);
        infoWindow.open(map, campus);
    });

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
            position: place.geometry.location,
            icon: cafe
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
        fjerdingen: { lat: 59.916114    , lng: 10.759968 },
        vulkan: { lat: 59.923312, lng: 10.752354 },
        brennerivegen: { lat: 59.920133, lng: 10.752595 },
        kvadraturen: { lat: 59.910980, lng: 10.745589 },
    };
    let uni = {
        path: 'M496 128v16a8 8 0 0 1-8 8h-24v12c0 6.627-5.373 12-12 12H60c-6.627 0-12-5.373-12-12v-12H24a8 8 0 0 1-8-8v-16a8 8 0 0 1 4.941-7.392l232-88a7.996 7.996 0 0 1 6.118 0l232 88A8 8 0 0 1 496 128zm-24 304H40c-13.255 0-24 10.745-24 24v16a8 8 0 0 0 8 8h464a8 8 0 0 0 8-8v-16c0-13.255-10.745-24-24-24zM96 192v192H60c-6.627 0-12 5.373-12 12v20h416v-20c0-6.627-5.373-12-12-12h-36V192h-64v192h-64V192h-64v192h-64V192H96z',
        fillColor: '#984843',
        fillOpacity: 0.8,
        scale: 0.07,
        strokeWeight: 1
    };
    let infoWindow = new google.maps.InfoWindow();
    bounds = new google.maps.LatLngBounds();
    let fjerdingen = new google.maps.Marker({
        map: map,
        position: { lat: campus.fjerdingen.lat, lng: campus.fjerdingen.lng },
        icon: uni
    });
    google.maps.event.addListener(fjerdingen, 'click', function() {
        infoWindow.setContent('Campus Fjerdingen');
        infoWindow.open(map, fjerdingen);
    });
    bounds.extend(new google.maps.LatLng(campus.fjerdingen.lat, campus.fjerdingen.lng));
    let vulkan = new google.maps.Marker({
        map: map,
        position: { lat: campus.vulkan.lat, lng: campus.vulkan.lng },
        icon: uni
    });
    google.maps.event.addListener(vulkan, 'click', function() {
        infoWindow.setContent('Campus Vulkan');
        infoWindow.open(map, vulkan);
    });
    bounds.extend(new google.maps.LatLng(campus.vulkan.lat, campus.vulkan.lng));
    let brennerivegen = new google.maps.Marker({
        map: map,
        position: { lat: campus.brennerivegen.lat, lng: campus.brennerivegen.lng },
        icon: uni
    });
    google.maps.event.addListener(brennerivegen, 'click', function() {
        infoWindow.setContent('Campus Brennerivegen');
        infoWindow.open(map, brennerivegen);
    });
    bounds.extend(new google.maps.LatLng(campus.brennerivegen.lat, campus.brennerivegen.lng));
    let kvadraturen = new google.maps.Marker({
        map: map,
        position: { lat: campus.kvadraturen.lat, lng: campus.kvadraturen.lng },
        icon: uni
    });
    google.maps.event.addListener(kvadraturen, 'click', function() {
        infoWindow.setContent('Campus Kvadraturen');
        infoWindow.open(map, kvadraturen);
    });
    bounds.extend(new google.maps.LatLng(campus.kvadraturen.lat, campus.kvadraturen.lng));
    map.fitBounds(bounds);
    map.setCenter(bounds.getCenter());
}