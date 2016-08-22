window.init = () ->
  tz = new nanobox.TimezonePicker $("body"), {path: "./assets"}
  tz.build()
