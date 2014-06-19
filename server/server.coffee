Meteor.startup ->
    if Parkings.find().count() is 0
        ctc.AddCsvToCollection "data.csv", Parkings, (jsonArray) ->
            console.log "fetch parkings: "
            console.log Parkings.find().fetch()
