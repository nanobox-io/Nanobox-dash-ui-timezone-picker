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
| path="" (required) | the root most path to [tz_json](https://github.com/dosx/timezone-picker#setup) and [tzdata](https://github.com/mde/timezone-js#setup) |
| timezone="UTC" | the current timezone to set once instantiated |
| onReady="" (Set current timezone) | Callback for "onReady" events |
| onHover="" | Callback for "onHover" events |
| onSelected="" (Update time display) | Callback for "onSelected" events |
