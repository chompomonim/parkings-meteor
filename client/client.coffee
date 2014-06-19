Template.imported_data.parkings = ->
    return Parkings.find({}, {limit: 10})

Template.maps.rendered = ->
    GoogleMaps.init
        sensor: true
    , ->
        center = new google.maps.LatLng(37.77040275, -122.44512989)
        mapOptions =
            zoom: 12
            mapTypeId: google.maps.MapTypeId.MAP

        window.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
        window.map.setCenter center

Template.maps.events
    'click input': ->
        markers = []
        places = Parkings.find()
        places.forEach (place) ->
            c = place.COORDINATES.replace(/[() ]/g, '').split(',')
            coord = new google.maps.LatLng(parseFloat(c[0]), parseFloat(c[1]))
            marker = new google.maps.Marker(
                position: coord
                title: place.LOCATION
            )
            markers.push marker

            console.log "Added: " + place.LOCATION

        markerCluster = new MarkerClusterer(window.map, markers)
