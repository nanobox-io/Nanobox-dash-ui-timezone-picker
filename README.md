## Usage
```coffeescript

# provide callbacks
onReady = () -> console.log "READY!"
onHover = (utcOffset, tzNames) -> console.log "HOVER!", arguments
onSelected = (olsonName, utcOffset, tzName) -> console.log "SELECTED!", arguments

# instantiate component
tz = new nanobox.TimezonePicker $("body"), {path: "/path/to/assets", timezone:"UTC", onReady: onReady, onHover: onHover, onSelected: onSelected}
tz.build()

```

## Options
| Option=default | Description |
|---|---|
| logsEnabled=false | Is logging enabled (T/F) |
| logLevel="INFO" | Selected log level of [available levels](https://github.com/sdomino/dash/blob/master/src/dash.coffee#L8) |
| path="" (required) | the root most path to [tz_json](https://github.com/dosx/timezone-picker#setup) and [tzdata](https://github.com/mde/timezone-js#setup) |
| timezone="UTC" | the current timezone to set once instantiated |
| onReady="" (Set current timezone) | Callback for "onReady" events |
| onHover="" | Callback for "onHover" events |
| onSelected="" (Update time display) | Callback for "onSelected" events |
