Template.imported_data.parkings = ->
    return Parkings.find({}, {limit: 10})
