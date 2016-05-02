example = require 'jade/example'

class TimezonePicker

  constructor: ($el) ->
    data  = { message: 'Live long and prosper.', source:'(See app/coffee/main.coffee)' }
    $node = $ example( data )
    $el.append $node

window.nanobox ||= {}
nanobox.TimezonePicker = TimezonePicker
