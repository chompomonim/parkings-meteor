Template.hello.greeting = ->
    return "Welcome to parkings."

Template.hello.events
    'click input': ->
        if typeof console != 'undefined'
            console.log "You pressed the button"
