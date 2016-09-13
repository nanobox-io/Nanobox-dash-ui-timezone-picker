component = require 'jade/component'

#
class TimezonePicker

  #
  constructor: ($el, @options={}) ->

    # missing path
    if !@options.path then console.error "Missing /path/to timezone data!";

    #
    @$node = $(component())
    $el.append @$node

  #
  build : () ->

    # add svg icons
    castShadows(@$node)

    #
    @$tzp = @$node.find("#zonepicker")

    # there is a known issue with the map api, where when it starts display:none
    # it renders weird... this will fix it if needed, however, we're only rendering
    # this view if the timezone of 'optModel' != UTC, so this is not needed atm.
    # google.maps.event.trigger(@$tzp, 'resize')

    #
    @$tzp.timezonePicker
      jsonRootUrl: "#{@options.path}/tz_json/"
      mapOptions:
        zoom: 2
        maxZoom: 5
        minZoom: 2
        centerLat: 0
        centerLng: 0
        panControl: false
        mapTypeControl: false
        streetViewControl: false

      # set the current timezone and call provided call back if any
      onReady: =>

        #
        timezone = @options.timezone

        #
        switch

          # if no timezone is provided try to set to local timezone
          when !timezone
            @$tzp.timezonePicker('selectZone', moment.tz.guess())

          # if UTC set display to UTC; this has to be done manually for now because
          # timezone picker doesn't support "UTC"
          when timezone == "UTC"
            @$node.find(".timezone").html("UTC")
            @$node.find(".timezone-time").html(moment().utc().format("hh:mm a"))

          # if there is a timezone then set it
          else @$tzp.timezonePicker('selectZone', timezone)

        # call provided callback
        @options.onReady?()

      # call provided callback if any
      onHover: (utcOffset, tzNames) => @options.onHover?(utcOffset, tzNames)

      # update the display for the selected timezone then call provided callback
      # if any
      onSelected : (olsonName, utcOffset, tzName) =>
        tz_time = moment()
        tz_time.milliseconds(tz_time.milliseconds() - (tz_time.utcOffset() - utcOffset) * 60 * 1000)

        # update the display for the selected timezone
        @$node.find(".timezone").html("#{olsonName} - #{tzName}")
        @$node.find(".timezone-time").html(tz_time.format("hh:mm a"))

        # call provided callback
        @options.onSelected?(olsonName, utcOffset, tzName)

    # return the timezone element
    return @$tzp

#
window.nanobox ||= {}
nanobox.TimezonePicker = TimezonePicker
