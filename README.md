## Usage
```coffeescript

# provide callbacks
onReady = () -> console.log "READY!"
onHover = (utcOffset, tzNames) -> console.log "HOVER!", arguments
onSelected = (olsonName, utcOffset, tzName) -> console.log "SELECTED!", arguments

# instantiate component
tz = new nanobox.TimezonePicker $("body"), {path: "/path/to/assets", timezone:"UTC", onReady: onReady, onHover: onHover; onSelected: onSelected}
tz.build()

```

## Options
| Option | Description | Default action/value |
|---|---|---|
| path | the root most path to [tz_json](https://github.com/dosx/timezone-picker#setup) and [tzdata](https://github.com/mde/timezone-js#setup) | **required** |
| timezone | the current timezone to set once instantiated | UTC |
| onReady | Callback for "onReady" events | Set current timezone |
| onHover | Callback for "onHover" events | none
| onSelected | Callback for "onSelected" events | Update time display |
