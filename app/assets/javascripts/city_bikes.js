function city_bikes(lat, lng, markers) {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: lat, lng: lng},
        zoom: 14
    });
    infoWindow = new google.maps.InfoWindow();
    for(let i = 0; i < markers.length; i++){
        console.log(markers[i]);
        let marker = new google.maps.Marker({
            map: map,
            position: {lat: markers[i].Center.Latitude, lng: markers[i].Center.Longitude }
        });
    }
}