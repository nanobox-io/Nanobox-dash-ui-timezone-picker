window.init = () ->

  #
  onReady = () -> console.log "READY!"

  #
  onHover = (utcOffset, tzNames) -> console.log "HOVER!", arguments

  #
  onSelected = (olsonName, utcOffset, tzName) -> console.log "SELECTED!" # set timezone

  #
  tz = new nanobox.TimezonePicker $("body"), {path: "/assets", timezone:"UTC", onReady: onReady, onHover: onHover; onSelected: onSelected}
  tz.build()
