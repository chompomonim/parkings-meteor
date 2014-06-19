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

        map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)
        map.setCenter center
