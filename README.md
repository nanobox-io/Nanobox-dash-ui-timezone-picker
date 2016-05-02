window.init = () ->

  #
  onReady = () -> console.log "READY!"

  #
  onHover = (utcOffset, tzNames) -> console.log "HOVER!", arguments

  #
  onSelected = (olsonName, utcOffset, tzName) ->
    tz_time = new Date()
    tz_time.setTime(tz_time.getTime() + (tz_time.getTimezoneOffset() + utcOffset) * 60 * 1000)

    console.log "SELECTED!", olsonName, tz_time, new timezoneJS.Date(olsonName).getTimezoneAbbreviation()

    # @get('optModel').set('timezone', olsonName)
    # @get('optModel').set('timezone_time', Batman.Filters.formatTime(tz_time))
    # @get('optModel').set('timezone_code', new timezoneJS.Date(olsonName).getTimezoneAbbreviation())

  #
  tz = new nanobox.TimezonePicker $("body"), {path: "/assets", timezone:"UTC", onReady: onReady, onHover: onHover; onSelected: onSelected}
  tz.build()
