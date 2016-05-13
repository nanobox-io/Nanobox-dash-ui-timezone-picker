component = require 'jade/component'

#
class TimezonePicker

  #
  constructor: ($el, @options={}) ->

    # missing path
    if !@options.path then console.error "Missing /path/to timezone data!";

    # set defaults
    if !@options.logsEnabled then @options.logsEnabled = false
    if !@options.loglevel then @options.logLevel = "INFO"

    #
    noop = () -> console.warn "No callback provided"
    @onReady = @options.onReady || noop
    @onHover = @options.onHover || noop
    @onSelected = @options.onSelected || noop

    #
    @$node = $(component())
    $el.append @$node

    # add svg icons
    castShadows($(".shadow-parent"))

  #
  build : () ->

    #
    timezoneJS.timezone.zoneFileBasePath = "#{@options.path}/tz/";
    timezoneJS.timezone.init()

    #
    @tzp = @$node.find("#zonepicker")

    # there is a known issue with the map api, where when it starts display:none
    # it renders weird... this will fix it if needed, however, we're only rendering
    # this view if the timezone of 'optModel' != UTC, so this is not needed atm.
    # google.maps.event.trigger(@tzp, 'resize')

    #
    @tzp.timezonePicker
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

      #
      onReady: =>

        #
        timezone = @options.timezone

        #
        switch

          # if no timezone is provided try to set to local timezone
          when !timezone
            @tzp.timezonePicker('selectZone', moment.tz.guess()); @onReady()

          # if UTC set display to UTC; this has to be done manually for now because
          # timezone picker doesn't support "UTC"
          when timezone == "UTC"
            @$node.find(".timezone").html("UTC")
            @$node.find(".timezone-time").html(moment().utc().format("hh:mm a"))

          # if there is a timezone then set it
          else @tzp.timezonePicker('selectZone', timezone); @onReady()

      #
      onHover: (utcOffset, tzNames) => @onHover(utcOffset, tzNames)

      #
      onSelected : (olsonName, utcOffset, tzName) =>
        tz_time = moment()
        tz_time.milliseconds(tz_time.milliseconds() - (tz_time.utcOffset() - utcOffset) * 60 * 1000)

        # update the display for the selected timezone
        @$node.find(".timezone").html("#{olsonName} - #{new timezoneJS.Date(olsonName).getTimezoneAbbreviation()}")
        @$node.find(".timezone-time").html(tz_time.format("hh:mm a"))

        #
        @onSelected(olsonName, utcOffset, tzName)

#
window.nanobox ||= {}
nanobox.TimezonePicker = TimezonePicker
